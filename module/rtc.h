void RTC_init();
void Read_Time(char *sec, char *min, char *hr, char *week_day, char *day, char *mn, char *year);
void Transform_Time(char  *sec, char *min, char *hr, char *week_day, char *day, char *mn, char *year);
void TimeToString(char sec, char min, char hr, char *outtext);
void DateToString(char week_day, char day, char mn, char year, char *outtext);
void Write_Time(char sec, char min, char hr, char week_day, char day, char mn, char year);