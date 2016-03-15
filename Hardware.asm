
_HWStartUp:

;Hardware.c,26 :: 		void HWStartUp()
;Hardware.c,28 :: 		ANSEL = ANSELH = 0;
	CLRF       ANSELH+0
	CLRF       ANSEL+0
;Hardware.c,30 :: 		LCD_RW_Direction = 0;
	BCF        TRISD+0, 3
;Hardware.c,31 :: 		LCD_RW = 0;
	BCF        PORTD+0, 3
;Hardware.c,32 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;Hardware.c,33 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Hardware.c,34 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Hardware.c,35 :: 		Lcd_Out(1, 1, "Thu Thap Du Lieu");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_Hardware+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Hardware.c,37 :: 		UART1_Init(115200);
	MOVLW      10
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;Hardware.c,39 :: 		UART1_Write_Text("UART Init at 115200 kbps");
	MOVLW      ?lstr2_Hardware+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Hardware.c,40 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Hardware.c,41 :: 		UART1_Write_Text("Thu Thap Du Lieu");
	MOVLW      ?lstr3_Hardware+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;Hardware.c,43 :: 		LM35_Channel = 1;
	BSF        ANSEL+0, 5
;Hardware.c,44 :: 		LM35_Direction = 1;
	BSF        TRISE+0, 0
;Hardware.c,45 :: 		LM35_PIN = 0;
	BCF        PORTE+0, 0
;Hardware.c,46 :: 		ADC_Init();
	CALL       _ADC_Init+0
;Hardware.c,48 :: 		LED1_Direction = 0;
	BCF        TRISB+0, 5
;Hardware.c,49 :: 		LED2_Direction = 0;
	BCF        TRISB+0, 4
;Hardware.c,50 :: 		LED1_PIN = 1;
	BSF        PORTB+0, 5
;Hardware.c,51 :: 		LED2_PIN = 1;
	BSF        PORTB+0, 4
;Hardware.c,52 :: 		}
L_end_HWStartUp:
	RETURN
; end of _HWStartUp
