
__OS_JumpToTask:

;osa_pic16_mikroc.c,47 :: 		
;osa_pic16_mikroc.c,49 :: 		
	CALL       ___OS_SET_FSR_CUR_TASK+0
	MOVLW      2
	ADDWF      FSR, 1
;osa_pic16_mikroc.c,50 :: 		
	MOVLW      31
	ANDWF      0, 0
	MOVWF      10
;osa_pic16_mikroc.c,51 :: 		
	DECF       FSR, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      FSR
;osa_pic16_mikroc.c,53 :: 		
	MOVF       0, 0
;osa_pic16_mikroc.c,54 :: 		
	DECF       FSR, 1
;osa_pic16_mikroc.c,55 :: 		
	MOVWF      2
;osa_pic16_mikroc.c,57 :: 		
L_end__OS_JumpToTask:
	RETURN
; end of __OS_JumpToTask

__OS_ReturnSave:

;osa_pic16_mikroc.c,78 :: 		
;osa_pic16_mikroc.c,81 :: 		
	CLRF       3
;osa_pic16_mikroc.c,82 :: 		
	MOVWF      R0+0
;osa_pic16_mikroc.c,83 :: 		
	BCF        10, 1
;osa_pic16_mikroc.c,84 :: 		
	BTFSC      R0+0, 7
;osa_pic16_mikroc.c,85 :: 		
	BSF        10, 1
;osa_pic16_mikroc.c,87 :: 		
	MOVF       FSR, 0
	MOVWF      __OS_Temp+0
;osa_pic16_mikroc.c,88 :: 		
	CALL       ___OS_SET_FSR_CUR_TASK+0
	MOVLW      2
	ADDWF      FSR, 1
;osa_pic16_mikroc.c,90 :: 		
	MOVF       R0+0, 0
	MOVWF      0
;osa_pic16_mikroc.c,91 :: 		
	DECF       FSR, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      FSR
;osa_pic16_mikroc.c,92 :: 		
	MOVF       __OS_Temp+0, 0
	MOVWF      0
;osa_pic16_mikroc.c,93 :: 		
	DECF       FSR, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      FSR
;osa_pic16_mikroc.c,95 :: 		
	BSF        0, 3
;osa_pic16_mikroc.c,97 :: 		
	BTFSS      PCLATH+0, 1
	GOTO       L__OS_ReturnSave0
;osa_pic16_mikroc.c,99 :: 		
	BCF        0, 3
;osa_pic16_mikroc.c,103 :: 		
	BTFSC      0, 4
	GOTO       L__OS_ReturnSave1
	BCF        0, 5
L__OS_ReturnSave1:
;osa_pic16_mikroc.c,104 :: 		
	BTFSS      PCLATH+0, 0
	GOTO       L__OS_ReturnSave2
	BSF        0, 5
L__OS_ReturnSave2:
;osa_pic16_mikroc.c,107 :: 		
L__OS_ReturnSave0:
;osa_pic16_mikroc.c,108 :: 		
L_end__OS_ReturnSave:
	RETURN
; end of __OS_ReturnSave

___OS_SET_FSR_CUR_TASK:

;osa_pic16_mikroc.c,115 :: 		
;osa_pic16_mikroc.c,117 :: 		
	MOVF       __OS_CurTask+0, 0
	MOVWF      FSR
;osa_pic16_mikroc.c,118 :: 		
	MOVLW      hi_addr(__OS_Tasks+0)
	IORLW      0
	BCF        3, 7
	BTFSS      3, 2
	BSF        3, 7
;osa_pic16_mikroc.c,119 :: 		
L_end___OS_SET_FSR_CUR_TASK:
	RETURN
; end of ___OS_SET_FSR_CUR_TASK

__OS_Task_Create:

;osa_pic16_mikroc.c,148 :: 		
;osa_pic16_mikroc.c,152 :: 		
	BCF        __OS_Flags+0, 1
;osa_pic16_mikroc.c,164 :: 		
	MOVLW      __OS_Tasks+0
	MOVWF      R1+0
