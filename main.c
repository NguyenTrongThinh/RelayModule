/**************************************************************************/
/*
/**************************************************************************/
#include "osa.h"
#include "serial.h"
#include "rtc.h"

void systick_init();

int main(void)
{
    serial_init();
    RTC_init();
    OS_Init();
    //Tao Task Message queue
    Systick_Init();
    OS_Run();
    while(1);
    return 0;
}
void systick_init()
{
  T2CON         = 0x36;
  PR2                 = 223;
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