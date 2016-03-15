#line 1 "D:/PIC/RelayModule/main.c"
#line 1 "d:/pic/relaymodule/osaos/osa.h"
#line 1 "d:/pic/relaymodule/osacfg.h"
#line 1068 "d:/pic/relaymodule/osaos/osa.h"
typedef  unsigned char  _OST_SMSG;
#line 1 "d:/pic/relaymodule/osaos/port/osa_include.h"
#line 1 "d:/pic/relaymodule/osaos/port/pic16/osa_pic16_mikroc.h"
#line 39 "d:/pic/relaymodule/osaos/port/pic16/osa_pic16_mikroc.h"
typedef unsigned char OST_UINT8;
typedef unsigned int OST_UINT16;
typedef unsigned long OST_UINT32;
typedef unsigned char OST_BOOL;

typedef OST_UINT8 OST_UINT;
#line 91 "d:/pic/relaymodule/osaos/port/pic16/osa_pic16_mikroc.h"
extern volatile char _fsr;
extern volatile char _status;
extern volatile char _indf;
extern volatile char _pcl;
extern volatile char _pclath;
extern volatile char _intcon;
#line 163 "d:/pic/relaymodule/osaos/port/pic16/osa_pic16_mikroc.h"
OST_UINT8 _OS_Task_GetPriority (OST_TASK_POINTER);
OST_UINT8 _OS_Task_IsPaused (OST_TASK_POINTER);
OST_UINT8 _OS_Task_IsEnable (OST_TASK_POINTER);

void _OS_JumpToTask (void);
void _OS_ReturnSave (void);
void __OS_SET_FSR_CUR_TASK (void);
#line 212 "d:/pic/relaymodule/osaos/port/pic16/osa_pic16_mikroc.h"
OST_UINT _OS_CheckEvent (OST_UINT bEvent);
#line 368 "d:/pic/relaymodule/osaos/port/pic16/osa_pic16_mikroc.h"
char OS_DI (void);






 void _OS_DI_INT (void);
#line 1092 "d:/pic/relaymodule/osaos/osa.h"
typedef  unsigned char  OST_SMSG;
#line 1110 "d:/pic/relaymodule/osaos/osa.h"
typedef  unsigned char  OST_MSG;







typedef

 volatile

 struct _OST_MSG_CB
{
 OST_UINT status;
 OST_MSG msg;

} OST_MSG_CB;
#line 1139 "d:/pic/relaymodule/osaos/osa.h"
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
#line 1190 "d:/pic/relaymodule/osaos/osa.h"
typedef struct
{
 OST_UINT bEventError : 1;
 OST_UINT bError : 1;

 OST_UINT bInCriticalSection : 1;

 OST_UINT bCheckingTasks : 1;


 OST_UINT bBestTaskFound : 1;





  OST_UINT bTimeout : 1; OST_UINT bGIE_CTemp : 1; 



 OST_UINT bEventOK : 1;







} OST_SYSTEM_FLAGS;
#line 1235 "d:/pic/relaymodule/osaos/osa.h"
typedef struct
{
 OST_UINT cPriority : 3;
 OST_UINT bReady : 1;
 OST_UINT bDelay : 1;


 OST_UINT bCanContinue: 1;
 OST_UINT bEnable : 1;
 OST_UINT bPaused : 1;


  


} OST_TASK_STATE;
#line 1270 "d:/pic/relaymodule/osaos/osa.h"
typedef struct
{
 OST_TASK_STATE State;
  OST_UINT16  pTaskPointer;




  



  OST_UINT16  Timer;


} OST_TCB;



typedef   OST_TCB * OST_TASK_POINTER;
#line 1479 "d:/pic/relaymodule/osaos/osa.h"
typedef OST_UINT16 OST_CSEM;
#line 1506 "d:/pic/relaymodule/osaos/osa.h"
extern volatile   OST_SYSTEM_FLAGS _OS_Flags;
extern   OST_UINT _OS_Temp;