;osa_pic16_mikroc.c,165 :: 		
	CLRF       __OS_Temp+0
;osa_pic16_mikroc.c,167 :: 		
L__OS_Task_Create3:
;osa_pic16_mikroc.c,168 :: 		
	MOVLW      hi_addr(__OS_Tasks+0)
	IORLW      0
	BCF        3, 7
	BTFSS      3, 2
	BSF        3, 7
;osa_pic16_mikroc.c,170 :: 		
	MOVF       R1+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	BTFSC      R0+0, 6
	GOTO       L__OS_Task_Create6
;osa_pic16_mikroc.c,172 :: 		
	BSF        FARG__OS_Task_Create_priority+0, 6
;osa_pic16_mikroc.c,173 :: 		
	BSF        FARG__OS_Task_Create_priority+0, 3
;osa_pic16_mikroc.c,175 :: 		
	INCF       R1+0, 0
	MOVWF      FSR
	MOVF       FARG__OS_Task_Create_TaskAddr+0, 0
	MOVWF      INDF+0
	MOVF       FARG__OS_Task_Create_TaskAddr+1, 0
	INCF       FSR, 1
	MOVWF      INDF+0
;osa_pic16_mikroc.c,178 :: 		
	MOVLW      3
	ADDWF      R1+0, 0
	MOVWF      FSR
	CLRF       INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
;osa_pic16_mikroc.c,185 :: 		
	MOVF       R1+0, 0
	MOVWF      FSR
	MOVF       FARG__OS_Task_Create_priority+0, 0
	MOVWF      INDF+0
;osa_pic16_mikroc.c,191 :: 		
	BCF        __OS_Flags+0, 1
;osa_pic16_mikroc.c,192 :: 		
	BCF        IRP_bit+0, BitPos(IRP_bit+0)
;osa_pic16_mikroc.c,193 :: 		
	GOTO       L_end__OS_Task_Create
;osa_pic16_mikroc.c,194 :: 		
L__OS_Task_Create6:
;osa_pic16_mikroc.c,196 :: 		
	MOVLW      5
	ADDWF      R1+0, 1
;osa_pic16_mikroc.c,198 :: 		
	INCF       __OS_Temp+0, 1
	MOVLW      5
	SUBWF      __OS_Temp+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L__OS_Task_Create3
;osa_pic16_mikroc.c,201 :: 		
	BSF        __OS_Flags+0, 1
;osa_pic16_mikroc.c,203 :: 		
	BCF        IRP_bit+0, BitPos(IRP_bit+0)
;osa_pic16_mikroc.c,204 :: 		
;osa_pic16_mikroc.c,205 :: 		
L_end__OS_Task_Create:
	RETURN
; end of __OS_Task_Create

__OS_Task_GetPriority:

;osa_pic16_mikroc.c,226 :: 		
;osa_pic16_mikroc.c,229 :: 		
	MOVLW      hi_addr(__OS_Tasks+0)
	IORLW      0
	BCF        3, 7
	BTFSS      3, 2
	BSF        3, 7
;osa_pic16_mikroc.c,230 :: 		
	MOVF       FARG__OS_Task_GetPriority_pTask+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVLW      7
	ANDWF      R0+0, 1
;osa_pic16_mikroc.c,231 :: 		
	BCF        IRP_bit+0, BitPos(IRP_bit+0)
;osa_pic16_mikroc.c,232 :: 		
;osa_pic16_mikroc.c,233 :: 		
L_end__OS_Task_GetPriority:
	RETURN
; end of __OS_Task_GetPriority

__OS_Task_IsPaused:

;osa_pic16_mikroc.c,254 :: 		
;osa_pic16_mikroc.c,257 :: 		
	MOVLW      hi_addr(__OS_Tasks+0)
	IORLW      0
	BCF        3, 7
	BTFSS      3, 2
	BSF        3, 7
