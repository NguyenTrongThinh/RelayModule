
_main:

	CALL        _Init+0, 0
	CALL        _OS_Init+0, 0
	CLRF        FARG__OS_Task_Create_priority+0 
	MOVLW       _Task_Rolling+0
	MOVWF       FARG__OS_Task_Create_TaskAddr+0 
	MOVLW       hi_addr(_Task_Rolling+0)
	MOVWF       FARG__OS_Task_Create_TaskAddr+1 
	MOVLW       0
	MOVWF       FARG__OS_Task_Create_TaskAddr+2 
	MOVLW       0
	MOVWF       FARG__OS_Task_Create_TaskAddr+3 
	CALL        __OS_Task_Create+0, 0
	CLRF        FARG__OS_Task_Create_priority+0 
	MOVLW       _Task_SetSpeed+0
	MOVWF       FARG__OS_Task_Create_TaskAddr+0 
	MOVLW       hi_addr(_Task_SetSpeed+0)
	MOVWF       FARG__OS_Task_Create_TaskAddr+1 
	MOVLW       0
	MOVWF       FARG__OS_Task_Create_TaskAddr+2 
	MOVLW       0
	MOVWF       FARG__OS_Task_Create_TaskAddr+3 
	CALL        __OS_Task_Create+0, 0
	CLRF        FARG__OS_Task_Create_priority+0 
	MOVLW       _Task_Button+0
	MOVWF       FARG__OS_Task_Create_TaskAddr+0 
	MOVLW       hi_addr(_Task_Button+0)
	MOVWF       FARG__OS_Task_Create_TaskAddr+1 
	MOVLW       0
	MOVWF       FARG__OS_Task_Create_TaskAddr+2 
	MOVLW       0
	MOVWF       FARG__OS_Task_Create_TaskAddr+3 
	CALL        __OS_Task_Create+0, 0
	CLRF        _m_cPosition+0 
	MOVLW       1
	MOVWF       _m_cDirection+0 
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
	BTFSS       IPEN_bit+0, BitPos(IPEN_bit+0) 
	GOTO        L_main0
	BSF         GIEL_bit+0, BitPos(GIEL_bit+0) 
L_main0:
L_main1:
	CLRF        __OS_Temp+0 
	MOVLW       hi_addr(__OS_Tasks+14)
	SUBWF       __OS_CurTask+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main43
	MOVLW       __OS_Tasks+14
	SUBWF       __OS_CurTask+0, 0 
L__main43:
	BTFSS       STATUS+0, 0 
	GOTO        L_main4
	MOVLW       __OS_Tasks+0
	MOVWF       __OS_CurTask+0 
	MOVLW       hi_addr(__OS_Tasks+0)
	MOVWF       __OS_CurTask+1 
	GOTO        L_main5
L_main4:
	MOVLW       7
	ADDWF       __OS_CurTask+0, 0 
	MOVWF       R0 
	MOVLW       0
	ADDWFC      __OS_CurTask+1, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       __OS_CurTask+0 
	MOVF        R1, 0 
	MOVWF       __OS_CurTask+1 
L_main5:
	MOVF        __OS_CurTask+0, 0 
	MOVWF       FSR0 
	MOVF        __OS_CurTask+1, 0 
	MOVWF       FSR0H 
	MOVLW       1
	MOVWF       R0 
	MOVLW       __OS_State+0
	MOVWF       FSR1 
	MOVLW       hi_addr(__OS_State+0)
	MOVWF       FSR1H 
L_main6:
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	DECF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_main6
	BTFSS       __OS_State+0, 6 
	GOTO        L__main40
	BTFSC       __OS_State+0, 7 
	GOTO        L__main40
	GOTO        L_main9
L__main40:
	GOTO        ___main__OS_SCHED_CONTINUE
L_main9:
	BTFSS       __OS_State+0, 4 
	GOTO        L_main12
	BTFSC       __OS_State+0, 5 
	GOTO        L_main12
L__main39:
	GOTO        ___main__OS_SCHED_CONTINUE
L_main12:
	CALL        __OS_JumpToTask+0, 0
	CALL        __OS_SET_FSR_CUR_TASK+0, 0
	MOVLW       215
	ANDWF       __indf+0, 1 
	MOVLW       40
	ANDWF       __OS_State+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	IORWF       __indf+0, 1 
