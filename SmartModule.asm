
_main:

;SmartModule.c,44 :: 		void main()
;SmartModule.c,46 :: 		HWStartUp();
	CALL       _HWStartUp+0
;SmartModule.c,47 :: 		OS_Init();
	CALL       _OS_Init+0
;SmartModule.c,49 :: 		OS_Queue_Create(SENSOR_QUEUE, SENSOR_MSG_QUEUE, SENSOR_MSG_LENGTH);
	MOVLW      3
	MOVWF      _SENSOR_QUEUE+0
	CLRF       _SENSOR_QUEUE+2
	CLRF       _SENSOR_QUEUE+1
	MOVLW      _SENSOR_MSG_QUEUE+0
	MOVWF      _SENSOR_QUEUE+3
;SmartModule.c,50 :: 		OS_Queue_Create(RECIEVE_QUEUE, RECIEVE_MSG_QUEUE, RECIEVE_MSG_LENGTH);
	MOVLW      1
	MOVWF      _RECIEVE_QUEUE+0
	CLRF       _RECIEVE_QUEUE+2
	CLRF       _RECIEVE_QUEUE+1
	MOVLW      _RECIEVE_MSG_QUEUE+0
	MOVWF      _RECIEVE_QUEUE+3
;SmartModule.c,51 :: 		OS_Queue_Create(DISPLAY_QUEUE, DISPLAY_MSG_QUEUE, DISPLAY_MSG_LENGTH);
	MOVLW      1
	MOVWF      _DISPLAY_QUEUE+0
	CLRF       _DISPLAY_QUEUE+2
	CLRF       _DISPLAY_QUEUE+1
	MOVLW      _DISPLAY_MSG_QUEUE+0
	MOVWF      _DISPLAY_QUEUE+3
;SmartModule.c,53 :: 		OS_Task_Create(LED1_TASK_PRIORITY, LED1_TASK);
	MOVLW      1
	MOVWF      FARG__OS_Task_Create_priority+0
	MOVLW      _LED1_TASK+0
	MOVWF      FARG__OS_Task_Create_TaskAddr+0
	MOVLW      hi_addr(_LED1_TASK+0)
	MOVWF      FARG__OS_Task_Create_TaskAddr+1
	CALL       __OS_Task_Create+0
;SmartModule.c,54 :: 		OS_Task_Create(LED2_TASK_PRIORITY, LED2_TASK);
	MOVLW      1
	MOVWF      FARG__OS_Task_Create_priority+0
	MOVLW      _LED2_TASK+0
	MOVWF      FARG__OS_Task_Create_TaskAddr+0
	MOVLW      hi_addr(_LED2_TASK+0)
	MOVWF      FARG__OS_Task_Create_TaskAddr+1
	CALL       __OS_Task_Create+0
;SmartModule.c,55 :: 		OS_Task_Create(DISPLAY_TASK_PRIORITY, DISPLAY_TASK);
	MOVLW      3
	MOVWF      FARG__OS_Task_Create_priority+0
	MOVLW      _DISPLAY_TASK+0
	MOVWF      FARG__OS_Task_Create_TaskAddr+0
	MOVLW      hi_addr(_DISPLAY_TASK+0)
	MOVWF      FARG__OS_Task_Create_TaskAddr+1
	CALL       __OS_Task_Create+0
;SmartModule.c,56 :: 		OS_Task_Create(SENSOR_TASK_PRIORITY, SENSOR_TASK);
	CLRF       FARG__OS_Task_Create_priority+0
	MOVLW      _SENSOR_TASK+0
	MOVWF      FARG__OS_Task_Create_TaskAddr+0
	MOVLW      hi_addr(_SENSOR_TASK+0)
	MOVWF      FARG__OS_Task_Create_TaskAddr+1
	CALL       __OS_Task_Create+0
;SmartModule.c,57 :: 		OS_Task_Create(SERIAL_TASK_PRIORITY, SERIAL_TASK);
	CLRF       FARG__OS_Task_Create_priority+0
	MOVLW      _SERIAL_TASK+0
	MOVWF      FARG__OS_Task_Create_TaskAddr+0
	MOVLW      hi_addr(_SERIAL_TASK+0)
	MOVWF      FARG__OS_Task_Create_TaskAddr+1
	CALL       __OS_Task_Create+0
;SmartModule.c,58 :: 		Systick_Init();
	CALL       _Systick_Init+0
;SmartModule.c,59 :: 		OS_Run();
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
	GOTO       L__main71
	BTFSC      __indf+0, 7
	GOTO       L__main71
	GOTO       L_main9
