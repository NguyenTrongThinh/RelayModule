
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
;rtc.c,9 :: 		}
L_end_RTC_init:
	RETURN
; end of _RTC_init

_Transform_Time:

;rtc.c,11 :: 		void Transform_Time(char  *sec, char *min, char *hr, char *week_day, char *day, char *mn, char *year)
;rtc.c,13 :: 		*sec  =  ((*sec & 0x70) >> 4)*10 + (*sec & 0x0F);
	MOVF       FARG_Transform_Time_sec+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FLOC__Transform_Time+0
	MOVLW      112
	ANDWF      FLOC__Transform_Time+0, 0
	MOVWF      R2+0
	MOVF       R2+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVLW      10
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVLW      15
	ANDWF      FLOC__Transform_Time+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	ADDWF      R0+0, 1
	MOVF       FARG_Transform_Time_sec+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;rtc.c,14 :: 		*min  =  ((*min & 0xF0) >> 4)*10 + (*min & 0x0F);
	MOVF       FARG_Transform_Time_min+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FLOC__Transform_Time+0
	MOVLW      240
	ANDWF      FLOC__Transform_Time+0, 0
	MOVWF      R2+0
	MOVF       R2+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVLW      10
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVLW      15
	ANDWF      FLOC__Transform_Time+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	ADDWF      R0+0, 1
	MOVF       FARG_Transform_Time_min+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;rtc.c,15 :: 		*hr   =  ((*hr & 0x30) >> 4)*10 + (*hr & 0x0F);
	MOVF       FARG_Transform_Time_hr+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FLOC__Transform_Time+0
	MOVLW      48
	ANDWF      FLOC__Transform_Time+0, 0
	MOVWF      R2+0
	MOVF       R2+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVLW      10
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVLW      15
	ANDWF      FLOC__Transform_Time+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	ADDWF      R0+0, 1
	MOVF       FARG_Transform_Time_hr+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;rtc.c,16 :: 		*week_day =(*week_day & 0x07);
	MOVF       FARG_Transform_Time_week_day+0, 0
	MOVWF      FSR
	MOVLW      7
	ANDWF      INDF+0, 0
	MOVWF      R0+0
	MOVF       FARG_Transform_Time_week_day+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;rtc.c,17 :: 		*day  =  ((*day & 0xF0) >> 4)*10 + (*day & 0x0F);
	MOVF       FARG_Transform_Time_day+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FLOC__Transform_Time+0
	MOVLW      240
	ANDWF      FLOC__Transform_Time+0, 0
	MOVWF      R2+0
	MOVF       R2+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVLW      10
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVLW      15
	ANDWF      FLOC__Transform_Time+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	ADDWF      R0+0, 1
	MOVF       FARG_Transform_Time_day+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;rtc.c,18 :: 		*mn   =  ((*mn & 0x10) >> 4)*10 + (*mn & 0x0F);
	MOVF       FARG_Transform_Time_mn+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FLOC__Transform_Time+0
	MOVLW      16
	ANDWF      FLOC__Transform_Time+0, 0
	MOVWF      R2+0
	MOVF       R2+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVLW      10
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVLW      15
	ANDWF      FLOC__Transform_Time+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	ADDWF      R0+0, 1
	MOVF       FARG_Transform_Time_mn+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;rtc.c,19 :: 		*year =  ((*year & 0xF0)>>4)*10+(*year & 0x0F);
	MOVF       FARG_Transform_Time_year+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FLOC__Transform_Time+0
	MOVLW      240
	ANDWF      FLOC__Transform_Time+0, 0
	MOVWF      R2+0
	MOVF       R2+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVLW      10
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVLW      15
	ANDWF      FLOC__Transform_Time+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	ADDWF      R0+0, 1
	MOVF       FARG_Transform_Time_year+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;rtc.c,20 :: 		}
L_end_Transform_Time:
	RETURN
; end of _Transform_Time

_Read_Time:

;rtc.c,22 :: 		void Read_Time(char *sec, char *min, char *hr, char *week_day, char *day, char *mn, char *year)
;rtc.c,24 :: 		I2C1_Start();
	CALL       _I2C1_Start+0
;rtc.c,25 :: 		I2C1_Wr(0xD0);
	MOVLW      208
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;rtc.c,26 :: 		I2C1_Wr(0);
	CLRF       FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;rtc.c,27 :: 		I2C1_Repeated_Start();
	CALL       _I2C1_Repeated_Start+0
