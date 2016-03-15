#line 1 "E:/BluetoothFilesreciever/osa_110306/osa/example/mikroc/lights_mikroc.c"
#line 1 "e:/bluetoothfilesreciever/osa_110306/osa/osa.h"
#line 1 "e:/bluetoothfilesreciever/osa_110306/osa/example/mikroc/osacfg.h"
#line 1068 "e:/bluetoothfilesreciever/osa_110306/osa/osa.h"
typedef  unsigned char  _OST_SMSG;
#line 1 "e:/bluetoothfilesreciever/osa_110306/osa/port/osa_include.h"
#line 1 "e:/bluetoothfilesreciever/osa_110306/osa/port/pic18/osa_pic18_mikroc.h"
#line 41 "e:/bluetoothfilesreciever/osa_110306/osa/port/pic18/osa_pic18_mikroc.h"
typedef unsigned char OST_UINT8;
typedef unsigned int OST_UINT16;
typedef unsigned long OST_UINT32;
typedef unsigned char OST_BOOL;

typedef OST_UINT8 OST_UINT;
#line 93 "e:/bluetoothfilesreciever/osa_110306/osa/port/pic18/osa_pic18_mikroc.h"
extern volatile unsigned int _fsr;
extern volatile char _indf;
extern volatile char _postinc;
extern volatile char _postdec;
extern volatile char _preinc;

extern volatile unsigned char _fsr1l;

extern volatile char _pcl;
extern volatile char _pclath;
extern volatile char _pclatu;
extern volatile char _status;
extern volatile char _tosl;
extern volatile char _tosh;
extern volatile char _tosu;
extern volatile char _bsr;
extern volatile char _wreg;
extern volatile char _intcon;
extern volatile char _rcon;
extern volatile char _stkptr;
#line 251 "e:/bluetoothfilesreciever/osa_110306/osa/port/pic18/osa_pic18_mikroc.h"
void _OS_JumpToTask (void);
#line 288 "e:/bluetoothfilesreciever/osa_110306/osa/port/pic18/osa_pic18_mikroc.h"
extern void _OS_ReturnSave (void);
extern void _OS_ReturnNoSave (void);
extern void _OS_EnterWaitMode (void);
extern void _OS_EnterWaitModeTO (void);

extern void _OS_SET_FSR_CUR_TASK (void);
#line 397 "e:/bluetoothfilesreciever/osa_110306/osa/port/pic18/osa_pic18_mikroc.h"
char OS_DI (void);
void OS_RI (char);
#line 419 "e:/bluetoothfilesreciever/osa_110306/osa/port/pic18/osa_pic18_mikroc.h"
extern void _OS_CheckEvent (OST_UINT);
#line 1092 "e:/bluetoothfilesreciever/osa_110306/osa/osa.h"
typedef  unsigned char  OST_SMSG;
#line 1110 "e:/bluetoothfilesreciever/osa_110306/osa/osa.h"
typedef  void *  OST_MSG;







typedef

 volatile

 struct _OST_MSG_CB
{
 OST_UINT status;
 OST_MSG msg;

} OST_MSG_CB;
#line 1139 "e:/bluetoothfilesreciever/osa_110306/osa/osa.h"
typedef struct
{
 OST_UINT cSize;
 OST_UINT cFilled;
 OST_UINT cBegin;

} OST_QUEUE_CONTROL;




typedef struct
{
 OST_QUEUE_CONTROL Q;
 OST_MSG *pMsg;

} OST_QUEUE;




typedef struct
{
 OST_QUEUE_CONTROL Q;
 OST_SMSG *pSMsg;

} OST_SQUEUE;
#line 1190 "e:/bluetoothfilesreciever/osa_110306/osa/osa.h"
typedef struct
{
 OST_UINT bEventError : 1;
 OST_UINT bError : 1;

 OST_UINT bInCriticalSection : 1;

 OST_UINT bCheckingTasks : 1;


 OST_UINT bBestTaskFound : 1;





  OST_UINT bTimeout : 1; OST_UINT bGIE_CTemp : 1; OST_UINT bGIEL_CTemp : 1; 
#line 1218 "e:/bluetoothfilesreciever/osa_110306/osa/osa.h"
} OST_SYSTEM_FLAGS;
#line 1235 "e:/bluetoothfilesreciever/osa_110306/osa/osa.h"
typedef struct
{
 OST_UINT cPriority : 3;
 OST_UINT bReady : 1;
 OST_UINT bDelay : 1;


 OST_UINT bCanContinue: 1;
 OST_UINT bEnable : 1;
 OST_UINT bPaused : 1;


  


} OST_TASK_STATE;
#line 1270 "e:/bluetoothfilesreciever/osa_110306/osa/osa.h"
typedef struct
{
 OST_TASK_STATE State;
  unsigned long  pTaskPointer;




  



  OST_UINT16  Timer;


} OST_TCB;
#line 1477 "e:/bluetoothfilesreciever/osa_110306/osa/osa.h"
typedef OST_UINT8 OST_CSEM;
#line 1506 "e:/bluetoothfilesreciever/osa_110306/osa/osa.h"
extern volatile   OST_SYSTEM_FLAGS _OS_Flags;
extern   OST_UINT _OS_Temp;


