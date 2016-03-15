#line 1 "D:/PIC/RelayModule/OSAOS/osa.c"
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
#line 55 "D:/PIC/RelayModule/OSAOS/osa.c"
 volatile   OST_SYSTEM_FLAGS _OS_Flags;
    OST_UINT  _OS_Temp;


 volatile    OST_UINT  _OS_Temp_I;



 volatile    OST_UINT  _OS_TempH;
#line 74 "D:/PIC/RelayModule/OSAOS/osa.c"
 OST_TASK_POINTER   volatile _OS_CurTask;
#line 120 "D:/PIC/RelayModule/OSAOS/osa.c"
   OST_UINT _OS_Best_Priority;
   OST_UINT _OS_Worst_Priority;
   OST_UINT _OS_Best_n;
   OST_UINT _OS_Cur_Pos;
   OST_UINT _OS_n;
   OST_UINT8 _OS_TaskQueue[ 5 ];
   OST_UINT8 _OS_TaskLevel[ 5 ];
#line 1 "d:/pic/relaymodule/osaos/port/osa_include.c"
#line 1 "d:/pic/relaymodule/osaos/port/pic16/osa_pic16_mikroc.c"
#line 29 "d:/pic/relaymodule/osaos/port/pic16/osa_pic16_mikroc.c"
volatile unsigned char _fsr absolute 0x04;
volatile unsigned char _status absolute 0x03;
volatile unsigned char _indf absolute 0x00;
volatile unsigned char _pcl absolute 0x02;
volatile unsigned char _pclath absolute 0x0A;
volatile unsigned char _intcon absolute 0x0B;
#line 47 "d:/pic/relaymodule/osaos/port/pic16/osa_pic16_mikroc.c"
void _OS_JumpToTask (void)
{
  {__OS_SET_FSR_CUR_TASK();_fsr+= 1  + 1;} ;
 _pclath = _indf & 0x1F;
 _fsr--;
 asm {
 movf __indf, w
 decf __fsr, f
 movwf __pcl
 }
}
#line 78 "d:/pic/relaymodule/osaos/port/pic16/osa_pic16_mikroc.c"
void _OS_ReturnSave (void)
{
 asm{
 clrf __status
 movwf r0
 bcf __pclath, 1
 btfsc r0, 7
 bsf __pclath, 1
 }
 _OS_Temp = _fsr;
  {__OS_SET_FSR_CUR_TASK();_fsr+= 1  + 1;} ;

 _indf = r0;
 _fsr--;
 _indf = _OS_Temp;
 _fsr--;

  ((  OST_TASK_STATE*)&_indf)->bReady  = 1;

 if (PCLATH & 0x02)
 {
  ((  OST_TASK_STATE*)&_indf)->bReady  = 0;



 if (! ((  OST_TASK_STATE*)&_indf)->bDelay )  ((  OST_TASK_STATE*)&_indf)->bCanContinue  = 0;
 if (PCLATH & 0x01)  ((  OST_TASK_STATE*)&_indf)->bCanContinue  = 1;


 }
}






