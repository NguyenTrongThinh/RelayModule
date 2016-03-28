
_lcd16x2_init:

;lcd16x2.c,21 :: 		void lcd16x2_init()
;lcd16x2.c,23 :: 		LCD_RW_Direction = 0;
	BCF        TRISD2_bit+0, BitPos(TRISD2_bit+0)
;lcd16x2.c,24 :: 		LCD_BKL_Direction = 0;
	BCF        TRISC5_bit+0, BitPos(TRISC5_bit+0)
;lcd16x2.c,25 :: 		LCD_RW = 0;
	BCF        RD2_bit+0, BitPos(RD2_bit+0)
;lcd16x2.c,26 :: 		LCD_BKL = 1;
	BSF        RC5_bit+0, BitPos(RC5_bit+0)
;lcd16x2.c,27 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;lcd16x2.c,28 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;lcd16x2.c,29 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;lcd16x2.c,30 :: 		}
L_end_lcd16x2_init:
	RETURN
; end of _lcd16x2_init

_lcd16x2_write:

;lcd16x2.c,31 :: 		void lcd16x2_write(unsigned char row, unsigned char col, char *text)
;lcd16x2.c,33 :: 		Lcd_Out(row, col, text);
	MOVF       FARG_lcd16x2_write_row+0, 0
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       FARG_lcd16x2_write_col+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       FARG_lcd16x2_write_text+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;lcd16x2.c,34 :: 		}
L_end_lcd16x2_write:
	RETURN
; end of _lcd16x2_write

_lcd16x2_writecp:

;lcd16x2.c,35 :: 		void lcd16x2_writecp(char *text)
;lcd16x2.c,37 :: 		Lcd_Out_CP(text);
	MOVF       FARG_lcd16x2_writecp_text+0, 0
	MOVWF      FARG_Lcd_Out_CP_text+0
	CALL       _Lcd_Out_CP+0
;lcd16x2.c,38 :: 		}
L_end_lcd16x2_writecp:
	RETURN
; end of _lcd16x2_writecp
