#line 1 "D:/PIC/RelayModule/module/serial.c"
#line 1 "d:/pic/relaymodule/module/serial.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic/include/stdbool.h"



 typedef char _Bool;
#line 3 "d:/pic/relaymodule/module/serial.h"
void serial_init();
 _Bool  serial_dataready();
unsigned char serial_read();
void serial_write_text(char *text);
#line 5 "D:/PIC/RelayModule/module/serial.c"
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
