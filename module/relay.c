#include "relay.h"

sbit RELAY_1_TRIS   at      TRISC.B0;
sbit RELAY_2_TRIS   at      TRISC.B1;
sbit RELAY_3_TRIS   at      TRISC.B2;
sbit RELAY_4_TRIS   at      TRISD.B0;

sbit RELAY_1       at       PORTC.B0;
sbit RELAY_2       at       PORTC.B1;
sbit RELAY_3       at       PORTC.B2;
sbit RELAY_4       at       PORTD.B0;


void Relay_Init()
{
 ANSEL = ANSELH = 0;
 RELAY_1_TRIS = 0;
 RELAY_2_TRIS = 0;
 RELAY_3_TRIS = 0;
 RELAY_4_TRIS = 0;
 RELAY_1 = 0;
 RELAY_2 = 0;
 RELAY_3 = 0;
 RELAY_4 = 0;
}
void Relay_ChangeState(unsigned char on_off, unsigned char relay_id)
{
 switch(relay_id)
 {
  case 0:
       RELAY_1 = on_off;
       break;
  case 1:
       RELAY_2 = on_off;
        break;
  case 2:
       RELAY_3 = on_off;
       break;
  case 3:
       RELAY_4 = on_off;
       break;
 }
}