;osa_pic16_mikroc.c,258 :: 		
	MOVF       FARG__OS_Task_IsPaused_pTask+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	BTFSS      R0+0, 7
	GOTO       L__OS_Task_IsPaused7
	MOVLW      1
	MOVWF      R1+0
	GOTO       L__OS_Task_IsPaused8
L__OS_Task_IsPaused7:
	CLRF       R1+0
L__OS_Task_IsPaused8:
;osa_pic16_mikroc.c,259 :: 		
	BCF        IRP_bit+0, BitPos(IRP_bit+0)
;osa_pic16_mikroc.c,260 :: 		
	MOVF       R1+0, 0
	MOVWF      R0+0
;osa_pic16_mikroc.c,261 :: 		
L_end__OS_Task_IsPaused:
	RETURN
; end of __OS_Task_IsPaused

__OS_Task_IsEnable:

;osa_pic16_mikroc.c,281 :: 		
;osa_pic16_mikroc.c,285 :: 		
	MOVLW      hi_addr(__OS_Tasks+0)
	IORLW      0
	BCF        3, 7
	BTFSS      3, 2
	BSF        3, 7
;osa_pic16_mikroc.c,286 :: 		
	MOVF       FARG__OS_Task_IsEnable_pTask+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	BTFSS      R0+0, 6
	GOTO       L__OS_Task_IsEnable9
	MOVLW      1
	MOVWF      R1+0
	GOTO       L__OS_Task_IsEnable10
L__OS_Task_IsEnable9:
	CLRF       R1+0
L__OS_Task_IsEnable10:
;osa_pic16_mikroc.c,287 :: 		
	BCF        IRP_bit+0, BitPos(IRP_bit+0)
;osa_pic16_mikroc.c,288 :: 		
	MOVF       R1+0, 0
	MOVWF      R0+0
;osa_pic16_mikroc.c,289 :: 		
L_end__OS_Task_IsEnable:
	RETURN
; end of __OS_Task_IsEnable

_OS_DI:

;osa_pic16_mikroc.c,331 :: 		
;osa_pic16_mikroc.c,334 :: 		
	MOVLW      128
	ANDWF      11, 0
	MOVWF      R0+0
;osa_pic16_mikroc.c,335 :: 		
	BCF        GIE_bit+0, BitPos(GIE_bit+0)
;osa_pic16_mikroc.c,336 :: 		
;osa_pic16_mikroc.c,337 :: 		
L_end_OS_DI:
	RETURN
; end of _OS_DI

__OS_DI_INT:

;osa_pic16_mikroc.c,343 :: 		
;osa_pic16_mikroc.c,345 :: 		
	MOVLW      128
	ANDWF      11, 0
	MOVWF      __OS_Temp_I+0
;osa_pic16_mikroc.c,346 :: 		
	BCF        GIE_bit+0, BitPos(GIE_bit+0)
;osa_pic16_mikroc.c,347 :: 		
L_end__OS_DI_INT:
	RETURN
; end of __OS_DI_INT

_OS_EnterCriticalSection:

;osa_pic16_mikroc.c,393 :: 		
;osa_pic16_mikroc.c,396 :: 		
	CALL       _OS_DI+0
;osa_pic16_mikroc.c,397 :: 		
	BSF        __OS_Flags+0, 2
;osa_pic16_mikroc.c,399 :: 		
	BCF        __OS_Flags+0, 6
;osa_pic16_mikroc.c,400 :: 		
	BTFSS      R0+0, 7
	GOTO       L_OS_EnterCriticalSection11
	BSF        __OS_Flags+0, 6
L_OS_EnterCriticalSection11:
;osa_pic16_mikroc.c,402 :: 		
L_end_OS_EnterCriticalSection:
	RETURN
; end of _OS_EnterCriticalSection

_OS_LeaveCriticalSection:

;osa_pic16_mikroc.c,428 :: 		
;osa_pic16_mikroc.c,431 :: 		
	BCF        __OS_Flags+0, 2
;osa_pic16_mikroc.c,432 :: 		
	CLRF       R1+0
