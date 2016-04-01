#line 1 "D:/PIC/RelayModule/module/serial.c"
#line 1 "d:/pic/relaymodule/module/serial.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic/include/stdbool.h"



 typedef char _Bool;
#line 7 "d:/pic/relaymodule/module/serial.h"
void serial_init();
 _Bool  serial_dataready();
unsigned char serial_read();
void serial_write_text(char *text);
 _Bool  serial_process_data(char readata, unsigned char *TyprCmd, char *Value);
#line 11 "D:/PIC/RelayModule/module/serial.c"
static unsigned char ReadData[10];
static unsigned char index = 0;
void serial_init()
{
 UART1_Init( 9600 );
}
 _Bool  serial_dataready()
{
 return UART1_Data_Ready();
}
unsigned char serial_read()
{
 return UART1_Read();
}
void serial_write_text(char *text)
{
 UART1_Write_Text(text);
}
 _Bool  serial_process_data(char readata, unsigned char *TyprCmd, char *Value)
{
  _Bool  retval =  0 ;
 ReadData[index++] = readata;
 switch (ReadData[0])
 {
 case  0x80 :
 if (ReadData[index-1] ==  0xFF )
 {
 retval =  1 ;
 index = 0;
 *TyprCmd = ReadData[0];
 memcpy(Value, ReadData + 1, 1);
 }
 break;
 case  0x81 :
 if (ReadData[index-1] ==  0xFF )
 {
 retval =  1 ;
 index = 0;
 *TyprCmd = ReadData[0];
 memcpy(Value, ReadData + 1, 7);
 }
 break;
 case  0x82 :
 if (ReadData[index-1] ==  0xFF )
 {
 retval =  1 ;
 index = 0;
 *TyprCmd = ReadData[0];
 memcpy(Value, ReadData + 1, 8);
 }
 break;
 case  0xFF :
 index = 0;
 break;
 }
 return retval;
}
