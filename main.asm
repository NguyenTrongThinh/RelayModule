
_main:

;main.c,10 :: 		int main(void)
;main.c,12 :: 		serial_init();
	CALL       _serial_init+0
;main.c,13 :: 		RTC_init();
	CALL       _RTC_init+0
;main.c,14 :: 		OS_Init();
	CALL       _OS_Init+0
;main.c,16 :: 		Systick_Init();
	CALL       _systick_init+0
;main.c,17 :: 		OS_Run();
L_main0:
	BCF        __OS_Flags+0, 4
	BSF        __OS_Flags+0, 3
	CLRF       __OS_Best_Priority+0
	CLRF       __OS_Worst_Priority+0
	BTFSS      __OS_Flags+0, 2
	GOTO       L_main3
	GOTO       ___main__OS_SCHED_CHECK_READY
L_main3:
	MOVLW      5
	MOVWF      __OS_n+0
L_main4:
	MOVLW      1
	SUBWF      __OS_n+0, 0
	MOVWF      R0+0
	CLRF       R0+1
	BTFSS      STATUS+0, 0
	DECF       R0+1, 1
	MOVF       R0+0, 0
	ADDLW      __OS_TaskQueue+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      __OS_Cur_Pos+0
___main__OS_SCHED_CHECK_READY:
	MOVLW      5
	MOVWF      R0+0
	MOVF       __OS_Cur_Pos+0, 0
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       R0+0, 0
	ADDLW      __OS_Tasks+0
	MOVWF      __OS_CurTask+0
	CALL       ___OS_SET_FSR_CUR_TASK+0
	BTFSS      __indf+0, 6
	GOTO       L__main43
	BTFSC      __indf+0, 7
	GOTO       L__main43
	GOTO       L_main9
L__main43:
	GOTO       ___main__OS_SCHED_CONTINUE
L_main9:
	BTFSC      __indf+0, 3
	GOTO       L_main10
___main__OS_SCHED_RUN:
	CALL       __OS_JumpToTask+0
	CLRF       __status+0
	MOVLW      hi_addr($+0)
	MOVWF      __pclath+0
	CALL       ___OS_SET_FSR_CUR_TASK+0
	BTFSC      __OS_Flags+0, 3
	GOTO       L_main11
	BTFSC      __indf+0, 3
	GOTO       L__main42
	BTFSC      __OS_Flags+0, 7
	GOTO       L__main42
	GOTO       L_main14
L__main42:
	MOVF       __OS_Cur_Pos+0, 0
	ADDLW      __OS_TaskLevel+0
	MOVWF      R1+0
	MOVF       R1+0, 0
	MOVWF      FSR
	MOVF       __OS_Worst_Priority+0, 0
	SUBWF      INDF+0, 0
	MOVWF      R0+0
	MOVF       R1+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
	MOVF       __OS_Best_n+0, 0
	MOVWF      __OS_n+0
L_main15:
	MOVF       __OS_n+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main16
	MOVF       __OS_n+0, 0
	ADDLW      __OS_TaskQueue+0
	MOVWF      R2+0
	MOVLW      1
	SUBWF      __OS_n+0, 0
	MOVWF      R0+0
	CLRF       R0+1
	BTFSS      STATUS+0, 0
	DECF       R0+1, 1
	MOVF       R0+0, 0
	ADDLW      __OS_TaskQueue+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
	DECF       __OS_n+0, 1
	GOTO       L_main15
L_main16:
	MOVF       __OS_Cur_Pos+0, 0
	MOVWF      __OS_TaskQueue+0
L_main14:
	GOTO       ___main_SCHED_END
L_main11:
L_main10:
	BTFSS      __indf+0, 4
	GOTO       L_main19
	BTFSC      __indf+0, 5
	GOTO       L_main19
L__main41:
	GOTO       ___main__OS_SCHED_CONTINUE
L_main19:
	BTFSS      __indf+0, 3
	GOTO       L_main20
	MOVF       __OS_Cur_Pos+0, 0
	ADDLW      __OS_TaskLevel+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	MOVWF      __OS_Temp+0
	BTFSC      R1+0, 7
	GOTO       L_main21
	MOVLW      8
	ADDWF      __OS_Temp+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	MOVWF      __OS_Temp+0
	MOVF       __OS_CurTask+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVLW      7
	ANDWF      R0+0, 1
	MOVF       R0+0, 0
	SUBWF      R1+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      __OS_Temp+0
	MOVF       __OS_Cur_Pos+0, 0
	ADDLW      __OS_TaskLevel+0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