___main__OS_SCHED_CONTINUE:
	GOTO        L_main1
L_end_main:
	GOTO        $+0
; end of _main

_Init:

	CLRF        PORTA+0 
	CLRF        PORTB+0 
	MOVLW       1
	MOVWF       TRISA+0 
	MOVLW       1
	MOVWF       TRISB+0 
	BCF         NOT_RBPU_bit+0, BitPos(NOT_RBPU_bit+0) 
	CLRF        PORTC+0 
	CLRF        TRISC+0 
	MOVLW       193
	MOVWF       ADCON0+0 
	MOVLW       14
	MOVWF       ADCON1+0 
	MOVLW       193
	MOVWF       T0CON+0 
	MOVLW       37
	MOVWF       T2CON+0 
	MOVLW       249
	MOVWF       PR2+0 
	CLRF        INTCON+0 
	BSF         T0IE_bit+0, BitPos(T0IE_bit+0) 
	BSF         PEIE_bit+0, BitPos(PEIE_bit+0) 
	BSF         TMR2IE_bit+0, BitPos(TMR2IE_bit+0) 
L_end_Init:
	RETURN      0
; end of _Init

_interrupt:

	BTFSS       T0IF_bit+0, BitPos(T0IF_bit+0) 
	GOTO        L_interrupt15
	BTFSS       T0IE_bit+0, BitPos(T0IE_bit+0) 
	GOTO        L_interrupt15
L__interrupt41:
	BCF         T0IF_bit+0, BitPos(T0IF_bit+0) 
	INCF        interrupt_cCounter_L0+0, 1 
	MOVF        _m_cPosition+0, 0 
	MOVWF       interrupt_cPosition_L0+0 
	MOVLW       8
	MOVWF       interrupt_i_L0+0 
	MOVLW       1
	MOVWF       interrupt_cLedsMask_L0+0 
