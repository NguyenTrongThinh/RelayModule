
_Relay_Init:

;relay.c,14 :: 		void Relay_Init()
;relay.c,16 :: 		ANSEL = ANSELH = 0;
	CLRF       ANSELH+0
	CLRF       ANSEL+0
;relay.c,17 :: 		RELAY_1_TRIS = 0;
	BCF        TRISC+0, 0
;relay.c,18 :: 		RELAY_2_TRIS = 0;
	BCF        TRISC+0, 1
;relay.c,19 :: 		RELAY_3_TRIS = 0;
	BCF        TRISC+0, 2
;relay.c,20 :: 		RELAY_4_TRIS = 0;
	BCF        TRISD+0, 0
;relay.c,21 :: 		RELAY_1 = 0;
	BCF        PORTC+0, 0
;relay.c,22 :: 		RELAY_2 = 0;
	BCF        PORTC+0, 1
;relay.c,23 :: 		RELAY_3 = 0;
	BCF        PORTC+0, 2
;relay.c,24 :: 		RELAY_4 = 0;
	BCF        PORTD+0, 0
;relay.c,25 :: 		}
L_end_Relay_Init:
	RETURN
; end of _Relay_Init

_Relay_ChangeState:

;relay.c,26 :: 		void Relay_ChangeState(unsigned char on_off, unsigned char relay_id)
;relay.c,28 :: 		switch(relay_id)
	GOTO       L_Relay_ChangeState0
;relay.c,30 :: 		case 0:
L_Relay_ChangeState2:
;relay.c,31 :: 		RELAY_1 = on_off;
	BTFSC      FARG_Relay_ChangeState_on_off+0, 0
	GOTO       L__Relay_ChangeState8
	BCF        PORTC+0, 0
	GOTO       L__Relay_ChangeState9
L__Relay_ChangeState8:
	BSF        PORTC+0, 0
L__Relay_ChangeState9:
;relay.c,32 :: 		break;
	GOTO       L_Relay_ChangeState1
;relay.c,33 :: 		case 1:
L_Relay_ChangeState3:
;relay.c,34 :: 		RELAY_2 = on_off;
	BTFSC      FARG_Relay_ChangeState_on_off+0, 0
	GOTO       L__Relay_ChangeState10
	BCF        PORTC+0, 1
	GOTO       L__Relay_ChangeState11
L__Relay_ChangeState10:
	BSF        PORTC+0, 1
L__Relay_ChangeState11:
;relay.c,35 :: 		break;
	GOTO       L_Relay_ChangeState1
;relay.c,36 :: 		case 2:
L_Relay_ChangeState4:
;relay.c,37 :: 		RELAY_3 = on_off;
	BTFSC      FARG_Relay_ChangeState_on_off+0, 0
	GOTO       L__Relay_ChangeState12
	BCF        PORTC+0, 2
	GOTO       L__Relay_ChangeState13
L__Relay_ChangeState12:
	BSF        PORTC+0, 2
L__Relay_ChangeState13:
;relay.c,38 :: 		break;
	GOTO       L_Relay_ChangeState1
;relay.c,39 :: 		case 3:
L_Relay_ChangeState5:
;relay.c,40 :: 		RELAY_4 = on_off;
	BTFSC      FARG_Relay_ChangeState_on_off+0, 0
	GOTO       L__Relay_ChangeState14
	BCF        PORTD+0, 0
	GOTO       L__Relay_ChangeState15
L__Relay_ChangeState14:
	BSF        PORTD+0, 0
L__Relay_ChangeState15:
;relay.c,41 :: 		break;
	GOTO       L_Relay_ChangeState1
;relay.c,42 :: 		}
L_Relay_ChangeState0:
	MOVF       FARG_Relay_ChangeState_relay_id+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_Relay_ChangeState2
	MOVF       FARG_Relay_ChangeState_relay_id+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_Relay_ChangeState3
	MOVF       FARG_Relay_ChangeState_relay_id+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_Relay_ChangeState4
	MOVF       FARG_Relay_ChangeState_relay_id+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_Relay_ChangeState5
L_Relay_ChangeState1:
;relay.c,43 :: 		}
L_end_Relay_ChangeState:
	RETURN
; end of _Relay_ChangeState