;osa_pic16_mikroc.c,433 :: 		
	BTFSS      __OS_Flags+0, 6
	GOTO       L_OS_LeaveCriticalSection12
	BSF        R1+0, 7
L_OS_LeaveCriticalSection12:
;osa_pic16_mikroc.c,434 :: 		
	BTFSS      R1+0, 7
	GOTO       L_OS_LeaveCriticalSection13
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
L_OS_LeaveCriticalSection13:
;osa_pic16_mikroc.c,435 :: 		
L_end_OS_LeaveCriticalSection:
	RETURN
; end of _OS_LeaveCriticalSection

__OS_InitDelay:

;osa_pic16_mikroc.c,500 :: 		
;osa_pic16_mikroc.c,503 :: 		
	CALL       ___OS_SET_FSR_CUR_TASK+0
;osa_pic16_mikroc.c,504 :: 		
	BCF        0, 5
;osa_pic16_mikroc.c,505 :: 		
	BCF        0, 4
;osa_pic16_mikroc.c,507 :: 		
	MOVF       FARG__OS_InitDelay_Delay+0, 0
	IORWF      FARG__OS_InitDelay_Delay+1, 0
	BTFSC      STATUS+0, 2
	GOTO       L__OS_InitDelay14
;osa_pic16_mikroc.c,510 :: 		
	MOVLW      255
	XORWF      FARG__OS_InitDelay_Delay+0, 1
	MOVLW      255
	XORWF      FARG__OS_InitDelay_Delay+1, 1
;osa_pic16_mikroc.c,511 :: 		
	INCF       FARG__OS_InitDelay_Delay+0, 1
	BTFSC      STATUS+0, 2
	INCF       FARG__OS_InitDelay_Delay+1, 1
;osa_pic16_mikroc.c,513 :: 		
	MOVLW      hi_addr(__OS_Tasks+0)
	IORLW      0
	BCF        3, 7
	BTFSS      3, 2
	BSF        3, 7
;osa_pic16_mikroc.c,514 :: 		
	MOVF       __OS_CurTask+0, 0
	MOVWF      R0+0
	MOVLW      3
	ADDWF      R0+0, 0
	MOVWF      FSR
	MOVF       FARG__OS_InitDelay_Delay+0, 0
	MOVWF      INDF+0
	MOVF       FARG__OS_InitDelay_Delay+1, 0
	INCF       FSR, 1
	MOVWF      INDF+0
;osa_pic16_mikroc.c,515 :: 		
	CALL       ___OS_SET_FSR_CUR_TASK+0
;osa_pic16_mikroc.c,516 :: 		
	BSF        0, 4
;osa_pic16_mikroc.c,517 :: 		
	BSF        0, 3
;osa_pic16_mikroc.c,519 :: 		
L__OS_InitDelay14:
;osa_pic16_mikroc.c,520 :: 		
L_end__OS_InitDelay:
	RETURN
; end of __OS_InitDelay

__OS_CheckEvent:

;osa_pic16_mikroc.c,569 :: 		
;osa_pic16_mikroc.c,604 :: 		
	BCF        __OS_Flags+0, 5
;osa_pic16_mikroc.c,605 :: 		
	CALL       ___OS_SET_FSR_CUR_TASK+0
;osa_pic16_mikroc.c,607 :: 		
	MOVF       FARG__OS_CheckEvent_bEvent+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L__OS_CheckEvent15
;osa_pic16_mikroc.c,609 :: 		
	BTFSS      0, 3
	GOTO       L__OS_CheckEvent16
;osa_pic16_mikroc.c,611 :: 		
____OS_CheckEvent_EXIT_GOOD:
;osa_pic16_mikroc.c,614 :: 		
	BCF        0, 4
;osa_pic16_mikroc.c,619 :: 		
	BSF        __OS_Flags+0, 7
;osa_pic16_mikroc.c,622 :: 		
	MOVLW      1
	MOVWF      R0+0
	GOTO       L_end__OS_CheckEvent