L_interrupt16:
	MOVLW       7
	ANDWF       interrupt_cPosition_L0+0, 0 
	MOVWF       R0 
	MOVLW       _Brightness+0
	ADDWF       R0, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_Brightness+0)
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      TBLPTRH, 1 
	MOVLW       higher_addr(_Brightness+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, R1
	MOVF        interrupt_cCounter_L0+0, 0 
	SUBWF       R1, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_interrupt19
	COMF        interrupt_cLedsMask_L0+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	ANDWF       PORTC+0, 1 
	GOTO        L_interrupt20
L_interrupt19:
	MOVF        interrupt_cLedsMask_L0+0, 0 
	IORWF       PORTC+0, 1 
L_interrupt20:
	RLCF        interrupt_cLedsMask_L0+0, 1 
	BCF         interrupt_cLedsMask_L0+0, 0 
	MOVF        _m_cDirection+0, 0 
	ADDWF       interrupt_cPosition_L0+0, 1 
	DECF        interrupt_i_L0+0, 1 
	MOVF        interrupt_i_L0+0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt16
	MOVLW       31
	ANDWF       interrupt_cCounter_L0+0, 1 
L_interrupt15:
	BTFSS       TMR2IF_bit+0, BitPos(TMR2IF_bit+0) 
	GOTO        L_interrupt21
	BCF         TMR2IF_bit+0, BitPos(TMR2IF_bit+0) 
	CALL        _OS_Timer+0, 0
L_interrupt21:
L_end_interrupt:
L__interrupt46:
	RETFIE      1
; end of _interrupt

_Task_Rolling:

L_Task_Rolling22:
	CLRF        Task_Rolling_cDelay_L0+0 
L_Task_Rolling25:
	MOVF        Task_Rolling_cDelay_L0+0, 0 
	MOVWF       R1 
	INCF        Task_Rolling_cDelay_L0+0, 1 
	MOVF        R1, 0 
	SUBWF       _m_cSpeed+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_Task_Rolling26
	MOVLW       1
	MOVWF       FARG__OS_InitDelay_Delay+0 
	MOVLW       0
	MOVWF       FARG__OS_InitDelay_Delay+1 
	CALL        __OS_InitDelay+0, 0
	CALL        __OS_ReturnSave+0, 0
	NOP
	GOTO        L_Task_Rolling25
L_Task_Rolling26:
	MOVF        _m_cPosition+0, 0 
	ADDLW       1
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       _m_cPosition+0 
	GOTO        L_Task_Rolling22
L_end_Task_Rolling:
	RETURN      0
; end of _Task_Rolling

_Task_Button:

L_Task_Button27:
L_Task_Button30:
	CALL        __OS_EnterWaitMode+0, 0
	NOP
	BTFSC       PORTB+0, 0 
	GOTO        L__Task_Button49
	BSF         4056, 0 
	GOTO        L__Task_Button50
L__Task_Button49:
	BCF         4056, 0 
L__Task_Button50:
	MOVLW       0
	BTFSC       4056, 0 
	MOVLW       1
	MOVWF       FARG__OS_CheckEvent+0 
	MOVF        FARG__OS_CheckEvent+0, 0 
	XORLW       0
	MOVLW       0
	BTFSS       STATUS+0, 2 
	MOVLW       1
	MOVWF       FARG__OS_CheckEvent+0 
	CALL        __OS_CheckEvent+0, 0
	MOVLW       40
	MOVWF       FARG__OS_InitDelay_Delay+0 
	MOVLW       0
	MOVWF       FARG__OS_InitDelay_Delay+1 
	CALL        __OS_InitDelay+0, 0
	CALL        __OS_ReturnSave+0, 0
	NOP
	BTFSC       PORTB+0, 0 
	GOTO        L_Task_Button30
	MOVF        _m_cDirection+0, 0 
	SUBLW       0
	MOVWF       _m_cDirection+0 
L_Task_Button33:
	CALL        __OS_EnterWaitMode+0, 0
	NOP
	MOVLW       0
	BTFSC       PORTB+0, 0 
	MOVLW       1
	MOVWF       FARG__OS_CheckEvent+0 
	MOVF        FARG__OS_CheckEvent+0, 0 
	XORLW       0
	MOVLW       0
	BTFSS       STATUS+0, 2 
	MOVLW       1
	MOVWF       FARG__OS_CheckEvent+0 
	CALL        __OS_CheckEvent+0, 0
	MOVLW       40
	MOVWF       FARG__OS_InitDelay_Delay+0 
	MOVLW       0
	MOVWF       FARG__OS_InitDelay_Delay+1 
	CALL        __OS_InitDelay+0, 0
	CALL        __OS_ReturnSave+0, 0
	NOP
	BTFSS       PORTB+0, 0 
	GOTO        L_Task_Button33
	GOTO        L_Task_Button27
L_end_Task_Button:
	RETURN      0
; end of _Task_Button

_Task_SetSpeed:

L_Task_SetSpeed36:
	MOVLW       199
	ANDWF       ADCON0+0, 1 
	BSF         GO_bit+0, BitPos(GO_bit+0) 
	CALL        __OS_EnterWaitMode+0, 0
	NOP
	BTFSC       NOT_DONE_bit+0, BitPos(NOT_DONE_bit+0) 
	GOTO        L__Task_SetSpeed52
	BSF         4056, 0 
	GOTO        L__Task_SetSpeed53
L__Task_SetSpeed52:
	BCF         4056, 0 
L__Task_SetSpeed53:
	MOVLW       0
	BTFSC       4056, 0 
	MOVLW       1
	MOVWF       FARG__OS_CheckEvent+0 
	MOVF        FARG__OS_CheckEvent+0, 0 
	XORLW       0
	MOVLW       0
	BTFSS       STATUS+0, 2 
	MOVLW       1
	MOVWF       FARG__OS_CheckEvent+0 
	CALL        __OS_CheckEvent+0, 0
	MOVF        ADRESH+0, 0 
	MOVWF       _m_cSpeed+0 
	MOVLW       100
	MOVWF       FARG__OS_InitDelay_Delay+0 
	MOVLW       0
	MOVWF       FARG__OS_InitDelay_Delay+1 
	CALL        __OS_InitDelay+0, 0
	CALL        __OS_ReturnSave+0, 0
	NOP
	GOTO        L_Task_SetSpeed36
L_end_Task_SetSpeed:
	RETURN      0
; end of _Task_SetSpeed
