
_main:

;main.c,38 :: 		int main(void)
;main.c,40 :: 		Relay_Init();
	CALL       _Relay_Init+0
;main.c,41 :: 		lcd16x2_init();
	CALL       _lcd16x2_init+0
;main.c,42 :: 		serial_init();
	CALL       _serial_init+0
;main.c,43 :: 		RTC_init();
	CALL       _RTC_init+0
;main.c,44 :: 		OS_Init();
	CALL       _OS_Init+0
;main.c,45 :: 		OS_Csem_Create(Relay_csem);
	CALL       __OS_DI_INT+0
	CLRF       _Relay_csem+0
	CLRF       _Relay_csem+1
	BTFSS      __OS_Temp_I+0, 7
	GOTO       L_main0
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
L_main0:
;main.c,46 :: 		OS_Queue_Create(RELAY_QUEUE, RELAY_MSG_QUEUE, RELAY_MSG_LENGTH);
	MOVLW      2
	MOVWF      _RELAY_QUEUE+0
	CLRF       _RELAY_QUEUE+2
	CLRF       _RELAY_QUEUE+1
	MOVLW      _RELAY_MSG_QUEUE+0
	MOVWF      _RELAY_QUEUE+3
;main.c,47 :: 		OS_Task_Create(RELAY_TASK_PRIORITY, RELAY_TASK);
	MOVLW      1
	MOVWF      FARG__OS_Task_Create_priority+0
	MOVLW      _RELAY_TASK+0
	MOVWF      FARG__OS_Task_Create_TaskAddr+0
	MOVLW      hi_addr(_RELAY_TASK+0)
	MOVWF      FARG__OS_Task_Create_TaskAddr+1
	CALL       __OS_Task_Create+0
;main.c,48 :: 		OS_Task_Create(LCD_TASK_PRIORITY, LCD_TASK);
	MOVLW      1
	MOVWF      FARG__OS_Task_Create_priority+0
	MOVLW      _LCD_TASK+0
	MOVWF      FARG__OS_Task_Create_TaskAddr+0
	MOVLW      hi_addr(_LCD_TASK+0)
	MOVWF      FARG__OS_Task_Create_TaskAddr+1
	CALL       __OS_Task_Create+0
;main.c,49 :: 		OS_Task_Create(USART_TASK_PRIORITY, USART_TASK);
	MOVLW      1
	MOVWF      FARG__OS_Task_Create_priority+0
	MOVLW      _USART_TASK+0
	MOVWF      FARG__OS_Task_Create_TaskAddr+0
	MOVLW      hi_addr(_USART_TASK+0)
	MOVWF      FARG__OS_Task_Create_TaskAddr+1
	CALL       __OS_Task_Create+0
;main.c,50 :: 		Systick_Init();
	CALL       _systick_init+0
;main.c,51 :: 		OS_Run();
L_main1:
	BCF        __OS_Flags+0, 4
	BSF        __OS_Flags+0, 3
	CLRF       __OS_Best_Priority+0
	CLRF       __OS_Worst_Priority+0
	BTFSS      __OS_Flags+0, 2
	GOTO       L_main4
	GOTO       ___main__OS_SCHED_CHECK_READY
L_main4:
	MOVLW      5
	MOVWF      __OS_n+0
L_main5:
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
	GOTO       L__main84
	BTFSC      __indf+0, 7
	GOTO       L__main84
	GOTO       L_main10
L__main84:
	GOTO       ___main__OS_SCHED_CONTINUE
L_main10:
	BTFSC      __indf+0, 3
	GOTO       L_main11
___main__OS_SCHED_RUN:
	CALL       __OS_JumpToTask+0
	CLRF       __status+0
	MOVLW      hi_addr($+0)
	MOVWF      __pclath+0
	CALL       ___OS_SET_FSR_CUR_TASK+0
	BTFSC      __OS_Flags+0, 3
	GOTO       L_main12
	BTFSC      __indf+0, 3
	GOTO       L__main83
	BTFSC      __OS_Flags+0, 7
	GOTO       L__main83
	GOTO       L_main15