extern volatile   OST_UINT _OS_TempH;
#line 1527 "d:/pic/relaymodule/osaos/osa.h"
extern OST_TASK_POINTER   volatile _OS_CurTask;
#line 1563 "d:/pic/relaymodule/osaos/osa.h"
 extern   OST_UINT _OS_Best_Priority;
 extern   OST_UINT _OS_Worst_Priority;
 extern   OST_UINT _OS_Best_n;
 extern   OST_UINT _OS_Cur_Pos;
 extern   OST_UINT _OS_n;
 extern   OST_UINT8 _OS_TaskQueue[ 5 ];
 extern   OST_UINT8 _OS_TaskLevel[ 5 ];
#line 1 "d:/pic/relaymodule/osaos/kernel/osa_oldnames.h"
#line 1 "d:/pic/relaymodule/osaos/kernel/system/osa_system.h"
#line 48 "d:/pic/relaymodule/osaos/kernel/system/osa_system.h"
extern void OS_Init (void);



extern void OS_EnterCriticalSection (void);
extern void OS_LeaveCriticalSection (void);
#line 1 "d:/pic/relaymodule/osaos/kernel/system/osa_tasks.h"
#line 37 "d:/pic/relaymodule/osaos/kernel/system/osa_tasks.h"
extern   OST_TCB _OS_Tasks[ 5 ];






void _OS_Task_Create(OST_UINT priority,  OST_UINT16  TaskAddr);
#line 1 "d:/pic/relaymodule/osaos/kernel/events/osa_bsem.h"
#line 1 "d:/pic/relaymodule/osaos/kernel/events/osa_csem.h"
#line 54 "d:/pic/relaymodule/osaos/kernel/events/osa_csem.h"
extern void _OS_Csem_Signal(OST_CSEM *pCSem);


extern void _OS_Csem_Signal_I(OST_CSEM *pCSem);
#line 1 "d:/pic/relaymodule/osaos/kernel/events/osa_flag.h"
#line 1 "d:/pic/relaymodule/osaos/kernel/events/osa_msg.h"
#line 1 "d:/pic/relaymodule/osaos/kernel/events/osa_queue.h"
#line 91 "d:/pic/relaymodule/osaos/kernel/events/osa_queue.h"
extern void _OS_Queue_Send (OST_QUEUE *pQueue, OST_MSG Msg);
extern OST_MSG _OS_Queue_Get (OST_QUEUE *pQueue);
#line 1 "d:/pic/relaymodule/osaos/kernel/events/osa_smsg.h"
#line 1 "d:/pic/relaymodule/osaos/kernel/events/osa_squeue.h"
#line 1 "d:/pic/relaymodule/osaos/kernel/timers/osa_stimer.h"
#line 1 "d:/pic/relaymodule/osaos/kernel/timers/osa_stimer_old.h"
#line 1 "d:/pic/relaymodule/osaos/kernel/timers/osa_dtimer.h"
#line 1 "d:/pic/relaymodule/osaos/kernel/timers/osa_qtimer.h"
#line 1 "d:/pic/relaymodule/osaos/kernel/timers/osa_ttimer.h"
#line 53 "d:/pic/relaymodule/osaos/kernel/timers/osa_ttimer.h"
void _OS_InitDelay( OST_UINT16  Delay);
#line 1 "d:/pic/relaymodule/osaos/kernel/timers/osa_timer.h"
#line 1660 "d:/pic/relaymodule/osaos/osa.h"
 extern volatile   OST_UINT _OS_Temp_I;
#line 1 "d:/pic/relaymodule/module/serial.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic/include/stdbool.h"



 typedef char _Bool;
#line 3 "d:/pic/relaymodule/module/serial.h"
void serial_init();
 _Bool  serial_dataready();
unsigned char serial_read();
void serial_write_text(char *text);
#line 1 "d:/pic/relaymodule/module/rtc.h"
void RTC_init();
void Read_Time(char *sec, char *min, char *hr, char *week_day, char *day, char *mn, char *year);
void Transform_Time(char *sec, char *min, char *hr, char *week_day, char *day, char *mn, char *year);
void Write_Time(char *sec, char *min, char *hr, char *week_day, char *day, char *mn, char *year);
#line 8 "D:/PIC/RelayModule/main.c"
void systick_init();

