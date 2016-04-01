
_RTC_init:

;rtc.c,3 :: 		void RTC_init()
;rtc.c,5 :: 		ANSEL=0;
	CLRF       ANSEL+0
;rtc.c,6 :: 		ANSELH=0;
	CLRF       ANSELH+0
;rtc.c,7 :: 		I2C1_Init(100000);                        // initialize I2C
	MOVLW      50
	MOVWF      SSPADD+0
	CALL       _I2C1_Init+0
;rtc.c,8 :: 		}
L_end_RTC_init:
	RETURN
; end of _RTC_init

_Transform_Time:

;rtc.c,10 :: 		void Transform_Time(char  *sec, char *min, char *hr, char *week_day, char *day, char *mn, char *year)
;rtc.c,12 :: 		*sec  =  Bcd2Dec(*sec);
	MOVF       FARG_Transform_Time_sec+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_Bcd2Dec_bcdnum+0
	CALL       _Bcd2Dec+0
	MOVF       FARG_Transform_Time_sec+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;rtc.c,13 :: 		*min  =  Bcd2Dec(*min);
	MOVF       FARG_Transform_Time_min+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_Bcd2Dec_bcdnum+0
	CALL       _Bcd2Dec+0
	MOVF       FARG_Transform_Time_min+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;rtc.c,14 :: 		*hr   =   Bcd2Dec(*hr);
	MOVF       FARG_Transform_Time_hr+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_Bcd2Dec_bcdnum+0
	CALL       _Bcd2Dec+0
	MOVF       FARG_Transform_Time_hr+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;rtc.c,15 :: 		*week_day =   Bcd2Dec(*week_day);
	MOVF       FARG_Transform_Time_week_day+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_Bcd2Dec_bcdnum+0
	CALL       _Bcd2Dec+0
	MOVF       FARG_Transform_Time_week_day+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;rtc.c,16 :: 		*day  =   Bcd2Dec(*day);
	MOVF       FARG_Transform_Time_day+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_Bcd2Dec_bcdnum+0
	CALL       _Bcd2Dec+0
	MOVF       FARG_Transform_Time_day+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;rtc.c,17 :: 		*mn   =    Bcd2Dec(*mn);
	MOVF       FARG_Transform_Time_mn+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_Bcd2Dec_bcdnum+0
	CALL       _Bcd2Dec+0
	MOVF       FARG_Transform_Time_mn+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;rtc.c,18 :: 		*year =    Bcd2Dec(*year);
	MOVF       FARG_Transform_Time_year+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_Bcd2Dec_bcdnum+0
	CALL       _Bcd2Dec+0
	MOVF       FARG_Transform_Time_year+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;rtc.c,19 :: 		}
L_end_Transform_Time:
	RETURN
; end of _Transform_Time

_Read_Time:

;rtc.c,21 :: 		void Read_Time(char *sec, char *min, char *hr, char *week_day, char *day, char *mn, char *year)
;rtc.c,23 :: 		I2C1_Start();
	CALL       _I2C1_Start+0
;rtc.c,24 :: 		I2C1_Wr(0xD0);
	MOVLW      208
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;rtc.c,25 :: 		I2C1_Wr(0);
	CLRF       FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;rtc.c,26 :: 		I2C1_Repeated_Start();
	CALL       _I2C1_Repeated_Start+0