L_main21:
	MOVF       __OS_Temp+0, 0
	SUBWF      __OS_Best_Priority+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main22
	MOVF       __OS_Best_Priority+0, 0
	MOVWF      __OS_Worst_Priority+0
	MOVF       __OS_Temp+0, 0
	MOVWF      __OS_Best_Priority+0
	DECF       __OS_n+0, 0
	MOVWF      __OS_Best_n+0
	BSF        __OS_Flags+0, 4
	GOTO       L_main23
L_main22:
	MOVF       __OS_Temp+0, 0
	SUBWF      __OS_Worst_Priority+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main24
	MOVF       __OS_Temp+0, 0
	MOVWF      __OS_Worst_Priority+0
L_main24:
L_main23:
L_main20:
___main__OS_SCHED_CONTINUE:
	BTFSC      __OS_Flags+0, 2
	GOTO       L__main40
	DECF       __OS_n+0, 1
	MOVF       __OS_n+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L__main40
	GOTO       L_main4
L__main40:
	BTFSS      __OS_Flags+0, 4
	GOTO       L_main27
	BCF        __OS_Flags+0, 3
	BCF        __OS_Flags+0, 7
	MOVF       __OS_Best_n+0, 0
	ADDLW      __OS_TaskQueue+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      __OS_Cur_Pos+0
	MOVLW      5
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       R0+0, 0
	ADDLW      __OS_Tasks+0
	MOVWF      __OS_CurTask+0
	CALL       ___OS_SET_FSR_CUR_TASK+0
	BTFSS      __indf+0, 6
	GOTO       L_main30
	BTFSC      __indf+0, 7
	GOTO       L_main30
L__main39:
	GOTO       ___main__OS_SCHED_RUN
L_main30:
L_main27:
___main_SCHED_END:
	GOTO       L_main0
;main.c,20 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_systick_init:

;main.c,21 :: 		void systick_init()
;main.c,23 :: 		T2CON         = 0x36;
	MOVLW      54
	MOVWF      T2CON+0
;main.c,24 :: 		PR2                 = 223;
	MOVLW      223
	MOVWF      PR2+0
;main.c,25 :: 		TMR2IE_bit         = 1;
	BSF        TMR2IE_bit+0, BitPos(TMR2IE_bit+0)
;main.c,26 :: 		INTCON         = 0xC0;
	MOVLW      192
	MOVWF      INTCON+0
;main.c,27 :: 		}
L_end_systick_init:
	RETURN
; end of _systick_init

_systick_INT:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;main.c,28 :: 		void systick_INT() iv 0x0004 ics ICS_AUTO
;main.c,30 :: 		if (TMR2IF_bit)
	BTFSS      TMR2IF_bit+0, BitPos(TMR2IF_bit+0)
	GOTO       L_systick_INT33
;main.c,32 :: 		TMR2IF_bit = 0;
	BCF        TMR2IF_bit+0, BitPos(TMR2IF_bit+0)
;main.c,33 :: 		OS_Timer();
	CLRF       systick_INT__os_i_L3+0
L_systick_INT34:
	MOVLW      5
	SUBWF      systick_INT__os_i_L3+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_systick_INT35
	MOVLW      5
	MOVWF      R0+0
	MOVF       systick_INT__os_i_L3+0, 0
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       R0+0, 0
	ADDLW      __OS_Tasks+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	BTFSS      R0+0, 4
	GOTO       L_systick_INT37
	MOVLW      5
	MOVWF      R0+0
	MOVF       systick_INT__os_i_L3+0, 0
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVLW      __OS_Tasks+0
	ADDWF      R0+0, 1
	MOVLW      3
	ADDWF      R0+0, 0
	MOVWF      R2+0
	MOVF       R2+0, 0
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
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
	MOVF       R0+1, 0
	INCF       FSR, 1
	MOVWF      INDF+0
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	IORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L_systick_INT38
	MOVLW      5
	MOVWF      R0+0
	MOVF       systick_INT__os_i_L3+0, 0
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       R0+0, 0
	ADDLW      __OS_Tasks+0
	MOVWF      FSR
	BCF        INDF+0, 4
L_systick_INT38:
L_systick_INT37:
	INCF       systick_INT__os_i_L3+0, 1
	GOTO       L_systick_INT34
L_systick_INT35:
;main.c,34 :: 		}
L_systick_INT33:
;main.c,35 :: 		}
L_end_systick_INT:
L__systick_INT47:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _systick_INT