L__main71:
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
	GOTO       L__main70
	BTFSC      __OS_Flags+0, 7
	GOTO       L__main70
	GOTO       L_main14
L__main70:
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
L__main69:
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
	GOTO       L__main68
	DECF       __OS_n+0, 1
	MOVF       __OS_n+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L__main68
	GOTO       L_main4
L__main68:
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
L__main67:
	GOTO       ___main__OS_SCHED_RUN
L_main30:
L_main27:
___main_SCHED_END:
	GOTO       L_main0
;SmartModule.c,61 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_LED1_TASK:

;SmartModule.c,62 :: 		void LED1_TASK(void)
;SmartModule.c,65 :: 		while(1)
L_LED1_TASK33:
;SmartModule.c,67 :: 		if (OS_Queue_Check(RECIEVE_QUEUE))
	MOVF       _RECIEVE_QUEUE+1, 0
	BTFSC      STATUS+0, 2
	GOTO       L_LED1_TASK35
;SmartModule.c,69 :: 		OS_Queue_Wait(RECIEVE_QUEUE, CV);
	MOVLW      hi_addr(__OS_ReturnSave+0)
	MOVWF      __pclath+0
	BCF        __pclath+0, 0
	MOVLW      $+4
	MOVWF      __fsr+0
	MOVLW      hi_addr($+32770)
	GOTO       __OS_ReturnSave+0
	MOVF       _RECIEVE_QUEUE+1, 0
	XORLW      0
	MOVLW      1
	BTFSC      STATUS+0, 2
	MOVLW      0
	MOVWF      FARG__OS_CheckEvent_bEvent+0
	CALL       __OS_CheckEvent+0
	MOVF       R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_LED1_TASK36
	RETURN
L_LED1_TASK36:
	MOVLW      _RECIEVE_QUEUE+0
	MOVWF      FARG__OS_Queue_Get_pQueue+0
	CALL       __OS_Queue_Get+0
	MOVF       R0+0, 0
	MOVWF      LED1_TASK_CV_L0+0
;SmartModule.c,70 :: 		if (CV == LED1_ON)
	MOVF       R0+0, 0
	XORLW      65
	BTFSS      STATUS+0, 2
	GOTO       L_LED1_TASK37
;SmartModule.c,71 :: 		LED1_PIN = LED_ON;
	BCF        PORTB+0, 5
	GOTO       L_LED1_TASK38
L_LED1_TASK37:
;SmartModule.c,72 :: 		else if (CV == LED1_OFF)
	MOVF       LED1_TASK_CV_L0+0, 0
	XORLW      66
	BTFSS      STATUS+0, 2
	GOTO       L_LED1_TASK39
;SmartModule.c,73 :: 		LED1_PIN = LED_OFF;
	BSF        PORTB+0, 5
L_LED1_TASK39:
L_LED1_TASK38:
;SmartModule.c,74 :: 		}
L_LED1_TASK35:
;SmartModule.c,75 :: 		OS_Delay(100);
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
;SmartModule.c,76 :: 		}
	GOTO       L_LED1_TASK33
;SmartModule.c,77 :: 		}
L_end_LED1_TASK:
	RETURN
; end of _LED1_TASK

_LED2_TASK:

;SmartModule.c,78 :: 		void LED2_TASK(void)
;SmartModule.c,82 :: 		while(1)
L_LED2_TASK40:
;SmartModule.c,84 :: 		if (OS_Queue_Check(RECIEVE_QUEUE))
	MOVF       _RECIEVE_QUEUE+1, 0
	BTFSC      STATUS+0, 2
	GOTO       L_LED2_TASK42
;SmartModule.c,86 :: 		OS_Queue_Wait(RECIEVE_QUEUE, CV);
	MOVLW      hi_addr(__OS_ReturnSave+0)
	MOVWF      __pclath+0
	BCF        __pclath+0, 0
	MOVLW      $+4
	MOVWF      __fsr+0
	MOVLW      hi_addr($+32770)
	GOTO       __OS_ReturnSave+0
	MOVF       _RECIEVE_QUEUE+1, 0
	XORLW      0
	MOVLW      1
	BTFSC      STATUS+0, 2
	MOVLW      0
	MOVWF      FARG__OS_CheckEvent_bEvent+0
	CALL       __OS_CheckEvent+0
	MOVF       R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_LED2_TASK43
	RETURN
L_LED2_TASK43:
	MOVLW      _RECIEVE_QUEUE+0
	MOVWF      FARG__OS_Queue_Get_pQueue+0
	CALL       __OS_Queue_Get+0
	MOVF       R0+0, 0
	MOVWF      LED2_TASK_CV_L0+0