;osa_pic16_mikroc.c,623 :: 		
L__OS_CheckEvent16:
;osa_pic16_mikroc.c,625 :: 		
	BSF        0, 3
;osa_pic16_mikroc.c,627 :: 		
	GOTO       L__OS_CheckEvent17
L__OS_CheckEvent15:
;osa_pic16_mikroc.c,628 :: 		
	BCF        0, 3
;osa_pic16_mikroc.c,629 :: 		
L__OS_CheckEvent17:
;osa_pic16_mikroc.c,633 :: 		
	BTFSC      0, 4
	GOTO       L__OS_CheckEvent20
	BTFSS      0, 5
	GOTO       L__OS_CheckEvent20
L___OS_CheckEvent35:
;osa_pic16_mikroc.c,635 :: 		
	BSF        __OS_Flags+0, 5
;osa_pic16_mikroc.c,636 :: 		
	BSF        0, 3
;osa_pic16_mikroc.c,637 :: 		
	GOTO       ____OS_CheckEvent_EXIT_GOOD
;osa_pic16_mikroc.c,638 :: 		
L__OS_CheckEvent20:
;osa_pic16_mikroc.c,642 :: 		
	CLRF       R0+0
;osa_pic16_mikroc.c,647 :: 		
L_end__OS_CheckEvent:
	RETURN
; end of __OS_CheckEvent

__OS_Queue_Send:

;osa_queue.c,64 :: 		
;osa_queue.c,70 :: 		
	MOVLW      3
	MOVWF      R3+0
	MOVLW      R4+0
	MOVWF      R2+0
	MOVF       FARG__OS_Queue_Send_pQueue+0, 0
	MOVWF      R1+0
L__OS_Queue_Send21:
	MOVF       R1+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
	INCF       R2+0, 1
	INCF       R1+0, 1
	DECF       R3+0, 1
	BTFSS      STATUS+0, 2
	GOTO       L__OS_Queue_Send21
;osa_queue.c,71 :: 		
	BCF        __OS_Flags+0, 0
;osa_queue.c,77 :: 		
	MOVF       R4+0, 0
	XORWF      R4+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__OS_Queue_Send22
;osa_queue.c,79 :: 		
	MOVLW      3
	ADDWF      FARG__OS_Queue_Send_pQueue+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVF       R4+2, 0
	ADDWF      R0+0, 0
	MOVWF      FSR
	MOVF       FARG__OS_Queue_Send_Msg+0, 0
	MOVWF      INDF+0
;osa_queue.c,80 :: 		
	INCF       R4+2, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      R4+2
;osa_queue.c,81 :: 		
	MOVF       R4+2, 0
	XORWF      R4+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__OS_Queue_Send23
	CLRF       R4+2
L__OS_Queue_Send23:
;osa_queue.c,83 :: 		
	BSF        __OS_Flags+0, 0
;osa_queue.c,84 :: 		
	GOTO       ____OS_Queue_Send_EXIT
;osa_queue.c,85 :: 		
L__OS_Queue_Send22:
;osa_queue.c,92 :: 		
	MOVF       R4+2, 0
	MOVWF      R0+0
	CLRF       R0+1
	MOVF       R4+1, 0
	ADDWF      R0+0, 0
	MOVWF      R2+0
	MOVF       R0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R2+1
	MOVF       R2+0, 0
	MOVWF      R7+0
	MOVF       R2+1, 0
	MOVWF      R7+1
;osa_queue.c,93 :: 		
	MOVLW      0
	SUBWF      R2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L___OS_Queue_Send50
	MOVF       R4+0, 0
	SUBWF      R2+0, 0
L___OS_Queue_Send50:
	BTFSS      STATUS+0, 0
	GOTO       L__OS_Queue_Send24
	MOVF       R4+0, 0
	SUBWF      R7+0, 1
	BTFSS      STATUS+0, 0
	DECF       R7+1, 1