void __OS_SET_FSR_CUR_TASK (void)
{
 _fsr = (( OST_UINT8 )&_OS_CurTask->State);
  asm{ movlw hi_addr(__OS_Tasks)} ; asm{ iorlw 0x00 } ; asm{ bcf __status, irp } ; asm{ btfss __status, z } ; asm{ bsf __status, irp } ; ;
}
#line 148 "d:/pic/relaymodule/osaos/port/pic16/osa_pic16_mikroc.c"
void _OS_Task_Create(OST_UINT priority,  OST_UINT16  TaskAddr)
{
 OST_TASK_POINTER Task;

 _OS_Flags.bError = 0;
#line 164 "d:/pic/relaymodule/osaos/port/pic16/osa_pic16_mikroc.c"
 Task = (OST_TASK_POINTER)_OS_Tasks;
 _OS_Temp = 0;

 do {
  asm{ movlw hi_addr(__OS_Tasks)} ; asm{ iorlw 0x00 } ; asm{ bcf __status, irp } ; asm{ btfss __status, z } ; asm{ bsf __status, irp } ; ;

 if (!Task->State.bEnable)
 {
 ((OST_TASK_STATE*)&priority)->bEnable = 1;
 ((OST_TASK_STATE*)&priority)->bReady = 1;

 Task->pTaskPointer = TaskAddr;


 Task->Timer = 0;
#line 185 "d:/pic/relaymodule/osaos/port/pic16/osa_pic16_mikroc.c"
 *(  char*)&Task->State = priority;
#line 191 "d:/pic/relaymodule/osaos/port/pic16/osa_pic16_mikroc.c"
 _OS_Flags.bError = 0;
  IRP_bit  = 0;
 return ;
 }

 Task++;

 } while (++_OS_Temp <  5 );


 _OS_Flags.bError = 1;

  IRP_bit  = 0;
 return ;
}
#line 226 "d:/pic/relaymodule/osaos/port/pic16/osa_pic16_mikroc.c"
OST_UINT8 _OS_Task_GetPriority (OST_TASK_POINTER pTask)
{
 OST_UINT8 temp;
  asm{ movlw hi_addr(__OS_Tasks)} ; asm{ iorlw 0x00 } ; asm{ bcf __status, irp } ; asm{ btfss __status, z } ; asm{ bsf __status, irp } ; ;
 temp = pTask->State.cPriority;
  IRP_bit  = 0 ;
 return temp;
}
#line 254 "d:/pic/relaymodule/osaos/port/pic16/osa_pic16_mikroc.c"
OST_UINT8 _OS_Task_IsPaused (OST_TASK_POINTER pTask)
{
 OST_UINT8 temp;
  asm{ movlw hi_addr(__OS_Tasks)} ; asm{ iorlw 0x00 } ; asm{ bcf __status, irp } ; asm{ btfss __status, z } ; asm{ bsf __status, irp } ; ;
 temp = pTask->State.bPaused? 1:0;
  IRP_bit  = 0 ;
 return temp;
}
#line 281 "d:/pic/relaymodule/osaos/port/pic16/osa_pic16_mikroc.c"
OST_UINT8 _OS_Task_IsEnable (OST_TASK_POINTER pTask)
{
 OST_UINT8 temp;

  asm{ movlw hi_addr(__OS_Tasks)} ; asm{ iorlw 0x00 } ; asm{ bcf __status, irp } ; asm{ btfss __status, z } ; asm{ bsf __status, irp } ; ;
 temp = pTask->State.bEnable? 1:0;
  IRP_bit  = 0 ;
 return temp;
}
#line 331 "d:/pic/relaymodule/osaos/port/pic16/osa_pic16_mikroc.c"
char OS_DI (void)
{
 char temp;
 temp = _intcon & 0x80;
  GIE_bit  = 0;
 return temp;
}





 void _OS_DI_INT (void)
 {
 _OS_Temp_I = _intcon & 0x80;
  GIE_bit  = 0;
 }
#line 393 "d:/pic/relaymodule/osaos/port/pic16/osa_pic16_mikroc.c"
void OS_EnterCriticalSection (void)
{
 OST_UINT temp;
 temp = OS_DI();
 _OS_Flags.bInCriticalSection = 1;

 _OS_Flags.bGIE_CTemp = 0;
 if (temp & 0x80) _OS_Flags.bGIE_CTemp = 1;

}
#line 428 "d:/pic/relaymodule/osaos/port/pic16/osa_pic16_mikroc.c"
void OS_LeaveCriticalSection (void)
{
 char temp;
 _OS_Flags.bInCriticalSection = 0;
 temp = 0;
 if (_OS_Flags.bGIE_CTemp) temp |= 0x80;
   { if (temp & 0x80) GIE_bit  = 1;} ;
}
#line 500 "d:/pic/relaymodule/osaos/port/pic16/osa_pic16_mikroc.c"
void _OS_InitDelay ( OST_UINT16  Delay)
 {

  __OS_SET_FSR_CUR_TASK() ;
  ((  OST_TASK_STATE*)&_indf)->bCanContinue  = 0;
  ((  OST_TASK_STATE*)&_indf)->bDelay  = 0;

 if (Delay)
 {

 Delay ^= -1;
 Delay ++;

  asm{ movlw hi_addr(__OS_Tasks)} ; asm{ iorlw 0x00 } ; asm{ bcf __status, irp } ; asm{ btfss __status, z } ; asm{ bsf __status, irp } ; ;
 _OS_CurTask->Timer = Delay;
  __OS_SET_FSR_CUR_TASK() ;
  ((  OST_TASK_STATE*)&_indf)->bDelay  = 1;
  ((  OST_TASK_STATE*)&_indf)->bReady  = 1;

 }
 }