L__main83:
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
L_main16:
	MOVF       __OS_n+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main17
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
	GOTO       L_main16
L_main17:
	MOVF       __OS_Cur_Pos+0, 0
	MOVWF      __OS_TaskQueue+0
L_main15:
	GOTO       ___main_SCHED_END
L_main12:
L_main11:
	BTFSS      __indf+0, 4
	GOTO       L_main20
	BTFSC      __indf+0, 5
	GOTO       L_main20
L__main82:
	GOTO       ___main__OS_SCHED_CONTINUE
L_main20:
	BTFSS      __indf+0, 3
	GOTO       L_main21
	MOVF       __OS_Cur_Pos+0, 0
	ADDLW      __OS_TaskLevel+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	MOVWF      __OS_Temp+0
	BTFSC      R1+0, 7
	GOTO       L_main22
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
L_main22:
	MOVF       __OS_Temp+0, 0
	SUBWF      __OS_Best_Priority+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main23
	MOVF       __OS_Best_Priority+0, 0
	MOVWF      __OS_Worst_Priority+0
	MOVF       __OS_Temp+0, 0
	MOVWF      __OS_Best_Priority+0
	DECF       __OS_n+0, 0
	MOVWF      __OS_Best_n+0
	BSF        __OS_Flags+0, 4
	GOTO       L_main24
L_main23:
	MOVF       __OS_Temp+0, 0
	SUBWF      __OS_Worst_Priority+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main25
	MOVF       __OS_Temp+0, 0
	MOVWF      __OS_Worst_Priority+0
L_main25:
L_main24:
L_main21:
___main__OS_SCHED_CONTINUE:
	BTFSC      __OS_Flags+0, 2
	GOTO       L__main81
	DECF       __OS_n+0, 1
	MOVF       __OS_n+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L__main81
	GOTO       L_main5
L__main81:
	BTFSS      __OS_Flags+0, 4
	GOTO       L_main28
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
	GOTO       L_main31
	BTFSC      __indf+0, 7
	GOTO       L_main31
L__main80:
	GOTO       ___main__OS_SCHED_RUN
L_main31:
L_main28:
___main_SCHED_END:
	GOTO       L_main1
;main.c,54 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_USART_TASK:

;main.c,55 :: 		void USART_TASK(void)
;main.c,60 :: 		while(1)
L_USART_TASK34:
;main.c,62 :: 		if (serial_dataready())
	CALL       _serial_dataready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_USART_TASK36
;main.c,64 :: 		read = serial_read();
	CALL       _serial_read+0
;main.c,66 :: 		if (serial_process_data(read, &cmd_Type, param))
	MOVF       R0+0, 0
	MOVWF      FARG_serial_process_data_readata+0
	MOVLW      USART_TASK_cmd_Type_L0+0
	MOVWF      FARG_serial_process_data_TyprCmd+0
	MOVLW      USART_TASK_param_L0+0
	MOVWF      FARG_serial_process_data_Value+0
	CALL       _serial_process_data+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_USART_TASK37
;main.c,68 :: 		switch(cmd_Type)
	GOTO       L_USART_TASK38
;main.c,70 :: 		case RELAY_STATUS_CMD_CODE:
L_USART_TASK40:
;main.c,71 :: 		OS_Csem_Signal(Relay_csem);
L_USART_TASK41:
	CALL       __OS_DI_INT+0
	MOVLW      _Relay_csem+0
	MOVWF      FARG__OS_Csem_Signal_pCSem+0
	CALL       __OS_Csem_Signal+0
	BTFSS      __OS_Temp_I+0, 7
	GOTO       L_USART_TASK44
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
L_USART_TASK44:
	BTFSC      __OS_Flags+0, 0
	GOTO       L_USART_TASK45
	GOTO       L_USART_TASK42
L_USART_TASK45:
	MOVLW      hi_addr(__OS_ReturnSave+0)
	MOVWF      __pclath+0
	MOVLW      $+4
	MOVWF      __fsr+0
	MOVLW      hi_addr($+2)
	GOTO       __OS_ReturnSave+0
	GOTO       L_USART_TASK41
