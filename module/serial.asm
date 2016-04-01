
_serial_init:

;serial.c,13 :: 		void serial_init()
;serial.c,15 :: 		UART1_Init(BAUDRATE);
	MOVLW      129
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;serial.c,16 :: 		}
L_end_serial_init:
	RETURN
; end of _serial_init

_serial_dataready:

;serial.c,17 :: 		bool serial_dataready()
;serial.c,19 :: 		return UART1_Data_Ready();
	CALL       _UART1_Data_Ready+0
;serial.c,20 :: 		}
L_end_serial_dataready:
	RETURN
; end of _serial_dataready

_serial_read:

;serial.c,21 :: 		unsigned char serial_read()
;serial.c,23 :: 		return UART1_Read();
	CALL       _UART1_Read+0
;serial.c,24 :: 		}
L_end_serial_read:
	RETURN
; end of _serial_read

_serial_write_text:

;serial.c,25 :: 		void serial_write_text(char *text)
;serial.c,27 :: 		UART1_Write_Text(text);
	MOVF       FARG_serial_write_text_text+0, 0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;serial.c,28 :: 		}
L_end_serial_write_text:
	RETURN
; end of _serial_write_text

_serial_process_data:

;serial.c,29 :: 		bool serial_process_data(char readata, unsigned char *TyprCmd, char *Value)
;serial.c,31 :: 		bool retval = false;
	CLRF       serial_process_data_retval_L0+0
;serial.c,32 :: 		ReadData[index++] = readata;
	MOVF       serial_index+0, 0
	ADDLW      serial_ReadData+0
	MOVWF      FSR
	MOVF       FARG_serial_process_data_readata+0, 0
	MOVWF      INDF+0
	INCF       serial_index+0, 1
;serial.c,33 :: 		switch (ReadData[0])
	GOTO       L_serial_process_data0
;serial.c,35 :: 		case RELAY_STATUS_CMD_CODE:      //0x80 0x0F 0xFF: Tat ca relay on
L_serial_process_data2:
;serial.c,36 :: 		if (ReadData[index-1] == END_CMD)
	MOVLW      1
	SUBWF      serial_index+0, 0
	MOVWF      R0+0
	CLRF       R0+1
	BTFSS      STATUS+0, 0
	DECF       R0+1, 1
	MOVF       R0+0, 0
	ADDLW      serial_ReadData+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      255
	BTFSS      STATUS+0, 2
	GOTO       L_serial_process_data3
;serial.c,38 :: 		retval = true;
	MOVLW      1
	MOVWF      serial_process_data_retval_L0+0
;serial.c,39 :: 		index = 0;
	CLRF       serial_index+0
;serial.c,40 :: 		*TyprCmd = ReadData[0];
	MOVF       FARG_serial_process_data_TyprCmd+0, 0
	MOVWF      FSR
	MOVF       serial_ReadData+0, 0
	MOVWF      INDF+0
;serial.c,41 :: 		memcpy(Value, ReadData + 1, 1);
	MOVF       FARG_serial_process_data_Value+0, 0
	MOVWF      FARG_memcpy_d1+0
	MOVLW      serial_ReadData+1
	MOVWF      FARG_memcpy_s1+0
	MOVLW      1
	MOVWF      FARG_memcpy_n+0
	MOVLW      0
	MOVWF      FARG_memcpy_n+1
	CALL       _memcpy+0
;serial.c,42 :: 		}
L_serial_process_data3:
;serial.c,43 :: 		break;
	GOTO       L_serial_process_data1
;serial.c,44 :: 		case RTC_TIME_SET_CMD_CODE:          //0x81 23 22 00 3 03 03 16 0xFF
L_serial_process_data4:
;serial.c,45 :: 		if (ReadData[index-1] == END_CMD)
	MOVLW      1
	SUBWF      serial_index+0, 0
	MOVWF      R0+0
	CLRF       R0+1
	BTFSS      STATUS+0, 0
	DECF       R0+1, 1
	MOVF       R0+0, 0
	ADDLW      serial_ReadData+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      255
	BTFSS      STATUS+0, 2
	GOTO       L_serial_process_data5
