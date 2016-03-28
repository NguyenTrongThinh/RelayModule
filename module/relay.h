#define RELAY1          0
#define RELAY2          1
#define RELAY3          2
#define RELAY4          3

#define RELAY_ON        1
#define RELAY_OFF       0

void Relay_Init();
void Relay_ChangeState(unsigned char on_off, unsigned char relay_id);