;rtc.c,27 :: 		I2C1_Wr(0xD1);
	MOVLW      209
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;rtc.c,28 :: 		*sec =I2C1_Rd(1);
	MOVLW      1
	MOVWF      FARG_I2C1_Rd_ack+0
	CALL       _I2C1_Rd+0
	MOVF       FARG_Read_Time_sec+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;rtc.c,29 :: 		*min =I2C1_Rd(1);
	MOVLW      1
	MOVWF      FARG_I2C1_Rd_ack+0
	CALL       _I2C1_Rd+0
	MOVF       FARG_Read_Time_min+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;rtc.c,30 :: 		*hr =I2C1_Rd(1);
	MOVLW      1
	MOVWF      FARG_I2C1_Rd_ack+0
	CALL       _I2C1_Rd+0
	MOVF       FARG_Read_Time_hr+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;rtc.c,31 :: 		*week_day =I2C1_Rd(1);
	MOVLW      1
	MOVWF      FARG_I2C1_Rd_ack+0
	CALL       _I2C1_Rd+0
	MOVF       FARG_Read_Time_week_day+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;rtc.c,32 :: 		*day =I2C1_Rd(1);
	MOVLW      1
	MOVWF      FARG_I2C1_Rd_ack+0
	CALL       _I2C1_Rd+0
	MOVF       FARG_Read_Time_day+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;rtc.c,33 :: 		*mn =I2C1_Rd(1);
	MOVLW      1
	MOVWF      FARG_I2C1_Rd_ack+0
	CALL       _I2C1_Rd+0
	MOVF       FARG_Read_Time_mn+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;rtc.c,34 :: 		*year =I2C1_Rd(0);
	CLRF       FARG_I2C1_Rd_ack+0
	CALL       _I2C1_Rd+0
	MOVF       FARG_Read_Time_year+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;rtc.c,35 :: 		I2C1_Stop();
	CALL       _I2C1_Stop+0
;rtc.c,36 :: 		}
L_end_Read_Time:
	RETURN
; end of _Read_Time

_Write_Time:

;rtc.c,37 :: 		void Write_Time(char sec, char min, char hr, char week_day, char day, char mn, char year)
;rtc.c,39 :: 		I2C1_Start();          // issue start signal
	CALL       _I2C1_Start+0
;rtc.c,40 :: 		I2C1_Wr(0xD0);         // address DS1307
	MOVLW      208
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;rtc.c,41 :: 		I2C1_Wr(0);            // start from word at address (REG0)
	CLRF       FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;rtc.c,42 :: 		I2C1_Wr(Dec2Bcd(sec));       // REG 0
	MOVF       FARG_Write_Time_sec+0, 0
	MOVWF      FARG_Dec2Bcd_decnum+0
	CALL       _Dec2Bcd+0
	MOVF       R0+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;rtc.c,43 :: 		I2C1_Wr(Dec2Bcd(min));       // REG 1
	MOVF       FARG_Write_Time_min+0, 0
	MOVWF      FARG_Dec2Bcd_decnum+0
	CALL       _Dec2Bcd+0
	MOVF       R0+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;rtc.c,44 :: 		I2C1_Wr(Dec2Bcd(hr));        // REG 2
	MOVF       FARG_Write_Time_hr+0, 0
	MOVWF      FARG_Dec2Bcd_decnum+0
	CALL       _Dec2Bcd+0
	MOVF       R0+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;rtc.c,45 :: 		I2C1_Wr(Dec2Bcd(week_day));       // REG 3
	MOVF       FARG_Write_Time_week_day+0, 0
	MOVWF      FARG_Dec2Bcd_decnum+0
	CALL       _Dec2Bcd+0
	MOVF       R0+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;rtc.c,46 :: 		I2C1_Wr(Dec2Bcd(day));       // REG 4
	MOVF       FARG_Write_Time_day+0, 0
	MOVWF      FARG_Dec2Bcd_decnum+0
	CALL       _Dec2Bcd+0
	MOVF       R0+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;rtc.c,47 :: 		I2C1_Wr(Dec2Bcd(mn));       // REG 5
	MOVF       FARG_Write_Time_mn+0, 0
	MOVWF      FARG_Dec2Bcd_decnum+0
	CALL       _Dec2Bcd+0
	MOVF       R0+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;rtc.c,48 :: 		I2C1_Wr(Dec2Bcd(year));      // REG 6
	MOVF       FARG_Write_Time_year+0, 0
	MOVWF      FARG_Dec2Bcd_decnum+0
	CALL       _Dec2Bcd+0
	MOVF       R0+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;rtc.c,49 :: 		I2C1_Stop();           // issue stop signal
	CALL       _I2C1_Stop+0
;rtc.c,51 :: 		I2C1_Start();          // issue start signal
	CALL       _I2C1_Start+0
;rtc.c,52 :: 		I2C1_Wr(0xD0);         // address DS1307
	MOVLW      208
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;rtc.c,53 :: 		I2C1_Wr(0);            // start from word at address 0
	CLRF       FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;rtc.c,54 :: 		I2C1_Wr(0);            // write 0 to REG0 (enable counting + 0 sec)
	CLRF       FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;rtc.c,55 :: 		I2C1_Stop();           // issue stop signal
	CALL       _I2C1_Stop+0