;serial.c,47 :: 		retval = true;
	MOVLW      1
	MOVWF      serial_process_data_retval_L0+0
;serial.c,48 :: 		index = 0;
	CLRF       serial_index+0
;serial.c,49 :: 		*TyprCmd = ReadData[0];
	MOVF       FARG_serial_process_data_TyprCmd+0, 0
	MOVWF      FSR
	MOVF       serial_ReadData+0, 0
	MOVWF      INDF+0
;serial.c,50 :: 		memcpy(Value, ReadData + 1, 7);
	MOVF       FARG_serial_process_data_Value+0, 0
	MOVWF      FARG_memcpy_d1+0
	MOVLW      serial_ReadData+1
	MOVWF      FARG_memcpy_s1+0
	MOVLW      7
	MOVWF      FARG_memcpy_n+0
	MOVLW      0
	MOVWF      FARG_memcpy_n+1
	CALL       _memcpy+0
;serial.c,51 :: 		}
L_serial_process_data5:
;serial.c,52 :: 		break;
	GOTO       L_serial_process_data1
;serial.c,53 :: 		case RELAY_OFF_TIME_CMD_CODE:          //0x81 23 22 00 3 03 03 16 0xFF
L_serial_process_data6:
;serial.c,54 :: 		if (ReadData[index-1] == END_CMD)
	MOVLW      1
	SUBWF      serial_index+0, 0
	MOVWF      R0+0
	CLRF       R0+1
	BTFSS      STATUS+0, 0
	DECF       R0+1, 1
	MOVF       R0+0, 0
	ADDLW      serial_ReadData+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      255
	BTFSS      STATUS+0, 2
	GOTO       L_serial_process_data7
;serial.c,56 :: 		retval = true;
	MOVLW      1
	MOVWF      serial_process_data_retval_L0+0
;serial.c,57 :: 		index = 0;
	CLRF       serial_index+0
;serial.c,58 :: 		*TyprCmd = ReadData[0];
	MOVF       FARG_serial_process_data_TyprCmd+0, 0
	MOVWF      FSR
	MOVF       serial_ReadData+0, 0
	MOVWF      INDF+0
;serial.c,59 :: 		memcpy(Value, ReadData + 1, 8);
	MOVF       FARG_serial_process_data_Value+0, 0
	MOVWF      FARG_memcpy_d1+0
	MOVLW      serial_ReadData+1
	MOVWF      FARG_memcpy_s1+0
	MOVLW      8
	MOVWF      FARG_memcpy_n+0
	MOVLW      0
	MOVWF      FARG_memcpy_n+1
	CALL       _memcpy+0
;serial.c,60 :: 		}
L_serial_process_data7:
;serial.c,61 :: 		break;
	GOTO       L_serial_process_data1
;serial.c,62 :: 		case END_CMD:
L_serial_process_data8:
;serial.c,63 :: 		index = 0;
	CLRF       serial_index+0
;serial.c,64 :: 		break;
	GOTO       L_serial_process_data1
;serial.c,65 :: 		}
L_serial_process_data0:
	MOVF       serial_ReadData+0, 0
	XORLW      128
	BTFSC      STATUS+0, 2
	GOTO       L_serial_process_data2
	MOVF       serial_ReadData+0, 0
	XORLW      129
	BTFSC      STATUS+0, 2
	GOTO       L_serial_process_data4
	MOVF       serial_ReadData+0, 0
	XORLW      130
	BTFSC      STATUS+0, 2
	GOTO       L_serial_process_data6
	MOVF       serial_ReadData+0, 0
	XORLW      255
	BTFSC      STATUS+0, 2
	GOTO       L_serial_process_data8
L_serial_process_data1:
;serial.c,66 :: 		return retval;
	MOVF       serial_process_data_retval_L0+0, 0
	MOVWF      R0+0
;serial.c,67 :: 		}
L_end_serial_process_data:
	RETURN
; end of _serial_process_data