#line 569 "d:/pic/relaymodule/osaos/port/pic16/osa_pic16_mikroc.c"
OST_UINT _OS_CheckEvent (OST_UINT bEvent)
{
#line 604 "d:/pic/relaymodule/osaos/port/pic16/osa_pic16_mikroc.c"
 _OS_Flags.bTimeout = 0;
  __OS_SET_FSR_CUR_TASK() ;

 if (bEvent)
 {
 if ( ((  OST_TASK_STATE*)&_indf)->bReady )
 {
 EXIT_GOOD:


  ((  OST_TASK_STATE*)&_indf)->bDelay  = 0;




 _OS_Flags.bEventOK = 1;


 return 1;
 }

  ((  OST_TASK_STATE*)&_indf)->bReady  = 1;

 } else {
  ((  OST_TASK_STATE*)&_indf)->bReady  = 0;
 }



 if ( (!((  OST_TASK_STATE*)&_indf)->bDelay)  &&  ((  OST_TASK_STATE*)&_indf)->bCanContinue )
 {
 _OS_Flags.bTimeout = 1;
  ((  OST_TASK_STATE*)&_indf)->bReady  = 1;
 goto EXIT_GOOD;
 }



 return 0;




}
#line 1 "d:/pic/relaymodule/osaos/kernel/timers/osa_dtimer.c"
#line 1 "d:/pic/relaymodule/osaos/kernel/timers/osa_qtimer.c"
#line 1 "d:/pic/relaymodule/osaos/kernel/timers/osa_stimer.c"
#line 1 "d:/pic/relaymodule/osaos/kernel/timers/osa_ttimer.c"
#line 1 "d:/pic/relaymodule/osaos/kernel/events/osa_squeue.c"
#line 1 "d:/pic/relaymodule/osaos/kernel/events/osa_queue.c"
#line 64 "d:/pic/relaymodule/osaos/kernel/events/osa_queue.c"
 void _OS_Queue_Send (OST_QUEUE *pQueue, OST_MSG Msg)
 {

 OST_QUEUE_CONTROL q;
 OST_UINT16 temp;

 q = pQueue->Q;
 _OS_Flags.bEventError = 0;





 if (q.cSize == q.cFilled)
 {
 pQueue->pMsg[q.cBegin] = Msg;
 q.cBegin++;
 if (q.cBegin == q.cSize) q.cBegin = 0;

 _OS_Flags.bEventError = 1;
 goto EXIT;
 }






 temp = (OST_UINT16)q.cBegin + q.cFilled;
 if (temp >= q.cSize) temp -= q.cSize;
 pQueue->pMsg[temp] = Msg;
 q.cFilled++;

 EXIT:

 pQueue->Q = q;
 }
#line 213 "d:/pic/relaymodule/osaos/kernel/events/osa_queue.c"
 OST_MSG _OS_Queue_Get (OST_QUEUE *pQueue)
 {
 OST_QUEUE_CONTROL q;
 OST_UINT temp;
 OST_MSG msg_temp;


 q = pQueue->Q;
 temp = q.cBegin;
 q.cBegin++;

 if (q.cBegin >= q.cSize) q.cBegin = 0;

 q.cFilled--;
 pQueue->Q = q;

 msg_temp = pQueue->pMsg[temp];

 return msg_temp;
 }
#line 1 "d:/pic/relaymodule/osaos/kernel/events/osa_csem.c"
#line 64 "d:/pic/relaymodule/osaos/kernel/events/osa_csem.c"
 void _OS_Csem_Signal (OST_CSEM *pCSem)
 {
 _OS_Flags.bEventError = 0;

 (*pCSem)++;
 if (!*pCSem)
 {
 (*pCSem) = (OST_CSEM) -1;
 _OS_Flags.bEventError = 1;
 }
 }
#line 87 "d:/pic/relaymodule/osaos/kernel/events/osa_csem.c"
 void _OS_Csem_Signal_I (OST_CSEM *pCSem)
 {
 _OS_Flags.bEventError = 0;

 (*pCSem)++;
 if (!*pCSem)
 {
 (*pCSem) = (OST_CSEM) -1;
 _OS_Flags.bEventError = 1;
 }
 }
#line 1 "d:/pic/relaymodule/osaos/kernel/events/osa_bsem.c"
#line 1 "d:/pic/relaymodule/osaos/kernel/system/osa_system.c"
#line 67 "d:/pic/relaymodule/osaos/kernel/system/osa_system.c"
void OS_Init (void)
{



 *(   OST_UINT *)&_OS_Flags = 0;


  if (_pclath & 0x80) _OS_ReturnSave() ;
#line 326 "d:/pic/relaymodule/osaos/kernel/system/osa_system.c"
 _OS_Tasks[0].State.bEnable = 0;


 _OS_Tasks[1].State.bEnable = 0;



 _OS_Tasks[2].State.bEnable = 0;



 _OS_Tasks[3].State.bEnable = 0;



 _OS_Tasks[4].State.bEnable = 0;
#line 379 "d:/pic/relaymodule/osaos/kernel/system/osa_system.c"
  asm{ movlw hi_addr(__OS_Tasks)} ; asm{ iorlw 0x00 } ; asm{ bcf __status, irp } ; asm{ btfss __status, z } ; asm{ bsf __status, irp } ; ;
 _OS_CurTask = (OST_TASK_POINTER) _OS_Tasks;
 _OS_Temp =  5 ;
 do
 {
 _OS_TaskQueue[_OS_Temp-1] = _OS_Temp-1;
 _OS_TaskLevel[_OS_Temp-1] = 0;
 } while (--_OS_Temp);
  IRP_bit  = 0 ;






}
#line 1 "d:/pic/relaymodule/osaos/kernel/system/osa_tasks.c"
#line 36 "d:/pic/relaymodule/osaos/kernel/system/osa_tasks.c"
  OST_TCB _OS_Tasks[ 5 ]  ;
