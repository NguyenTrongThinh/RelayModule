#line 1 "D:/PIC/SmartModule/Hardware.c"
sbit LCD_RS at PORTD.B2;
sbit LCD_RW at PORTD.B3;
sbit LCD_EN at PORTC.B4;
sbit LCD_D7 at PORTD.B7;
sbit LCD_D6 at PORTD.B6;
sbit LCD_D5 at PORTD.B5;
sbit LCD_D4 at PORTD.B4;

sbit LCD_RS_Direction at TRISD.B2;
sbit LCD_RW_Direction at TRISD.B3;
sbit LCD_EN_Direction at TRISC.B4;
sbit LCD_D7_Direction at TRISD.B7;
sbit LCD_D6_Direction at TRISD.B6;
sbit LCD_D5_Direction at TRISD.B5;
sbit LCD_D4_Direction at TRISD.B4;

sbit LM35_PIN at PORTE.B0;
sbit LM35_Direction at TRISE.B0;
sbit LM35_Channel at ANSEL.B5;

sbit LED1_PIN at PORTB.B5;
sbit LED2_PIN at PORTB.B4;
sbit LED1_Direction at TRISB.B5;
sbit LED2_Direction at TRISB.B4;

 void HWStartUp()
{
 ANSEL = ANSELH = 0;

 LCD_RW_Direction = 0;
 LCD_RW = 0;
 Lcd_Init();
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 1, "Thu Thap Du Lieu");

 UART1_Init(115200);

 UART1_Write_Text("UART Init at 115200 kbps");
 UART1_Write(13);
 UART1_Write_Text("Thu Thap Du Lieu");

 LM35_Channel = 1;
 LM35_Direction = 1;
 LM35_PIN = 0;
 ADC_Init();

 LED1_Direction = 0;
 LED2_Direction = 0;
 LED1_PIN = 1;
 LED2_PIN = 1;
}