;rtc.c,56 :: 		}
L_end_Write_Time:
	RETURN
; end of _Write_Time

_TimeToString:

;rtc.c,57 :: 		void TimeToString(char sec, char min, char hr, char *outtext)
;rtc.c,59 :: 		outtext[7] = sec%10 + 48;
	MOVLW      7
	ADDWF      FARG_TimeToString_outtext+0, 0
	MOVWF      FLOC__TimeToString+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       FARG_TimeToString_sec+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVLW      48
	ADDWF      R0+0, 1
	MOVF       FLOC__TimeToString+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;rtc.c,60 :: 		outtext[6] = sec/10 + 48;
	MOVLW      6
	ADDWF      FARG_TimeToString_outtext+0, 0
	MOVWF      FLOC__TimeToString+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       FARG_TimeToString_sec+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVLW      48
	ADDWF      R0+0, 1
	MOVF       FLOC__TimeToString+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;rtc.c,61 :: 		outtext[5] = ':';
	MOVLW      5
	ADDWF      FARG_TimeToString_outtext+0, 0
	MOVWF      FSR
	MOVLW      58
	MOVWF      INDF+0
;rtc.c,62 :: 		outtext[4] = min%10 + 48;
	MOVLW      4
	ADDWF      FARG_TimeToString_outtext+0, 0
	MOVWF      FLOC__TimeToString+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       FARG_TimeToString_min+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVLW      48
	ADDWF      R0+0, 1
	MOVF       FLOC__TimeToString+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;rtc.c,63 :: 		outtext[3] = min/10 + 48;
	MOVLW      3
	ADDWF      FARG_TimeToString_outtext+0, 0
	MOVWF      FLOC__TimeToString+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       FARG_TimeToString_min+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVLW      48
	ADDWF      R0+0, 1
	MOVF       FLOC__TimeToString+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;rtc.c,64 :: 		outtext[2] = ':';
	MOVLW      2
	ADDWF      FARG_TimeToString_outtext+0, 0
	MOVWF      FSR
	MOVLW      58
	MOVWF      INDF+0
;rtc.c,65 :: 		outtext[1] = hr%10 + 48;
	INCF       FARG_TimeToString_outtext+0, 0
	MOVWF      FLOC__TimeToString+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       FARG_TimeToString_hr+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVLW      48
	ADDWF      R0+0, 1
	MOVF       FLOC__TimeToString+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;rtc.c,66 :: 		outtext[0] = hr/10 + 48;
	MOVLW      10
	MOVWF      R4+0
	MOVF       FARG_TimeToString_hr+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVLW      48
	ADDWF      R0+0, 1
	MOVF       FARG_TimeToString_outtext+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;rtc.c,67 :: 		}
L_end_TimeToString:
	RETURN
; end of _TimeToString

_DateToString:

;rtc.c,68 :: 		void DateToString(char week_day, char day, char mn, char year, char *outtext)
;rtc.c,70 :: 		outtext[13] = year%10 + 48;
	MOVLW      13
	ADDWF      FARG_DateToString_outtext+0, 0
	MOVWF      FLOC__DateToString+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       FARG_DateToString_year+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVLW      48
	ADDWF      R0+0, 1
	MOVF       FLOC__DateToString+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;rtc.c,71 :: 		outtext[12] = year/10 + 48;
	MOVLW      12
	ADDWF      FARG_DateToString_outtext+0, 0
	MOVWF      FLOC__DateToString+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       FARG_DateToString_year+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVLW      48
	ADDWF      R0+0, 1
	MOVF       FLOC__DateToString+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;rtc.c,72 :: 		outtext[11] = '0';
	MOVLW      11
	ADDWF      FARG_DateToString_outtext+0, 0
	MOVWF      FSR
	MOVLW      48
	MOVWF      INDF+0
;rtc.c,73 :: 		outtext[10] = '2';
	MOVLW      10
	ADDWF      FARG_DateToString_outtext+0, 0
	MOVWF      FSR
	MOVLW      50
	MOVWF      INDF+0
