/**************************************************************************/
/*
/**************************************************************************/
#include "osa.h"
#include "serial.h"
#include "rtc.h"
#include "relay.h"
#include "lcd16x2.h"
#include <stdio.h>
#include <stdlib.h>


#define RELAY_TASK_PRIORITY            1
#define LCD_TASK_PRIORITY              1
#define USART_TASK_PRIORITY            1

#define RELAY_MSG_LENGTH               2
#define MAX_STORAGE_TIME               3

#pragma funcall main RELAY_TASK
#pragma funcall main LCD_TASK
#pragma funcall main USART_TASK

void RELAY_TASK(void);
void USART_TASK(void);
void LCD_TASK(void);
bool CompareTime(char sec, char min, char hr, char week_day, char day, char mn, char year, char *Index);
void systick_init();

OST_CSEM Relay_csem;

OST_QUEUE RELAY_QUEUE;
OST_MSG RELAY_MSG_QUEUE[RELAY_MSG_LENGTH];

static char sp_sec[MAX_STORAGE_TIME];
static char sp_min[MAX_STORAGE_TIME];
static char sp_hr[MAX_STORAGE_TIME];
static char sp_weekday[MAX_STORAGE_TIME];
static char sp_day[MAX_STORAGE_TIME];
static char sp_mn[MAX_STORAGE_TIME];
static char sp_year[MAX_STORAGE_TIME];
static char sp_relay[MAX_STORAGE_TIME];

static char currentindex = -1;

int main(void)
{
    Relay_Init();
    lcd16x2_init();
    serial_init();
    RTC_init();
    OS_Init();
    OS_Csem_Create(Relay_csem);
    OS_Queue_Create(RELAY_QUEUE, RELAY_MSG_QUEUE, RELAY_MSG_LENGTH);
    OS_Task_Create(RELAY_TASK_PRIORITY, RELAY_TASK);
    OS_Task_Create(LCD_TASK_PRIORITY, LCD_TASK);
    OS_Task_Create(USART_TASK_PRIORITY, USART_TASK);
    Systick_Init();
    OS_Run();
    while(1);
    return 0;
}
void USART_TASK(void)
{
 char read;
 unsigned char cmd_Type;
 static unsigned char param[8];
 while(1)
 {
   if (serial_dataready())
   {
      read = serial_read();

      if (serial_process_data(read, &cmd_Type, param))
      {
       switch(cmd_Type)
       {
       case RELAY_STATUS_CMD_CODE:
            OS_Csem_Signal(Relay_csem);
            OS_Queue_Send_Now(RELAY_QUEUE, param[0]);
            break;
       case RELAY_OFF_TIME_CMD_CODE:
            currentindex = (currentindex +1) % MAX_STORAGE_TIME;
            sp_sec[currentindex] = param[0];
            sp_min[currentindex] = param[1];
            sp_hr[currentindex] = param[2];
            sp_weekday[currentindex] = 0;
            sp_day[currentindex] = 0;
            sp_mn[currentindex] = 0;
            sp_year[currentindex] = 0;
            sp_relay[currentindex] = 0;
            sp_relay[currentindex] = param[3];
            break;
       case RTC_TIME_SET_CMD_CODE:
            Write_Time(param[0], param[1], param[2], param[3], param[4], param[5], param[6]);
            break;
       }
      }
   }
   OS_Delay(150);
 }
}
void RELAY_TASK(void)
{
 OST_MSG state;
 unsigned char i = 0;
 unsigned char tmp;
 while(1)
 {
   OS_Csem_Wait(Relay_csem);
   if (OS_Queue_Check(RELAY_QUEUE))
   {
     OS_Queue_Wait(RELAY_QUEUE, state);
     for (i = 0; i < 4; i++)
     {
        tmp = (state >> i) & 0x01;
        if (tmp == 1)
        {
         Relay_ChangeState(RELAY_ON, i);
        }
        else
        {
         Relay_ChangeState(RELAY_OFF, i);
        }
     }
   }
 }
}
void LCD_TASK(void)
{
 char sec = 0;
 char min = 42;
 char hr = 21;
 char week_day = 0;
 char day = 26;
 char mn = 3;
 char year = 16;
 char time[9];
 char date[15];
 char Index;
 OST_SMSG msg;
 memset(time, 0, 9);
 memset(date, 0, 15);
 while(1)
 {
   Read_Time(&sec, &min, &hr, &week_day, &day, &mn, &year);
   Transform_Time(&sec, &min, &hr, &week_day, &day, &mn, &year);
   TimeToString(sec, min, hr, time);
   lcd16x2_write(1, 5, time);
   DateToString(week_day, day, mn, year, date);
   lcd16x2_write(2, 2, date);
   if (CompareTime(sec, min, hr, week_day, day, mn, year, &Index))
   {
        OS_Csem_Signal(Relay_csem);
        OS_Queue_Send_Now(RELAY_QUEUE, (OST_MSG)sp_relay[Index]);
   }
   OS_Delay(500);
 }
}
bool CompareTime(char sec, char min, char hr, char week_day, char day, char mn, char year, char *Index)
{
 char i = 0;
 bool returnval = false;
 for ( i = 0; i < MAX_STORAGE_TIME; i++)
 {
  if (sec == sp_sec[i] && min == sp_min[i] && hr ==  sp_hr[i] &&
      week_day == sp_weekday[i] &&  day == sp_day[i] && mn == sp_mn[i] &&
      year ==  sp_relay[i])
      {
          *Index = i;
          returnval = true;
          break;
      }
 }
 return returnval;
}
void systick_init()
{
  T2CON         = 0x25;
  PR2                 = 250;
  TMR2IE_bit         = 1;
  INTCON         = 0xC0;
}
void systick_INT() iv 0x0004 ics ICS_AUTO 
{
 if (TMR2IF_bit)
 {
    TMR2IF_bit = 0;
    OS_Timer();
 }
}