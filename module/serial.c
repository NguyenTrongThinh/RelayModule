#include "serial.h"
#ifndef BAUDRATE
        #define BAUDRATE        9600
#endif
#define RELAY_STATUS_CMD_CODE                   0x80        //Set Trang thai relay hien tai
#define RTC_TIME_SET_CMD_CODE                   0x81        //Set ngayf giowf cho DS1307
#define RELAY_OFF_TIME_CMD_CODE                 0x82      //Hen gio tat
#define GET_CURRENT_RELAY_SETTING               0x83

#define END_CMD 0xFF
static unsigned char ReadData[10];
static unsigned char index = 0;
void serial_init()
{
     UART1_Init(BAUDRATE);
}
bool serial_dataready()
{
 return UART1_Data_Ready();
}
unsigned char serial_read()
{
 return UART1_Read();
}
void serial_write_text(char *text)
{
 UART1_Write_Text(text);
}
bool serial_process_data(char readata, unsigned char *TyprCmd, char *Value)
{
   bool retval = false;
   ReadData[index++] = readata;
   switch (ReadData[0])
   {
    case RELAY_STATUS_CMD_CODE:      //0x80 0x0F 0xFF: Tat ca relay on
         if (ReadData[index-1] == END_CMD)
          {
          retval = true;
          index = 0;
          *TyprCmd = ReadData[0];
           memcpy(Value, ReadData + 1, 1);
          }
    break;
    case RTC_TIME_SET_CMD_CODE:          //0x81 23 22 00 3 03 03 16 0xFF
    if (ReadData[index-1] == END_CMD)
    {
    retval = true;
    index = 0;
    *TyprCmd = ReadData[0];
    memcpy(Value, ReadData + 1, 7);
    }
    break;
    case RELAY_OFF_TIME_CMD_CODE:          //0x81 23 22 00 3 03 03 16 0xFF
      if (ReadData[index-1] == END_CMD)
      {
        retval = true;
        index = 0;
        *TyprCmd = ReadData[0];
        memcpy(Value, ReadData + 1, 8);
      }
      break;
    case END_CMD:
    index = 0;
    break;
   }
   return retval;
}