L_USART_TASK42:
;main.c,72 :: 		OS_Queue_Send_Now(RELAY_QUEUE, param[0]);
	MOVLW      _RELAY_QUEUE+0
	MOVWF      FARG__OS_Queue_Send_pQueue+0
	MOVF       USART_TASK_param_L0+0, 0
	MOVWF      FARG__OS_Queue_Send_Msg+0
	CALL       __OS_Queue_Send+0
;main.c,73 :: 		break;
	GOTO       L_USART_TASK39
;main.c,74 :: 		case RELAY_OFF_TIME_CMD_CODE:
L_USART_TASK46:
;main.c,75 :: 		sp_sec = param[0];
	MOVF       USART_TASK_param_L0+0, 0
	MOVWF      main_sp_sec+0
;main.c,76 :: 		sp_min = param[1];
	MOVF       USART_TASK_param_L0+1, 0
	MOVWF      main_sp_min+0
;main.c,77 :: 		sp_hr = param[2];
	MOVF       USART_TASK_param_L0+2, 0
	MOVWF      main_sp_hr+0
;main.c,78 :: 		sp_relay = param[3];
	MOVF       USART_TASK_param_L0+3, 0
	MOVWF      main_sp_relay+0
;main.c,79 :: 		serial_write_text("Time Set");
	MOVLW      ?lstr1_main+0
	MOVWF      FARG_serial_write_text_text+0
	CALL       _serial_write_text+0
;main.c,80 :: 		break;
	GOTO       L_USART_TASK39
;main.c,81 :: 		case RTC_TIME_SET_CMD_CODE:
L_USART_TASK47:
;main.c,82 :: 		Write_Time(param[0], param[1], param[2], param[3], param[4], param[5], param[6]);
	MOVF       USART_TASK_param_L0+0, 0
	MOVWF      FARG_Write_Time_sec+0
	MOVF       USART_TASK_param_L0+1, 0
	MOVWF      FARG_Write_Time_min+0
	MOVF       USART_TASK_param_L0+2, 0
	MOVWF      FARG_Write_Time_hr+0
	MOVF       USART_TASK_param_L0+3, 0
	MOVWF      FARG_Write_Time_week_day+0
	MOVF       USART_TASK_param_L0+4, 0
	MOVWF      FARG_Write_Time_day+0
	MOVF       USART_TASK_param_L0+5, 0
	MOVWF      FARG_Write_Time_mn+0
	MOVF       USART_TASK_param_L0+6, 0
	MOVWF      FARG_Write_Time_year+0
	CALL       _Write_Time+0
;main.c,83 :: 		break;
	GOTO       L_USART_TASK39
;main.c,84 :: 		}
L_USART_TASK38:
	MOVF       USART_TASK_cmd_Type_L0+0, 0
	XORLW      128
	BTFSC      STATUS+0, 2
	GOTO       L_USART_TASK40
	MOVF       USART_TASK_cmd_Type_L0+0, 0
	XORLW      130
	BTFSC      STATUS+0, 2
	GOTO       L_USART_TASK46
	MOVF       USART_TASK_cmd_Type_L0+0, 0
	XORLW      129
	BTFSC      STATUS+0, 2
	GOTO       L_USART_TASK47
L_USART_TASK39:
;main.c,85 :: 		}
L_USART_TASK37:
;main.c,86 :: 		}
L_USART_TASK36:
;main.c,87 :: 		OS_Delay(200);
	MOVLW      200
	MOVWF      FARG__OS_InitDelay_Delay+0
	CLRF       FARG__OS_InitDelay_Delay+1
	CALL       __OS_InitDelay+0
	MOVLW      hi_addr(__OS_ReturnSave+0)
	MOVWF      __pclath+0
	MOVLW      $+4
	MOVWF      __fsr+0
	MOVLW      hi_addr($+2)
	GOTO       __OS_ReturnSave+0