;SmartModule.c,87 :: 		if (CV == LED2_BLINK)
	MOVF       R0+0, 0
	XORLW      67
	BTFSS      STATUS+0, 2
	GOTO       L_LED2_TASK44
;SmartModule.c,88 :: 		Blink = 1;
	MOVLW      1
	MOVWF      LED2_TASK_Blink_L0+0
	GOTO       L_LED2_TASK45
L_LED2_TASK44:
;SmartModule.c,89 :: 		else if (CV == LED2_BLINK_OFF)
	MOVF       LED2_TASK_CV_L0+0, 0
	XORLW      68
	BTFSS      STATUS+0, 2
	GOTO       L_LED2_TASK46
;SmartModule.c,90 :: 		Blink = 0;
	CLRF       LED2_TASK_Blink_L0+0
L_LED2_TASK46:
L_LED2_TASK45:
;SmartModule.c,91 :: 		}
L_LED2_TASK42:
;SmartModule.c,92 :: 		if (Blink)
	MOVF       LED2_TASK_Blink_L0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_LED2_TASK47
;SmartModule.c,93 :: 		LED2_PIN ^= 1;
	MOVLW      16
	XORWF      PORTB+0, 1
L_LED2_TASK47:
;SmartModule.c,94 :: 		OS_Delay(60);
	MOVLW      60
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
;SmartModule.c,95 :: 		}
	GOTO       L_LED2_TASK40
;SmartModule.c,96 :: 		}
L_end_LED2_TASK:
	RETURN
; end of _LED2_TASK

_DISPLAY_TASK:

;SmartModule.c,97 :: 		void DISPLAY_TASK()
;SmartModule.c,101 :: 		while(1)
L_DISPLAY_TASK48:
;SmartModule.c,103 :: 		if (OS_Queue_Check(DISPLAY_QUEUE))
	MOVF       _DISPLAY_QUEUE+1, 0
	BTFSC      STATUS+0, 2
	GOTO       L_DISPLAY_TASK50
;SmartModule.c,105 :: 		OS_Queue_Wait(DISPLAY_QUEUE, ADC_Value);
	MOVLW      hi_addr(__OS_ReturnSave+0)
	MOVWF      __pclath+0
	BCF        __pclath+0, 0
	MOVLW      $+4
	MOVWF      __fsr+0
	MOVLW      hi_addr($+32770)
	GOTO       __OS_ReturnSave+0
	MOVF       _DISPLAY_QUEUE+1, 0
	XORLW      0
	MOVLW      1
	BTFSC      STATUS+0, 2
	MOVLW      0
	MOVWF      FARG__OS_CheckEvent_bEvent+0
	CALL       __OS_CheckEvent+0
	MOVF       R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_DISPLAY_TASK51
	RETURN
L_DISPLAY_TASK51:
	MOVLW      _DISPLAY_QUEUE+0
	MOVWF      FARG__OS_Queue_Get_pQueue+0
	CALL       __OS_Queue_Get+0
;SmartModule.c,106 :: 		ADC_Value = (float) ADC_Value * 0.122;
	CALL       _word2double+0
	MOVLW      35
	MOVWF      R4+0
	MOVLW      219
	MOVWF      R4+1
	MOVLW      121
	MOVWF      R4+2
	MOVLW      123
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	CALL       _double2word+0
;SmartModule.c,107 :: 		IntToStr(ADC_Value, Temp);
	MOVF       R0+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      DISPLAY_TASK_Temp_L0+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;SmartModule.c,108 :: 		Lcd_Out(2, 1, Temp);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      DISPLAY_TASK_Temp_L0+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;SmartModule.c,109 :: 		Lcd_Out_CP("*C");
	MOVLW      ?lstr1_SmartModule+0
	MOVWF      FARG_Lcd_Out_CP_text+0
	CALL       _Lcd_Out_CP+0
;SmartModule.c,110 :: 		}
L_DISPLAY_TASK50:
;SmartModule.c,111 :: 		OS_Delay(500);
	MOVLW      244
	MOVWF      FARG__OS_InitDelay_Delay+0
	MOVLW      1
	MOVWF      FARG__OS_InitDelay_Delay+1
	CALL       __OS_InitDelay+0
	MOVLW      hi_addr(__OS_ReturnSave+0)
	MOVWF      __pclath+0
	MOVLW      $+4
	MOVWF      __fsr+0
	MOVLW      hi_addr($+2)
	GOTO       __OS_ReturnSave+0