extern volatile   OST_UINT _OS_TempH;




extern volatile   OST_TASK_STATE _OS_State;
#line 1527 "e:/bluetoothfilesreciever/osa_110306/osa/osa.h"
extern   OST_TCB *    volatile _OS_CurTask;
#line 1 "e:/bluetoothfilesreciever/osa_110306/osa/kernel/osa_oldnames.h"
#line 1 "e:/bluetoothfilesreciever/osa_110306/osa/kernel/system/osa_system.h"
#line 48 "e:/bluetoothfilesreciever/osa_110306/osa/kernel/system/osa_system.h"
extern void OS_Init (void);



extern void OS_EnterCriticalSection (void);
extern void OS_LeaveCriticalSection (void);
#line 1 "e:/bluetoothfilesreciever/osa_110306/osa/kernel/system/osa_tasks.h"
#line 37 "e:/bluetoothfilesreciever/osa_110306/osa/kernel/system/osa_tasks.h"
extern   OST_TCB _OS_Tasks[ 3 ];






void _OS_Task_Create(OST_UINT priority,  unsigned long  TaskAddr);
#line 1 "e:/bluetoothfilesreciever/osa_110306/osa/kernel/events/osa_bsem.h"
#line 1 "e:/bluetoothfilesreciever/osa_110306/osa/kernel/events/osa_csem.h"
#line 1 "e:/bluetoothfilesreciever/osa_110306/osa/kernel/events/osa_flag.h"
#line 1 "e:/bluetoothfilesreciever/osa_110306/osa/kernel/events/osa_msg.h"
#line 1 "e:/bluetoothfilesreciever/osa_110306/osa/kernel/events/osa_queue.h"
#line 1 "e:/bluetoothfilesreciever/osa_110306/osa/kernel/events/osa_smsg.h"
#line 1 "e:/bluetoothfilesreciever/osa_110306/osa/kernel/events/osa_squeue.h"
#line 1 "e:/bluetoothfilesreciever/osa_110306/osa/kernel/timers/osa_stimer.h"
#line 1 "e:/bluetoothfilesreciever/osa_110306/osa/kernel/timers/osa_stimer_old.h"
#line 1 "e:/bluetoothfilesreciever/osa_110306/osa/kernel/timers/osa_dtimer.h"
#line 1 "e:/bluetoothfilesreciever/osa_110306/osa/kernel/timers/osa_qtimer.h"
#line 1 "e:/bluetoothfilesreciever/osa_110306/osa/kernel/timers/osa_ttimer.h"
#line 53 "e:/bluetoothfilesreciever/osa_110306/osa/kernel/timers/osa_ttimer.h"
void _OS_InitDelay( OST_UINT16  Delay);
#line 1 "e:/bluetoothfilesreciever/osa_110306/osa/kernel/timers/osa_timer.h"
#line 53 "e:/bluetoothfilesreciever/osa_110306/osa/kernel/timers/osa_timer.h"
 extern void OS_Timer (void);
#line 123 "E:/BluetoothFilesreciever/osa_110306/osa/example/mikroc/lights_mikroc.c"
 const char Brightness[] = {31, 20, 11, 7, 4, 2, 1, 0};
#line 139 "E:/BluetoothFilesreciever/osa_110306/osa/example/mikroc/lights_mikroc.c"
volatile char m_cSpeed;
volatile char m_cPosition;

volatile char m_cDirection;