;main.c,88 :: 		}
	GOTO       L_USART_TASK34
;main.c,89 :: 		}
L_end_USART_TASK:
	RETURN
; end of _USART_TASK

_RELAY_TASK:

;main.c,90 :: 		void RELAY_TASK(void)
;main.c,93 :: 		unsigned char i = 0;
	CLRF       RELAY_TASK_i_L0+0
;main.c,95 :: 		while(1)
L_RELAY_TASK48:
;main.c,97 :: 		OS_Csem_Wait(Relay_csem);
L_RELAY_TASK50:
	MOVLW      hi_addr(__OS_ReturnSave+0)
	MOVWF      __pclath+0
	BCF        __pclath+0, 0
	MOVLW      $+4
	MOVWF      __fsr+0
	MOVLW      hi_addr($+32770)
	GOTO       __OS_ReturnSave+0
	MOVLW      0
	XORWF      _Relay_csem+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__RELAY_TASK89
	MOVLW      0
	XORWF      _Relay_csem+0, 0
L__RELAY_TASK89:
	MOVLW      1
	BTFSC      STATUS+0, 2
	MOVLW      0
	MOVWF      FARG__OS_CheckEvent_bEvent+0
	MOVF       FARG__OS_CheckEvent_bEvent+0, 0
	XORLW      0
	MOVLW      1
	BTFSC      STATUS+0, 2
	MOVLW      0
	MOVWF      FARG__OS_CheckEvent_bEvent+0
	CALL       __OS_CheckEvent+0
	MOVF       R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_RELAY_TASK53
	RETURN
L_RELAY_TASK53:
	CALL       __OS_DI_INT+0
	MOVLW      0
	XORWF      _Relay_csem+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__RELAY_TASK90
	MOVLW      0
	XORWF      _Relay_csem+0, 0
L__RELAY_TASK90:
	BTFSC      STATUS+0, 2
	GOTO       L_RELAY_TASK54
	GOTO       L_RELAY_TASK51
L_RELAY_TASK54:
	BTFSS      __OS_Temp_I+0, 7
	GOTO       L_RELAY_TASK55
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
L_RELAY_TASK55:
	GOTO       L_RELAY_TASK50
L_RELAY_TASK51:
	MOVLW      1
	SUBWF      _Relay_csem+0, 1
	BTFSS      STATUS+0, 0
	DECF       _Relay_csem+1, 1
	BTFSS      __OS_Temp_I+0, 7
	GOTO       L_RELAY_TASK56
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
L_RELAY_TASK56:
;main.c,98 :: 		if (OS_Queue_Check(RELAY_QUEUE))
	MOVF       _RELAY_QUEUE+1, 0
	BTFSC      STATUS+0, 2
	GOTO       L_RELAY_TASK57
;main.c,100 :: 		OS_Queue_Wait(RELAY_QUEUE, state);
	MOVLW      hi_addr(__OS_ReturnSave+0)
	MOVWF      __pclath+0
	BCF        __pclath+0, 0
	MOVLW      $+4
	MOVWF      __fsr+0
	MOVLW      hi_addr($+32770)
	GOTO       __OS_ReturnSave+0
	MOVF       _RELAY_QUEUE+1, 0
	XORLW      0
	MOVLW      1
	BTFSC      STATUS+0, 2
	MOVLW      0
	MOVWF      FARG__OS_CheckEvent_bEvent+0
	CALL       __OS_CheckEvent+0
	MOVF       R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_RELAY_TASK58
	RETURN
L_RELAY_TASK58:
	MOVLW      _RELAY_QUEUE+0
	MOVWF      FARG__OS_Queue_Get_pQueue+0
	CALL       __OS_Queue_Get+0
	MOVF       R0+0, 0
	MOVWF      RELAY_TASK_state_L0+0
;main.c,101 :: 		for (i = 0; i < 4; i++)
	CLRF       RELAY_TASK_i_L0+0
L_RELAY_TASK59:
	MOVLW      4
	SUBWF      RELAY_TASK_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_RELAY_TASK60
