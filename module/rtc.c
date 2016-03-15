#include "rtc.h"

void RTC_init()
{
   ANSEL=0;
   ANSELH=0;
   I2C1_Init(100000);                        // initialize I2C
   
}

void Transform_Time(char  *sec, char *min, char *hr, char *week_day, char *day, char *mn, char *year)
{
  *sec  =  ((*sec & 0x70) >> 4)*10 + (*sec & 0x0F);
  *min  =  ((*min & 0xF0) >> 4)*10 + (*min & 0x0F);
  *hr   =  ((*hr & 0x30) >> 4)*10 + (*hr & 0x0F);
  *week_day =(*week_day & 0x07);
  *day  =  ((*day & 0xF0) >> 4)*10 + (*day & 0x0F);
  *mn   =  ((*mn & 0x10) >> 4)*10 + (*mn & 0x0F);
  *year =  ((*year & 0xF0)>>4)*10+(*year & 0x0F);
}

void Read_Time(char *sec, char *min, char *hr, char *week_day, char *day, char *mn, char *year)
{
  I2C1_Start();
  I2C1_Wr(0xD0);
  I2C1_Wr(0);
  I2C1_Repeated_Start();
  I2C1_Wr(0xD1);
  *sec =I2C1_Rd(1);
  *min =I2C1_Rd(1);
  *hr =I2C1_Rd(1);
  *week_day =I2C1_Rd(1);
  *day =I2C1_Rd(1);
  *mn =I2C1_Rd(1);
  *year =I2C1_Rd(0);
  I2C1_Stop();
}
void Write_Time(char sec, char min, char hr, char week_day, char day, char mn, char year)
{
   I2C1_Start();          // issue start signal
   I2C1_Wr(0xD0);         // address DS1307
   I2C1_Wr(0);            // start from word at address (REG0)
   I2C1_Wr(Dec2Bcd(sec));       // REG 0
   I2C1_Wr(Dec2Bcd(min));       // REG 1
   I2C1_Wr(Dec2Bcd(hr));        // REG 2
   I2C1_Wr(Dec2Bcd(week_day));       // REG 3
   I2C1_Wr(Dec2Bcd(day));       // REG 4
   I2C1_Wr(Dec2Bcd(mn));       // REG 5
   I2C1_Wr(Dec2Bcd(year));      // REG 6
   I2C1_Stop();           // issue stop signal
   
   I2C1_Start();          // issue start signal
   I2C1_Wr(0xD0);         // address DS1307
   I2C1_Wr(0);            // start from word at address 0
   I2C1_Wr(0);            // write 0 to REG0 (enable counting + 0 sec)
   I2C1_Stop();           // issue stop signal
}