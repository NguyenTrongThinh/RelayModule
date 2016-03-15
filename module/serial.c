#include "serial.h"
#ifndef BAUDRATE
        #define BAUDRATE        9600
#endif
void serial_init()
{
     UART1_Init(BAUDRATE);
}
bool serial_dataready()
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