;main.c,103 :: 		tmp = (state >> i) & 0x01;
	MOVF       RELAY_TASK_i_L0+0, 0
	MOVWF      R1+0
	MOVF       RELAY_TASK_state_L0+0, 0
	MOVWF      R0+0
	MOVF       R1+0, 0
L__RELAY_TASK91:
	BTFSC      STATUS+0, 2
	GOTO       L__RELAY_TASK92
	RRF        R0+0, 1
	BCF        R0+0, 7
	ADDLW      255
	GOTO       L__RELAY_TASK91
L__RELAY_TASK92:
	MOVLW      1
	ANDWF      R0+0, 0
	MOVWF      R1+0
;main.c,104 :: 		if (tmp == 1)
	MOVF       R1+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_RELAY_TASK62
;main.c,106 :: 		Relay_ChangeState(RELAY_ON, i);
	MOVLW      1
	MOVWF      FARG_Relay_ChangeState_on_off+0
	MOVF       RELAY_TASK_i_L0+0, 0
	MOVWF      FARG_Relay_ChangeState_relay_id+0
	CALL       _Relay_ChangeState+0
;main.c,107 :: 		}
	GOTO       L_RELAY_TASK63
L_RELAY_TASK62:
;main.c,110 :: 		Relay_ChangeState(RELAY_OFF, i);
	CLRF       FARG_Relay_ChangeState_on_off+0
	MOVF       RELAY_TASK_i_L0+0, 0
	MOVWF      FARG_Relay_ChangeState_relay_id+0
	CALL       _Relay_ChangeState+0
;main.c,111 :: 		}
L_RELAY_TASK63:
;main.c,101 :: 		for (i = 0; i < 4; i++)
	INCF       RELAY_TASK_i_L0+0, 1
;main.c,112 :: 		}
	GOTO       L_RELAY_TASK59
L_RELAY_TASK60:
;main.c,113 :: 		}
L_RELAY_TASK57:
;main.c,114 :: 		}
	GOTO       L_RELAY_TASK48
;main.c,115 :: 		}
L_end_RELAY_TASK:
	RETURN
; end of _RELAY_TASK

_LCD_TASK:

;main.c,116 :: 		void LCD_TASK(void)
;main.c,118 :: 		char sec = 0;
	CLRF       LCD_TASK_sec_L0+0
	MOVLW      42
	MOVWF      LCD_TASK_min_L0+0
	MOVLW      21
	MOVWF      LCD_TASK_hr_L0+0
	CLRF       LCD_TASK_week_day_L0+0
	MOVLW      26
	MOVWF      LCD_TASK_day_L0+0
	MOVLW      3
	MOVWF      LCD_TASK_mn_L0+0
	MOVLW      16
	MOVWF      LCD_TASK_year_L0+0
;main.c,128 :: 		memset(time, 0, 9);
	MOVLW      LCD_TASK_time_L0+0
	MOVWF      FARG_memset_p1+0
	CLRF       FARG_memset_character+0
	MOVLW      9
	MOVWF      FARG_memset_n+0
	MOVLW      0
	MOVWF      FARG_memset_n+1
	CALL       _memset+0
;main.c,129 :: 		memset(date, 0, 13);
	MOVLW      LCD_TASK_date_L0+0
	MOVWF      FARG_memset_p1+0
	CLRF       FARG_memset_character+0
	MOVLW      13
	MOVWF      FARG_memset_n+0
	MOVLW      0
	MOVWF      FARG_memset_n+1
	CALL       _memset+0
;main.c,130 :: 		while(1)
L_LCD_TASK64:
;main.c,132 :: 		Read_Time(&sec, &min, &hr, &week_day, &day, &mn, &year);
	MOVLW      LCD_TASK_sec_L0+0
	MOVWF      FARG_Read_Time_sec+0
	MOVLW      LCD_TASK_min_L0+0
	MOVWF      FARG_Read_Time_min+0
	MOVLW      LCD_TASK_hr_L0+0
	MOVWF      FARG_Read_Time_hr+0
	MOVLW      LCD_TASK_week_day_L0+0
	MOVWF      FARG_Read_Time_week_day+0
	MOVLW      LCD_TASK_day_L0+0
	MOVWF      FARG_Read_Time_day+0
	MOVLW      LCD_TASK_mn_L0+0
	MOVWF      FARG_Read_Time_mn+0
	MOVLW      LCD_TASK_year_L0+0
	MOVWF      FARG_Read_Time_year+0
	CALL       _Read_Time+0
