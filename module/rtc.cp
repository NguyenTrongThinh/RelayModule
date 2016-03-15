#line 1 "D:/PIC/RelayModule/module/rtc.c"
#line 1 "d:/pic/relaymodule/module/rtc.h"
void RTC_init();
void Read_Time(char *sec, char *min, char *hr, char *week_day, char *day, char *mn, char *year);
void Transform_Time(char *sec, char *min, char *hr, char *week_day, char *day, char *mn, char *year);
void Write_Time(char *sec, char *min, char *hr, char *week_day, char *day, char *mn, char *year);
#line 3 "D:/PIC/RelayModule/module/rtc.c"
void RTC_init()
{
 ANSEL=0;
 ANSELH=0;
 I2C1_Init(100000);

}

void Transform_Time(char *sec, char *min, char *hr, char *week_day, char *day, char *mn, char *year)
{
 *sec = ((*sec & 0x70) >> 4)*10 + (*sec & 0x0F);
 *min = ((*min & 0xF0) >> 4)*10 + (*min & 0x0F);
 *hr = ((*hr & 0x30) >> 4)*10 + (*hr & 0x0F);
 *week_day =(*week_day & 0x07);
 *day = ((*day & 0xF0) >> 4)*10 + (*day & 0x0F);
 *mn = ((*mn & 0x10) >> 4)*10 + (*mn & 0x0F);
 *year = ((*year & 0xF0)>>4)*10+(*year & 0x0F);
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