;SmartModule.c,112 :: 		}
	GOTO       L_DISPLAY_TASK48
;SmartModule.c,113 :: 		}
L_end_DISPLAY_TASK:
	RETURN
; end of _DISPLAY_TASK

_SENSOR_TASK:

;SmartModule.c,114 :: 		void SENSOR_TASK(void)
;SmartModule.c,117 :: 		while(1)
L_SENSOR_TASK52:
;SmartModule.c,119 :: 		ADC_Value = ADC_Read(ADC_Channel);
	MOVLW      5
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      SENSOR_TASK_ADC_Value_L0+0
	MOVF       R0+1, 0
	MOVWF      SENSOR_TASK_ADC_Value_L0+1
;SmartModule.c,120 :: 		OS_Queue_Send(SENSOR_QUEUE, ADC_Value);
	MOVF       _SENSOR_QUEUE+1, 0
	XORWF      _SENSOR_QUEUE+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_SENSOR_TASK54
	MOVLW      hi_addr(__OS_ReturnSave+0)
	MOVWF      __pclath+0
	BCF        __pclath+0, 0
	MOVLW      $+4
	MOVWF      __fsr+0
	MOVLW      hi_addr($+32770)
	GOTO       __OS_ReturnSave+0
	MOVF       _SENSOR_QUEUE+1, 0
	XORWF      _SENSOR_QUEUE+0, 0
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      FARG__OS_CheckEvent_bEvent+0
	MOVF       FARG__OS_CheckEvent_bEvent+0, 0
	MOVLW      1
	BTFSS      STATUS+0, 2
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
	GOTO       L_SENSOR_TASK55
	RETURN
L_SENSOR_TASK55:
L_SENSOR_TASK54:
	MOVLW      _SENSOR_QUEUE+0
	MOVWF      FARG__OS_Queue_Send_pQueue+0
	MOVF       SENSOR_TASK_ADC_Value_L0+0, 0
	MOVWF      FARG__OS_Queue_Send_Msg+0
	MOVF       SENSOR_TASK_ADC_Value_L0+1, 0
	MOVWF      FARG__OS_Queue_Send_Msg+1
	CALL       __OS_Queue_Send+0
;SmartModule.c,121 :: 		OS_Delay(2);
	MOVLW      2
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
;SmartModule.c,122 :: 		}
	GOTO       L_SENSOR_TASK52
;SmartModule.c,123 :: 		}
L_end_SENSOR_TASK:
	RETURN
; end of _SENSOR_TASK

_SERIAL_TASK:

;SmartModule.c,124 :: 		void SERIAL_TASK(void)
;SmartModule.c,128 :: 		unsigned char Recieve_Data = 0;
	CLRF       SERIAL_TASK_Recieve_Data_L0+0
;SmartModule.c,129 :: 		while(1)
L_SERIAL_TASK56:
;SmartModule.c,131 :: 		if (UART1_Data_Ready())
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_SERIAL_TASK58
;SmartModule.c,133 :: 		Recieve_Data = UART1_Read();
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      SERIAL_TASK_Recieve_Data_L0+0
;SmartModule.c,134 :: 		OS_Queue_Send_Now(RECIEVE_QUEUE, Recieve_Data);
	MOVLW      _RECIEVE_QUEUE+0
	MOVWF      FARG__OS_Queue_Send_pQueue+0
	MOVF       R0+0, 0
	MOVWF      FARG__OS_Queue_Send_Msg+0
	CLRF       FARG__OS_Queue_Send_Msg+1
	CALL       __OS_Queue_Send+0
;SmartModule.c,135 :: 		UART1_Write(Recieve_Data);
	MOVF       SERIAL_TASK_Recieve_Data_L0+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;SmartModule.c,136 :: 		}
L_SERIAL_TASK58:
;SmartModule.c,137 :: 		if (OS_Queue_Check(SENSOR_QUEUE))
	MOVF       _SENSOR_QUEUE+1, 0
	BTFSC      STATUS+0, 2
	GOTO       L_SERIAL_TASK59
;SmartModule.c,139 :: 		OS_Queue_Wait(SENSOR_QUEUE, ADC_Value);
	MOVLW      hi_addr(__OS_ReturnSave+0)
	MOVWF      __pclath+0
	BCF        __pclath+0, 0
	MOVLW      $+4
	MOVWF      __fsr+0
	MOVLW      hi_addr($+32770)
	GOTO       __OS_ReturnSave+0
	MOVF       _SENSOR_QUEUE+1, 0
	XORLW      0
	MOVLW      1
	BTFSC      STATUS+0, 2
	MOVLW      0
	MOVWF      FARG__OS_CheckEvent_bEvent+0
	CALL       __OS_CheckEvent+0
	MOVF       R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_SERIAL_TASK60
	RETURN
