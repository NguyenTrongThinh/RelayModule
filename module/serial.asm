
_serial_init:

;serial.c,5 :: 		void serial_init()
;serial.c,7 :: 		UART1_Init(BAUDRATE);
	MOVLW      129
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;serial.c,8 :: 		}
L_end_serial_init:
	RETURN
; end of _serial_init

_serial_dataready:

;serial.c,9 :: 		bool serial_dataready()
;serial.c,11 :: 		return UART1_Data_Ready();
	CALL       _UART1_Data_Ready+0
;serial.c,12 :: 		}
L_end_serial_dataready:
	RETURN
; end of _serial_dataready

_serial_read:

;serial.c,13 :: 		unsigned char serial_read()
;serial.c,15 :: 		return UART1_Read();
	CALL       _UART1_Read+0
;serial.c,16 :: 		}
L_end_serial_read:
	RETURN
; end of _serial_read

_serial_write_text:

;serial.c,17 :: 		void serial_write_text(char *text)
;serial.c,19 :: 		UART1_Write_Text(text);
	MOVF       FARG_serial_write_text_text+0, 0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;serial.c,20 :: 		}
L_end_serial_write_text:
	RETURN
; end of _serial_write_text