L__OS_Queue_Send24:
;osa_queue.c,94 :: 		
	MOVLW      3
	ADDWF      FARG__OS_Queue_Send_pQueue+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVF       R7+0, 0
	ADDWF      R0+0, 0
	MOVWF      FSR
	MOVF       FARG__OS_Queue_Send_Msg+0, 0
	MOVWF      INDF+0
;osa_queue.c,95 :: 		
	INCF       R4+1, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      R4+1
;osa_queue.c,97 :: 		
____OS_Queue_Send_EXIT:
;osa_queue.c,99 :: 		
	MOVLW      3
	MOVWF      R3+0
	MOVF       FARG__OS_Queue_Send_pQueue+0, 0
	MOVWF      R2+0
	MOVLW      R4+0
	MOVWF      R1+0
L__OS_Queue_Send25:
	MOVF       R1+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
	INCF       R2+0, 1
	INCF       R1+0, 1
	DECF       R3+0, 1
	BTFSS      STATUS+0, 2
	GOTO       L__OS_Queue_Send25
;osa_queue.c,100 :: 		
L_end__OS_Queue_Send:
	RETURN
; end of __OS_Queue_Send

__OS_Queue_Get:

;osa_queue.c,213 :: 		
;osa_queue.c,220 :: 		
	MOVLW      3
	MOVWF      R3+0
	MOVLW      R4+0
	MOVWF      R2+0
	MOVF       FARG__OS_Queue_Get_pQueue+0, 0
	MOVWF      R1+0
L__OS_Queue_Get26:
	MOVF       R1+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
	INCF       R2+0, 1
	INCF       R1+0, 1
	DECF       R3+0, 1
	BTFSS      STATUS+0, 2
	GOTO       L__OS_Queue_Get26
;osa_queue.c,221 :: 		
	MOVF       R4+2, 0
	MOVWF      R7+0
;osa_queue.c,222 :: 		
	INCF       R4+2, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      R4+2
;osa_queue.c,224 :: 		
	MOVF       R4+0, 0
	SUBWF      R4+2, 0
	BTFSS      STATUS+0, 0
	GOTO       L__OS_Queue_Get27
	CLRF       R4+2
L__OS_Queue_Get27:
;osa_queue.c,226 :: 		
	DECF       R4+1, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      R4+1
;osa_queue.c,227 :: 		
	MOVLW      3
	MOVWF      R3+0
	MOVF       FARG__OS_Queue_Get_pQueue+0, 0
	MOVWF      R2+0
	MOVLW      R4+0
	MOVWF      R1+0
L__OS_Queue_Get28:
	MOVF       R1+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
	INCF       R2+0, 1
	INCF       R1+0, 1
	DECF       R3+0, 1
	BTFSS      STATUS+0, 2
	GOTO       L__OS_Queue_Get28
;osa_queue.c,229 :: 		
	MOVLW      3
	ADDWF      FARG__OS_Queue_Get_pQueue+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVF       R7+0, 0
	ADDWF      R0+0, 0
	MOVWF      FSR
;osa_queue.c,231 :: 		
	MOVF       INDF+0, 0
	MOVWF      R0+0
;osa_queue.c,232 :: 		
L_end__OS_Queue_Get:
	RETURN
; end of __OS_Queue_Get

__OS_Csem_Signal:

;osa_csem.c,64 :: 		
;osa_csem.c,66 :: 		
	BCF        __OS_Flags+0, 0
;osa_csem.c,68 :: 		
	MOVF       FARG__OS_Csem_Signal_pCSem+0, 0
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
	MOVF       FARG__OS_Csem_Signal_pCSem+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
	MOVF       R0+1, 0
	INCF       FSR, 1
	MOVWF      INDF+0
;osa_csem.c,69 :: 		
	MOVF       FARG__OS_Csem_Signal_pCSem+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	IORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__OS_Csem_Signal29
;osa_csem.c,71 :: 		
	MOVF       FARG__OS_Csem_Signal_pCSem+0, 0
	MOVWF      FSR
	MOVLW      255
	MOVWF      INDF+0
	MOVLW      255
	INCF       FSR, 1
	MOVWF      INDF+0
