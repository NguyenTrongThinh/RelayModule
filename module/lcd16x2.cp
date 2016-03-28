#line 1 "D:/PIC/RelayModule/module/lcd16x2.c"
#line 1 "d:/pic/relaymodule/module/lcd16x2.h"

void lcd16x2_init();
void lcd16x2_write(unsigned char row, unsigned char col, char *text);
void lcd16x2_writecp(char *text);
#line 3 "D:/PIC/RelayModule/module/lcd16x2.c"
sbit LCD_RS at RD1_bit;
sbit LCD_RW at RD2_bit;
sbit LCD_EN at RD3_bit;
sbit LCD_D4 at RD4_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D7 at RD7_bit;
sbit LCD_BKL at RC5_bit;

sbit LCD_RS_Direction at TRISD1_bit;
sbit LCD_RW_Direction at TRISD2_bit;
sbit LCD_EN_Direction at TRISD3_bit;
sbit LCD_D4_Direction at TRISD4_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D7_Direction at TRISD7_bit;
sbit LCD_BKL_Direction at TRISC5_bit;

void lcd16x2_init()
{
 LCD_RW_Direction = 0;
 LCD_BKL_Direction = 0;
 LCD_RW = 0;
 LCD_BKL = 1;
 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
}
void lcd16x2_write(unsigned char row, unsigned char col, char *text)
{
 Lcd_Out(row, col, text);
}
void lcd16x2_writecp(char *text)
{
 Lcd_Out_CP(text);
}