;rtc.c,28 :: 		I2C1_Wr(0xD1);
	MOVLW      209
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;rtc.c,29 :: 		*sec =I2C1_Rd(1);
	MOVLW      1
	MOVWF      FARG_I2C1_Rd_ack+0
	CALL       _I2C1_Rd+0
	MOVF       FARG_Read_Time_sec+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;rtc.c,30 :: 		*min =I2C1_Rd(1);
	MOVLW      1
	MOVWF      FARG_I2C1_Rd_ack+0
	CALL       _I2C1_Rd+0
	MOVF       FARG_Read_Time_min+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;rtc.c,31 :: 		*hr =I2C1_Rd(1);
	MOVLW      1
	MOVWF      FARG_I2C1_Rd_ack+0
	CALL       _I2C1_Rd+0
	MOVF       FARG_Read_Time_hr+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;rtc.c,32 :: 		*week_day =I2C1_Rd(1);
	MOVLW      1
	MOVWF      FARG_I2C1_Rd_ack+0
	CALL       _I2C1_Rd+0
	MOVF       FARG_Read_Time_week_day+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;rtc.c,33 :: 		*day =I2C1_Rd(1);
	MOVLW      1
	MOVWF      FARG_I2C1_Rd_ack+0
	CALL       _I2C1_Rd+0
	MOVF       FARG_Read_Time_day+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;rtc.c,34 :: 		*mn =I2C1_Rd(1);
	MOVLW      1
	MOVWF      FARG_I2C1_Rd_ack+0
	CALL       _I2C1_Rd+0
	MOVF       FARG_Read_Time_mn+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;rtc.c,35 :: 		*year =I2C1_Rd(0);
	CLRF       FARG_I2C1_Rd_ack+0
	CALL       _I2C1_Rd+0
	MOVF       FARG_Read_Time_year+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;rtc.c,36 :: 		I2C1_Stop();
	CALL       _I2C1_Stop+0
;rtc.c,37 :: 		}
L_end_Read_Time:
	RETURN
; end of _Read_Time

_Write_Time:

;rtc.c,38 :: 		void Write_Time(char sec, char min, char hr, char week_day, char day, char mn, char year)
;rtc.c,40 :: 		I2C1_Start();          // issue start signal
	CALL       _I2C1_Start+0
;rtc.c,41 :: 		I2C1_Wr(0xD0);         // address DS1307
	MOVLW      208
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;rtc.c,42 :: 		I2C1_Wr(0);            // start from word at address (REG0)
	CLRF       FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;rtc.c,43 :: 		I2C1_Wr(Dec2Bcd(sec));       // REG 0
	MOVF       FARG_Write_Time_sec+0, 0
	MOVWF      FARG_Dec2Bcd_decnum+0
	CALL       _Dec2Bcd+0
	MOVF       R0+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;rtc.c,44 :: 		I2C1_Wr(Dec2Bcd(min));       // REG 1
	MOVF       FARG_Write_Time_min+0, 0
	MOVWF      FARG_Dec2Bcd_decnum+0
	CALL       _Dec2Bcd+0
	MOVF       R0+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;rtc.c,45 :: 		I2C1_Wr(Dec2Bcd(hr));        // REG 2
	MOVF       FARG_Write_Time_hr+0, 0
	MOVWF      FARG_Dec2Bcd_decnum+0
	CALL       _Dec2Bcd+0
	MOVF       R0+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;rtc.c,46 :: 		I2C1_Wr(Dec2Bcd(week_day));       // REG 3
	MOVF       FARG_Write_Time_week_day+0, 0
	MOVWF      FARG_Dec2Bcd_decnum+0
	CALL       _Dec2Bcd+0
	MOVF       R0+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;rtc.c,47 :: 		I2C1_Wr(Dec2Bcd(day));       // REG 4
	MOVF       FARG_Write_Time_day+0, 0
	MOVWF      FARG_Dec2Bcd_decnum+0
	CALL       _Dec2Bcd+0
	MOVF       R0+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;rtc.c,48 :: 		I2C1_Wr(Dec2Bcd(mn));       // REG 5
	MOVF       FARG_Write_Time_mn+0, 0
	MOVWF      FARG_Dec2Bcd_decnum+0
	CALL       _Dec2Bcd+0
	MOVF       R0+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;rtc.c,49 :: 		I2C1_Wr(Dec2Bcd(year));      // REG 6
	MOVF       FARG_Write_Time_year+0, 0
	MOVWF      FARG_Dec2Bcd_decnum+0
	CALL       _Dec2Bcd+0
	MOVF       R0+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;rtc.c,50 :: 		I2C1_Stop();           // issue stop signal
	CALL       _I2C1_Stop+0
;rtc.c,52 :: 		I2C1_Start();          // issue start signal
	CALL       _I2C1_Start+0
;rtc.c,53 :: 		I2C1_Wr(0xD0);         // address DS1307
	MOVLW      208
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;rtc.c,54 :: 		I2C1_Wr(0);            // start from word at address 0
	CLRF       FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;rtc.c,55 :: 		I2C1_Wr(0);            // write 0 to REG0 (enable counting + 0 sec)
	CLRF       FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;rtc.c,56 :: 		I2C1_Stop();           // issue stop signal
	CALL       _I2C1_Stop+0
;rtc.c,57 :: 		}
L_end_Write_Time:
	RETURN
; end of _Write_Time
