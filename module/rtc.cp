#line 1 "D:/PIC/RelayModule/module/rtc.c"
#line 1 "d:/pic/relaymodule/module/rtc.h"
void RTC_init();
void Read_Time(char *sec, char *min, char *hr, char *week_day, char *day, char *mn, char *year);
void Transform_Time(char *sec, char *min, char *hr, char *week_day, char *day, char *mn, char *year);
void TimeToString(char sec, char min, char hr, char *outtext);
void DateToString(char week_day, char day, char mn, char year, char *outtext);
void Write_Time(char sec, char min, char hr, char week_day, char day, char mn, char year);
#line 2 "D:/PIC/RelayModule/module/rtc.c"
const char* weekday[7] = {"Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"};
void RTC_init()
{
 ANSEL=0;
 ANSELH=0;
 I2C1_Init(100000);
}

void Transform_Time(char *sec, char *min, char *hr, char *week_day, char *day, char *mn, char *year)
{
 *sec = Bcd2Dec(*sec);
 *min = Bcd2Dec(*min);
 *hr = Bcd2Dec(*hr);
 *week_day = Bcd2Dec(*week_day);
 *day = Bcd2Dec(*day);
 *mn = Bcd2Dec(*mn);
 *year = Bcd2Dec(*year);
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
 I2C1_Start();
 I2C1_Wr(0xD0);
 I2C1_Wr(0);
 I2C1_Wr(Dec2Bcd(sec));
 I2C1_Wr(Dec2Bcd(min));
 I2C1_Wr(Dec2Bcd(hr));
 I2C1_Wr(Dec2Bcd(week_day));
 I2C1_Wr(Dec2Bcd(day));
 I2C1_Wr(Dec2Bcd(mn));
 I2C1_Wr(Dec2Bcd(year));
 I2C1_Stop();

 I2C1_Start();
 I2C1_Wr(0xD0);
 I2C1_Wr(0);
 I2C1_Wr(0);
 I2C1_Stop();
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
 outtext[11] = year%10 + 48;
 outtext[10] = year/10 + 48;
 outtext[9] = '-';
 outtext[8] = mn%10 + 48;
 outtext[7] = mn/10 + 48;
 outtext[6] = '-';
 outtext[5] = day%10 + 48;
 outtext[4] = day/10 + 48;
 outtext[3] = '-';
 outtext[2] = weekday[week_day][2];
 outtext[1] = weekday[week_day][1];
 outtext[0] = weekday[week_day][0];
}