;osa_csem.c,72 :: 		
	BSF        __OS_Flags+0, 0
;osa_csem.c,73 :: 		
L__OS_Csem_Signal29:
;osa_csem.c,74 :: 		
L_end__OS_Csem_Signal:
	RETURN
; end of __OS_Csem_Signal

__OS_Csem_Signal_I:

;osa_csem.c,87 :: 		
;osa_csem.c,89 :: 		
	BCF        __OS_Flags+0, 0
;osa_csem.c,91 :: 		
	MOVF       FARG__OS_Csem_Signal_I_pCSem+0, 0
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
	MOVF       FARG__OS_Csem_Signal_I_pCSem+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
	MOVF       R0+1, 0
	INCF       FSR, 1
	MOVWF      INDF+0
;osa_csem.c,92 :: 		
	MOVF       FARG__OS_Csem_Signal_I_pCSem+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	IORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__OS_Csem_Signal_I30
;osa_csem.c,94 :: 		
	MOVF       FARG__OS_Csem_Signal_I_pCSem+0, 0
	MOVWF      FSR
	MOVLW      255
	MOVWF      INDF+0
	MOVLW      255
	INCF       FSR, 1
	MOVWF      INDF+0
;osa_csem.c,95 :: 		
	BSF        __OS_Flags+0, 0
;osa_csem.c,96 :: 		
L__OS_Csem_Signal_I30:
;osa_csem.c,97 :: 		
L_end__OS_Csem_Signal_I:
	RETURN
; end of __OS_Csem_Signal_I

_OS_Init:

;osa_system.c,67 :: 		
;osa_system.c,72 :: 		
	CLRF       __OS_Flags+0
;osa_system.c,75 :: 		
	BTFSS      10, 7
	GOTO       L_OS_Init31
	CALL       __OS_ReturnSave+0
L_OS_Init31:
;osa_system.c,326 :: 		
	BCF        __OS_Tasks+0, 6
;osa_system.c,329 :: 		
	BCF        __OS_Tasks+5, 6
;osa_system.c,333 :: 		
	BCF        __OS_Tasks+10, 6
;osa_system.c,337 :: 		
	BCF        __OS_Tasks+15, 6
;osa_system.c,341 :: 		
	BCF        __OS_Tasks+20, 6
;osa_system.c,379 :: 		
	MOVLW      hi_addr(__OS_Tasks+0)
	IORLW      0
	BCF        3, 7
	BTFSS      3, 2
	BSF        3, 7
;osa_system.c,380 :: 		
	MOVLW      __OS_Tasks+0
	MOVWF      __OS_CurTask+0
;osa_system.c,381 :: 		
	MOVLW      5
	MOVWF      __OS_Temp+0
;osa_system.c,382 :: 		
L_OS_Init32:
;osa_system.c,384 :: 		
	MOVLW      1
	SUBWF      __OS_Temp+0, 0
	MOVWF      R0+0
	CLRF       R0+1
	BTFSS      STATUS+0, 0
	DECF       R0+1, 1
	MOVF       R0+0, 0
	ADDLW      __OS_TaskQueue+0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;osa_system.c,385 :: 		
	MOVLW      1
	SUBWF      __OS_Temp+0, 0
	MOVWF      R0+0
	CLRF       R0+1
	BTFSS      STATUS+0, 0
	DECF       R0+1, 1
	MOVF       R0+0, 0
	ADDLW      __OS_TaskLevel+0
	MOVWF      FSR
	CLRF       INDF+0
;osa_system.c,386 :: 		
	DECF       __OS_Temp+0, 1
	MOVF       __OS_Temp+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_OS_Init32
;osa_system.c,387 :: 		
	BCF        IRP_bit+0, BitPos(IRP_bit+0)
;osa_system.c,394 :: 		
L_end_OS_Init:
	RETURN
; end of _OS_Init