L_SERIAL_TASK60:
	MOVLW      _SENSOR_QUEUE+0
	MOVWF      FARG__OS_Queue_Get_pQueue+0
	CALL       __OS_Queue_Get+0
	MOVF       R0+0, 0
	MOVWF      SERIAL_TASK_ADC_Value_L0+0
	MOVF       R0+1, 0
	MOVWF      SERIAL_TASK_ADC_Value_L0+1
;SmartModule.c,140 :: 		OS_Queue_Send_Now(DISPLAY_QUEUE, ADC_Value);
	MOVLW      _DISPLAY_QUEUE+0
	MOVWF      FARG__OS_Queue_Send_pQueue+0
	MOVF       R0+0, 0
	MOVWF      FARG__OS_Queue_Send_Msg+0
	MOVF       R0+1, 0
	MOVWF      FARG__OS_Queue_Send_Msg+1
	CALL       __OS_Queue_Send+0
;SmartModule.c,141 :: 		IntToStr(ADC_Value, Temp);
	MOVF       SERIAL_TASK_ADC_Value_L0+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       SERIAL_TASK_ADC_Value_L0+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      SERIAL_TASK_Temp_L0+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;SmartModule.c,142 :: 		UART1_Write_Text("{");
	MOVLW      ?lstr2_SmartModule+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;SmartModule.c,143 :: 		UART1_Write_Text(Temp);
	MOVLW      SERIAL_TASK_Temp_L0+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;SmartModule.c,144 :: 		UART1_Write_Text("}");
	MOVLW      ?lstr3_SmartModule+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;SmartModule.c,145 :: 		UART1_Write(0x0A);  //New Line
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;SmartModule.c,146 :: 		}
L_SERIAL_TASK59:
;SmartModule.c,147 :: 		OS_Delay(2);
	MOVLW      2
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
;SmartModule.c,148 :: 		}
	GOTO       L_SERIAL_TASK56
;SmartModule.c,149 :: 		}
L_end_SERIAL_TASK:
	RETURN
; end of _SERIAL_TASK

_Systick_Init:

;SmartModule.c,150 :: 		void Systick_Init()
;SmartModule.c,152 :: 		OPTION_REG         = 0x84;
	MOVLW      132
	MOVWF      OPTION_REG+0
;SmartModule.c,153 :: 		TMR0                 = 100;
	MOVLW      100
	MOVWF      TMR0+0
;SmartModule.c,154 :: 		INTCON         = 0xA0;
	MOVLW      160
	MOVWF      INTCON+0
;SmartModule.c,155 :: 		}
L_end_Systick_Init:
	RETURN
; end of _Systick_Init

_Systick_INT:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;SmartModule.c,156 :: 		void Systick_INT() iv 0x0004 ics ICS_AUTO
;SmartModule.c,158 :: 		if (TMR0IF_bit)
	BTFSS      TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
	GOTO       L_Systick_INT61
;SmartModule.c,160 :: 		TMR0IF_bit         = 0;
	BCF        TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
;SmartModule.c,161 :: 		TMR0                 = 100;
	MOVLW      100
	MOVWF      TMR0+0
;SmartModule.c,162 :: 		OS_Timer();
	CLRF       Systick_INT__os_i_L3+0
L_Systick_INT62:
	MOVLW      5
	SUBWF      Systick_INT__os_i_L3+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Systick_INT63
	MOVLW      5
	MOVWF      R0+0
	MOVF       Systick_INT__os_i_L3+0, 0
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       R0+0, 0
	ADDLW      __OS_Tasks+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	BTFSS      R0+0, 4
	GOTO       L_Systick_INT65
	MOVLW      5
	MOVWF      R0+0
	MOVF       Systick_INT__os_i_L3+0, 0
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
	GOTO       L_Systick_INT66
	MOVLW      5
	MOVWF      R0+0
	MOVF       Systick_INT__os_i_L3+0, 0
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       R0+0, 0
	ADDLW      __OS_Tasks+0
	MOVWF      FSR
	BCF        INDF+0, 4
L_Systick_INT66:
L_Systick_INT65:
	INCF       Systick_INT__os_i_L3+0, 1
	GOTO       L_Systick_INT62
L_Systick_INT63:
;SmartModule.c,163 :: 		}
L_Systick_INT61:
;SmartModule.c,164 :: 		}
L_end_Systick_INT:
L__Systick_INT80:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _Systick_INT