;main.c,133 :: 		Transform_Time(&sec, &min, &hr, &week_day, &day, &mn, &year);
	MOVLW      LCD_TASK_sec_L0+0
	MOVWF      FARG_Transform_Time_sec+0
	MOVLW      LCD_TASK_min_L0+0
	MOVWF      FARG_Transform_Time_min+0
	MOVLW      LCD_TASK_hr_L0+0
	MOVWF      FARG_Transform_Time_hr+0
	MOVLW      LCD_TASK_week_day_L0+0
	MOVWF      FARG_Transform_Time_week_day+0
	MOVLW      LCD_TASK_day_L0+0
	MOVWF      FARG_Transform_Time_day+0
	MOVLW      LCD_TASK_mn_L0+0
	MOVWF      FARG_Transform_Time_mn+0
	MOVLW      LCD_TASK_year_L0+0
	MOVWF      FARG_Transform_Time_year+0
	CALL       _Transform_Time+0
;main.c,134 :: 		TimeToString(sec, min, hr, time);
	MOVF       LCD_TASK_sec_L0+0, 0
	MOVWF      FARG_TimeToString_sec+0
	MOVF       LCD_TASK_min_L0+0, 0
	MOVWF      FARG_TimeToString_min+0
	MOVF       LCD_TASK_hr_L0+0, 0
	MOVWF      FARG_TimeToString_hr+0
	MOVLW      LCD_TASK_time_L0+0
	MOVWF      FARG_TimeToString_outtext+0
	CALL       _TimeToString+0
;main.c,135 :: 		lcd16x2_write(1, 1, time);
	MOVLW      1
	MOVWF      FARG_lcd16x2_write_row+0
	MOVLW      1
	MOVWF      FARG_lcd16x2_write_col+0
	MOVLW      LCD_TASK_time_L0+0
	MOVWF      FARG_lcd16x2_write_text+0
	CALL       _lcd16x2_write+0
;main.c,136 :: 		DateToString(week_day, day, mn, year, date);
	MOVF       LCD_TASK_week_day_L0+0, 0
	MOVWF      FARG_DateToString_week_day+0
	MOVF       LCD_TASK_day_L0+0, 0
	MOVWF      FARG_DateToString_day+0
	MOVF       LCD_TASK_mn_L0+0, 0
	MOVWF      FARG_DateToString_mn+0
	MOVF       LCD_TASK_year_L0+0, 0
	MOVWF      FARG_DateToString_year+0
	MOVLW      LCD_TASK_date_L0+0
	MOVWF      FARG_DateToString_outtext+0
	CALL       _DateToString+0
;main.c,137 :: 		lcd16x2_write(2, 1, date+4);
	MOVLW      2
	MOVWF      FARG_lcd16x2_write_row+0
	MOVLW      1
	MOVWF      FARG_lcd16x2_write_col+0
	MOVLW      LCD_TASK_date_L0+4
	MOVWF      FARG_lcd16x2_write_text+0
	CALL       _lcd16x2_write+0
;main.c,138 :: 		if (sec == sp_sec && min == sp_min && hr == sp_hr)
	MOVF       LCD_TASK_sec_L0+0, 0
	XORWF      main_sp_sec+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_LCD_TASK68
	MOVF       LCD_TASK_min_L0+0, 0
	XORWF      main_sp_min+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_LCD_TASK68
	MOVF       LCD_TASK_hr_L0+0, 0
	XORWF      main_sp_hr+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_LCD_TASK68