;rtc.c,74 :: 		outtext[9] = '-';
	MOVLW      9
	ADDWF      FARG_DateToString_outtext+0, 0
	MOVWF      FSR
	MOVLW      45
	MOVWF      INDF+0
;rtc.c,75 :: 		outtext[8] = mn%10 + 48;
	MOVLW      8
	ADDWF      FARG_DateToString_outtext+0, 0
	MOVWF      FLOC__DateToString+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       FARG_DateToString_mn+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVLW      48
	ADDWF      R0+0, 1
	MOVF       FLOC__DateToString+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;rtc.c,76 :: 		outtext[7] = mn/10 + 48;
	MOVLW      7
	ADDWF      FARG_DateToString_outtext+0, 0
	MOVWF      FLOC__DateToString+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       FARG_DateToString_mn+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVLW      48
	ADDWF      R0+0, 1
	MOVF       FLOC__DateToString+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;rtc.c,77 :: 		outtext[6] = '-';
	MOVLW      6
	ADDWF      FARG_DateToString_outtext+0, 0
	MOVWF      FSR
	MOVLW      45
	MOVWF      INDF+0
;rtc.c,78 :: 		outtext[5] = day%10 + 48;
	MOVLW      5
	ADDWF      FARG_DateToString_outtext+0, 0
	MOVWF      FLOC__DateToString+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       FARG_DateToString_day+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVLW      48
	ADDWF      R0+0, 1
	MOVF       FLOC__DateToString+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;rtc.c,79 :: 		outtext[4] = day/10 + 48;
	MOVLW      4
	ADDWF      FARG_DateToString_outtext+0, 0
	MOVWF      FLOC__DateToString+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       FARG_DateToString_day+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVLW      48
	ADDWF      R0+0, 1
	MOVF       FLOC__DateToString+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;rtc.c,80 :: 		outtext[3] = '-';
	MOVLW      3
	ADDWF      FARG_DateToString_outtext+0, 0
	MOVWF      FSR
	MOVLW      45
	MOVWF      INDF+0
;rtc.c,81 :: 		outtext[2] = weekday[week_day - 1][2];
	MOVLW      2
	ADDWF      FARG_DateToString_outtext+0, 0
	MOVWF      R5+0
	MOVLW      1
	SUBWF      FARG_DateToString_week_day+0, 0
	MOVWF      R3+0
	CLRF       R3+1
	BTFSS      STATUS+0, 0
	DECF       R3+1, 1
	MOVF       R3+0, 0
	MOVWF      R0+0
	MOVF       R3+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _weekday+0
	MOVWF      FSR
	MOVLW      2
	ADDWF      INDF+0, 0
	MOVWF      R0+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      R0+0
	MOVF       R5+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;rtc.c,82 :: 		outtext[1] = weekday[week_day - 1][1];
	INCF       FARG_DateToString_outtext+0, 0
	MOVWF      R5+0
	MOVLW      1
	SUBWF      FARG_DateToString_week_day+0, 0
	MOVWF      R3+0
	CLRF       R3+1
	BTFSS      STATUS+0, 0
	DECF       R3+1, 1
	MOVF       R3+0, 0
	MOVWF      R0+0
	MOVF       R3+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _weekday+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	ADDLW      1
	MOVWF      R0+0
	MOVLW      0
	BTFSC      STATUS+0, 0
	ADDLW      1
	INCF       FSR, 1
	ADDWF      INDF+0, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      R0+0
	MOVF       R5+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;rtc.c,83 :: 		outtext[0] = weekday[week_day - 1][0];
	MOVLW      1
	SUBWF      FARG_DateToString_week_day+0, 0
	MOVWF      R3+0
	CLRF       R3+1
	BTFSS      STATUS+0, 0
	DECF       R3+1, 1
	MOVF       R3+0, 0
	MOVWF      R0+0
	MOVF       R3+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _weekday+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      R0+0
	MOVF       FARG_DateToString_outtext+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;rtc.c,84 :: 		}
L_end_DateToString:
	RETURN
; end of _DateToString

rtc____?ag:

L_end_rtc___?ag:
	RETURN
; end of rtc____?ag
