#include <stdbool.h>
#define RELAY_STATUS_CMD_CODE                   0x80
#define RTC_TIME_SET_CMD_CODE                   0x81
#define RELAY_OFF_TIME_CMD_CODE                 0x82
#define GET_CURRENT_RELAY_SETTING               0x83

void serial_init();
bool serial_dataready();
unsigned char serial_read();
void serial_write_text(char *text);
bool serial_process_data(char readata, unsigned char *TyprCmd, char *Value);