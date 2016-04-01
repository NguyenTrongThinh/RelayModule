#include "rtc.h"
const char* weekday[7] = {"Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"};
void RTC_init()
{
   ANSEL=0;
   ANSELH=0;
   I2C1_Init(100000);                        // initialize I2C
}

void Transform_Time(char  *sec, char *min, char *hr, char *week_day, char *day, char *mn, char *year)
{
  *sec  =  Bcd2Dec(*sec);
  *min  =  Bcd2Dec(*min);
  *hr   =   Bcd2Dec(*hr);
  *week_day =   Bcd2Dec(*week_day);
  *day  =   Bcd2Dec(*day);
  *mn   =    Bcd2Dec(*mn);
  *year =    Bcd2Dec(*year);
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
void TimeToString(char sec, char min, char hr, char *outtext)
{
 outtext[7] = sec%10 + 48;
 outtext[6] = sec/10 + 48;
 outtext[5] = ':';
 outtext[4] = min%10 + 48;
 outtext[3] = min/10 + 48;
 outtext[2] = ':';
 outtext[1] = hr%10 + 48;
 outtext[0] = hr/10 + 48;
}
void DateToString(char week_day, char day, char mn, char year, char *outtext)
{
 outtext[13] = year%10 + 48;
 outtext[12] = year/10 + 48;
 outtext[11] = '0';
 outtext[10] = '2';
 outtext[9] = '-';
 outtext[8] = mn%10 + 48;
 outtext[7] = mn/10 + 48;
 outtext[6] = '-';
 outtext[5] = day%10 + 48;
 outtext[4] = day/10 + 48;
 outtext[3] = '-';
 outtext[2] = weekday[week_day - 1][2];
 outtext[1] = weekday[week_day - 1][1];
 outtext[0] = weekday[week_day - 1][0];
}