void Init (void);
void Task_Rolling (void);
void Task_SetSpeed (void);
void Task_Button (void);
#pragma funcall main Task_Rolling
#pragma funcall main Task_SetSpeed
#pragma funcall main Task_Button
#line 175 "E:/BluetoothFilesreciever/osa_110306/osa/example/mikroc/lights_mikroc.c"
void main (void)
{
 Init();

 OS_Init();

  { _OS_Task_Create(0, ( unsigned long )&(Task_Rolling)); } ;
  { _OS_Task_Create(0, ( unsigned long )&(Task_SetSpeed)); } ;
  { _OS_Task_Create(0, ( unsigned long )&(Task_Button)); } ;


 m_cPosition = 0;
 m_cDirection = 1;

  { GIE_bit  = 1; if ( IPEN_bit ) GIEL_bit  = 1;} ;

  for(;;) { _OS_Temp = 0;  { if (_OS_CurTask >= (  OST_TCB * )_OS_Tasks + ( 3 -1)) _OS_CurTask = (  OST_TCB * )_OS_Tasks; else _OS_CurTask++; } _OS_State = _OS_CurTask->State ; if (! _OS_State.bEnable  || _OS_State.bPaused ) goto _OS_SCHED_CONTINUE; if ( _OS_State.bDelay  && ! _OS_State.bCanContinue ) goto _OS_SCHED_CONTINUE; ; _OS_JumpToTask() ; _OS_SET_FSR_CUR_TASK(); _indf &= ~( 0x08  | 0x20 ); _indf |= *((char*)&_OS_State) & ( 0x08  | 0x20 ); ; _OS_SCHED_CONTINUE:; } ;

}
#line 214 "E:/BluetoothFilesreciever/osa_110306/osa/example/mikroc/lights_mikroc.c"
void Init (void)
{





 PORTA =  0x00 ;
 PORTB =  0x00 ;

 TRISA =  0x01 ;
 TRISB =  0x01 ;

 NOT_RBPU_bit = 0;

 PORTC =  0x00 ;
 TRISC =  0x00 ;
#line 248 "E:/BluetoothFilesreciever/osa_110306/osa/example/mikroc/lights_mikroc.c"
 ADCON0 = 0xC1;



 ADCON1 = 0x0E;







 T0CON = 0x80 |  0x41 ;
#line 267 "E:/BluetoothFilesreciever/osa_110306/osa/example/mikroc/lights_mikroc.c"
 T2CON =  0x25 ;
 PR2 = 250-1;





 INTCON = 0;
 T0IE_bit = 1;
 PEIE_bit = 1;
 TMR2IE_bit = 1;
}
#line 286 "E:/BluetoothFilesreciever/osa_110306/osa/example/mikroc/lights_mikroc.c"
void interrupt (void)
{
 static char cCounter;
 char cPosition;
 char cLedsMask;
 char i;





 if (T0IF_bit && T0IE_bit)
 {
 T0IF_bit = 0;
 cCounter++;

 cPosition = m_cPosition;

 i =  8 ;
 cLedsMask = 0x01;

 do
 {




 if (cCounter > Brightness[cPosition &  7 ])  PORTC  &= ~cLedsMask;
 else  PORTC  |= cLedsMask;

 cLedsMask <<= 1;
 cPosition += m_cDirection;


 } while (--i);

 cCounter &= 0x1F;
 }






 if (TMR2IF_bit)
 {
 TMR2IF_bit = 0;
 OS_Timer();
 }

}
#line 351 "E:/BluetoothFilesreciever/osa_110306/osa/example/mikroc/lights_mikroc.c"
void Task_Rolling (void)
{
 static char cDelay;

 for (;;)
 {
 cDelay = 0;
 while (cDelay++ <= m_cSpeed)  { _OS_InitDelay(1); { _OS_ReturnSave(); asm{ nop } ; } ; } ;

 m_cPosition ++;
 }
}
#line 375 "E:/BluetoothFilesreciever/osa_110306/osa/example/mikroc/lights_mikroc.c"
void Task_Button (void)
{
 for (;;)
 {



 do
 {
  { { _OS_EnterWaitMode(); asm{ nop } ; } ; _OS_CheckEvent((!PORTB.B0) != 0) ; } ;
  { _OS_InitDelay(40 / 1 ); { _OS_ReturnSave(); asm{ nop } ; } ; } ;
 } while ( PORTB.B0 );





 m_cDirection = -m_cDirection;




 do
 {
  { { _OS_EnterWaitMode(); asm{ nop } ; } ; _OS_CheckEvent((PORTB.B0) != 0) ; } ;
  { _OS_InitDelay(40 / 1 ); { _OS_ReturnSave(); asm{ nop } ; } ; } ;
 } while (! PORTB.B0 );

 }
}
#line 416 "E:/BluetoothFilesreciever/osa_110306/osa/example/mikroc/lights_mikroc.c"
void Task_SetSpeed (void)
{
 for (;;)
 {
 ADCON0 &= ~0x38;

 GO_bit = 1;
  { { _OS_EnterWaitMode(); asm{ nop } ; } ; _OS_CheckEvent((!NOT_DONE_bit) != 0) ; } ;

 m_cSpeed = ADRESH;

  { _OS_InitDelay(100 / 1 ); { _OS_ReturnSave(); asm{ nop } ; } ; } ;
 }
}
