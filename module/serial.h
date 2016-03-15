#include <stdbool.h>

void serial_init();
bool serial_dataready();
unsigned char serial_read();
void serial_write_text(char *text);