L__LCD_TASK85:
;main.c,140 :: 		OS_Csem_Signal(Relay_csem);
L_LCD_TASK69:
	CALL       __OS_DI_INT+0
	MOVLW      _Relay_csem+0
	MOVWF      FARG__OS_Csem_Signal_pCSem+0
	CALL       __OS_Csem_Signal+0
	BTFSS      __OS_Temp_I+0, 7
	GOTO       L_LCD_TASK72
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
L_LCD_TASK72:
	BTFSC      __OS_Flags+0, 0
	GOTO       L_LCD_TASK73
	GOTO       L_LCD_TASK70
L_LCD_TASK73:
	MOVLW      hi_addr(__OS_ReturnSave+0)
	MOVWF      __pclath+0
	MOVLW      $+4
	MOVWF      __fsr+0
	MOVLW      hi_addr($+2)
	GOTO       __OS_ReturnSave+0
	GOTO       L_LCD_TASK69
L_LCD_TASK70:
;main.c,141 :: 		OS_Queue_Send_Now(RELAY_QUEUE, (OST_MSG)sp_relay);
	MOVLW      _RELAY_QUEUE+0
	MOVWF      FARG__OS_Queue_Send_pQueue+0
	MOVF       main_sp_relay+0, 0
	MOVWF      FARG__OS_Queue_Send_Msg+0
	CALL       __OS_Queue_Send+0
;main.c,142 :: 		}
L_LCD_TASK68:
;main.c,143 :: 		OS_Delay(100);
	MOVLW      100
	MOVWF      FARG__OS_InitDelay_Delay+0
	MOVLW      0
	MOVWF      FARG__OS_InitDelay_Delay+1
	CALL       __OS_InitDelay+0
	MOVLW      hi_addr(__OS_ReturnSave+0)
	MOVWF      __pclath+0
	MOVLW      $+4
	MOVWF      __fsr+0
	MOVLW      hi_addr($+2)
	GOTO       __OS_ReturnSave+0
;main.c,144 :: 		}
	GOTO       L_LCD_TASK64
;main.c,145 :: 		}
L_end_LCD_TASK:
	RETURN
; end of _LCD_TASK

_systick_init:

;main.c,146 :: 		void systick_init()
;main.c,148 :: 		T2CON         = 0x25;
	MOVLW      37
	MOVWF      T2CON+0
;main.c,149 :: 		PR2                 = 250;
	MOVLW      250
	MOVWF      PR2+0
;main.c,150 :: 		TMR2IE_bit         = 1;
	BSF        TMR2IE_bit+0, BitPos(TMR2IE_bit+0)
;main.c,151 :: 		INTCON         = 0xC0;
	MOVLW      192
	MOVWF      INTCON+0
;main.c,152 :: 		}
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

;main.c,153 :: 		void systick_INT() iv 0x0004 ics ICS_AUTO
;main.c,155 :: 		if (TMR2IF_bit)
	BTFSS      TMR2IF_bit+0, BitPos(TMR2IF_bit+0)
	GOTO       L_systick_INT74
;main.c,157 :: 		TMR2IF_bit = 0;
	BCF        TMR2IF_bit+0, BitPos(TMR2IF_bit+0)
;main.c,158 :: 		OS_Timer();
	CLRF       systick_INT__os_i_L3+0
L_systick_INT75:
	MOVLW      5
	SUBWF      systick_INT__os_i_L3+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_systick_INT76
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
	GOTO       L_systick_INT78
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
	GOTO       L_systick_INT79
	MOVLW      5
	MOVWF      R0+0
	MOVF       systick_INT__os_i_L3+0, 0
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       R0+0, 0
	ADDLW      __OS_Tasks+0
	MOVWF      FSR
	BCF        INDF+0, 4
L_systick_INT79:
L_systick_INT78:
	INCF       systick_INT__os_i_L3+0, 1
	GOTO       L_systick_INT75
L_systick_INT76:
;main.c,159 :: 		}
L_systick_INT74:
;main.c,160 :: 		}
L_end_systick_INT:
L__systick_INT96:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _systick_INT