int main(void)
{
 serial_init();
 RTC_init();
 OS_Init();

 Systick_Init();
  for(;;) { _OS_Flags.bBestTaskFound = 0; _OS_Flags.bCheckingTasks = 1; _OS_Best_Priority = 0; _OS_Worst_Priority = 0; if ( _OS_Flags.bInCriticalSection ) goto _OS_SCHED_CHECK_READY; ; _OS_n = 5 ; do { _OS_Cur_Pos = _OS_TaskQueue[_OS_n-1]; _OS_SCHED_CHECK_READY:  _OS_CurTask = &_OS_Tasks[_OS_Cur_Pos]; __OS_SET_FSR_CUR_TASK() ; if (! ((  OST_TASK_STATE*)&_indf)->bEnable  || ((  OST_TASK_STATE*)&_indf)->bPaused ) goto _OS_SCHED_CONTINUE; ; if (! ((  OST_TASK_STATE*)&_indf)->bReady )  { _OS_SCHED_RUN:; _OS_JumpToTask() ; asm { clrf __status }; asm { movlw hi_addr($) }; asm { movwf __pclath }; ; __OS_SET_FSR_CUR_TASK() ; if (!_OS_Flags.bCheckingTasks) { if ( ((  OST_TASK_STATE*)&_indf)->bReady  || _OS_Flags.bEventOK) { _OS_TaskLevel[_OS_Cur_Pos] -= _OS_Worst_Priority; _OS_n = _OS_Best_n; while (_OS_n) { _OS_TaskQueue[_OS_n] = _OS_TaskQueue[_OS_n-1]; _OS_n--; } _OS_TaskQueue[0] = _OS_Cur_Pos; ; } goto SCHED_END; } } if ( ((  OST_TASK_STATE*)&_indf)->bDelay  && ! ((  OST_TASK_STATE*)&_indf)->bCanContinue ) goto _OS_SCHED_CONTINUE; ; if ( ((  OST_TASK_STATE*)&_indf)->bReady )  { _OS_Temp = _OS_TaskLevel[_OS_Cur_Pos]; if (!(_OS_Temp & 0x80)) { _OS_Temp += 8; _OS_Temp -= _OS_CurTask->State.cPriority; _OS_TaskLevel[_OS_Cur_Pos] = _OS_Temp; } ; if (_OS_Temp > _OS_Best_Priority) { _OS_Worst_Priority = _OS_Best_Priority; _OS_Best_Priority = _OS_Temp; _OS_Best_n = _OS_n-1; _OS_Flags.bBestTaskFound = 1; } else if (_OS_Temp > _OS_Worst_Priority) { _OS_Worst_Priority = _OS_Temp; } } _OS_SCHED_CONTINUE:;  } while ( ! _OS_Flags.bInCriticalSection  && --_OS_n); if (_OS_Flags.bBestTaskFound) { _OS_Flags.bCheckingTasks = 0; _OS_Flags.bEventOK = 0; _OS_Cur_Pos = _OS_TaskQueue[_OS_Best_n]; _OS_CurTask = &_OS_Tasks[_OS_Cur_Pos]; __OS_SET_FSR_CUR_TASK() ; if ( ((  OST_TASK_STATE*)&_indf)->bEnable  && ! ((  OST_TASK_STATE*)&_indf)->bPaused ) goto _OS_SCHED_RUN; } SCHED_END:; } ;
 while(1);
 return 0;
}
void systick_init()
{
 T2CON = 0x36;
 PR2 = 223;
 TMR2IE_bit = 1;
 INTCON = 0xC0;
}
void systick_INT() iv 0x0004 ics ICS_AUTO
{
 if (TMR2IF_bit)
 {
 TMR2IF_bit = 0;
  { { ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ;  { ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; } } ; { OST_UINT _os_i; ; ; for (_os_i = 0; _os_i < 5 ; _os_i++) { if (_OS_Tasks[_os_i].State.bDelay){ if (!++_OS_Tasks[_os_i].Timer) _OS_Tasks[_os_i].State.bDelay = 0; } } } ; ; ; ; } ;
 }
}
