#line 1 "D:/PIC/SmartModule/SmartModule.c"
#line 1 "d:/pic/smartmodule/hardware.h"

sbit LCD_RS at PORTD.B2;
sbit LCD_RW at PORTD.B3;
sbit LCD_EN at PORTC.B4;
sbit LCD_D7 at PORTD.B7;
sbit LCD_D6 at PORTD.B6;
sbit LCD_D5 at PORTD.B5;
sbit LCD_D4 at PORTD.B4;

sbit LCD_RS_Direction at TRISD.B2;
sbit LCD_RW_Direction at TRISD.B3;
sbit LCD_EN_Direction at TRISC.B4;
sbit LCD_D7_Direction at TRISD.B7;
sbit LCD_D6_Direction at TRISD.B6;
sbit LCD_D5_Direction at TRISD.B5;
sbit LCD_D4_Direction at TRISD.B4;

sbit LM35_PIN at PORTE.B0;
sbit LM35_Direction at TRISE.B0;
sbit LM35_Channel at ANSEL.B5;

sbit LED1_PIN at PORTB.B5;
sbit LED2_PIN at PORTB.B4;
sbit LED1_Direction at TRISB.B5;
sbit LED2_Direction at TRISB.B4;

extern void HWStartUp();
#line 1 "d:/pic/pic_project/code lm35/osaos/osa.h"
#line 1 "d:/pic/pic_project/code lm35/osacfg.h"
#line 1068 "d:/pic/pic_project/code lm35/osaos/osa.h"
typedef  int  _OST_SMSG;
#line 1 "d:/pic/pic_project/code lm35/osaos/port/osa_include.h"
#line 1 "d:/pic/pic_project/code lm35/osaos/port/pic16/osa_pic16_mikroc.h"
#line 39 "d:/pic/pic_project/code lm35/osaos/port/pic16/osa_pic16_mikroc.h"
typedef unsigned char OST_UINT8;
typedef unsigned int OST_UINT16;
typedef unsigned long OST_UINT32;
typedef unsigned char OST_BOOL;

typedef OST_UINT8 OST_UINT;
#line 91 "d:/pic/pic_project/code lm35/osaos/port/pic16/osa_pic16_mikroc.h"
extern volatile char _fsr;
extern volatile char _status;
extern volatile char _indf;
extern volatile char _pcl;
extern volatile char _pclath;
extern volatile char _intcon;
#line 163 "d:/pic/pic_project/code lm35/osaos/port/pic16/osa_pic16_mikroc.h"
OST_UINT8 _OS_Task_GetPriority (OST_TASK_POINTER);
OST_UINT8 _OS_Task_IsPaused (OST_TASK_POINTER);
OST_UINT8 _OS_Task_IsEnable (OST_TASK_POINTER);

void _OS_JumpToTask (void);
void _OS_ReturnSave (void);
void __OS_SET_FSR_CUR_TASK (void);
#line 212 "d:/pic/pic_project/code lm35/osaos/port/pic16/osa_pic16_mikroc.h"
OST_UINT _OS_CheckEvent (OST_UINT bEvent);
#line 368 "d:/pic/pic_project/code lm35/osaos/port/pic16/osa_pic16_mikroc.h"
char OS_DI (void);






 void _OS_DI_INT (void);
#line 1092 "d:/pic/pic_project/code lm35/osaos/osa.h"
typedef  int  OST_SMSG;
#line 1110 "d:/pic/pic_project/code lm35/osaos/osa.h"
typedef  int  OST_MSG;







typedef

 volatile

 struct _OST_MSG_CB
{
 OST_UINT status;
 OST_MSG msg;

} OST_MSG_CB;
#line 1139 "d:/pic/pic_project/code lm35/osaos/osa.h"
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
#line 1190 "d:/pic/pic_project/code lm35/osaos/osa.h"
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
#line 1235 "d:/pic/pic_project/code lm35/osaos/osa.h"
typedef struct
{
 OST_UINT cPriority : 3;
 OST_UINT bReady : 1;
 OST_UINT bDelay : 1;


 OST_UINT bCanContinue: 1;
 OST_UINT bEnable : 1;
 OST_UINT bPaused : 1;


  


} OST_TASK_STATE;
#line 1270 "d:/pic/pic_project/code lm35/osaos/osa.h"
typedef struct
{
 OST_TASK_STATE State;
  OST_UINT16  pTaskPointer;




  



  OST_UINT16  Timer;


} OST_TCB;



typedef   OST_TCB * OST_TASK_POINTER;
#line 1479 "d:/pic/pic_project/code lm35/osaos/osa.h"
typedef OST_UINT16 OST_CSEM;
#line 1506 "d:/pic/pic_project/code lm35/osaos/osa.h"
extern volatile   OST_SYSTEM_FLAGS _OS_Flags;
extern   OST_UINT _OS_Temp;


extern volatile   OST_UINT _OS_TempH;
#line 1527 "d:/pic/pic_project/code lm35/osaos/osa.h"
extern OST_TASK_POINTER   volatile _OS_CurTask;
#line 1563 "d:/pic/pic_project/code lm35/osaos/osa.h"
 extern   OST_UINT _OS_Best_Priority;
 extern   OST_UINT _OS_Worst_Priority;
 extern   OST_UINT _OS_Best_n;
 extern   OST_UINT _OS_Cur_Pos;
 extern   OST_UINT _OS_n;
 extern   OST_UINT8 _OS_TaskQueue[ 5 ];
 extern   OST_UINT8 _OS_TaskLevel[ 5 ];
#line 1 "d:/pic/pic_project/code lm35/osaos/kernel/osa_oldnames.h"
#line 1 "d:/pic/pic_project/code lm35/osaos/kernel/system/osa_system.h"
#line 48 "d:/pic/pic_project/code lm35/osaos/kernel/system/osa_system.h"
extern void OS_Init (void);



extern void OS_EnterCriticalSection (void);
extern void OS_LeaveCriticalSection (void);
#line 1 "d:/pic/pic_project/code lm35/osaos/kernel/system/osa_tasks.h"
#line 37 "d:/pic/pic_project/code lm35/osaos/kernel/system/osa_tasks.h"
extern   OST_TCB _OS_Tasks[ 5 ];






void _OS_Task_Create(OST_UINT priority,  OST_UINT16  TaskAddr);
#line 1 "d:/pic/pic_project/code lm35/osaos/kernel/events/osa_bsem.h"
#line 1 "d:/pic/pic_project/code lm35/osaos/kernel/events/osa_csem.h"
#line 54 "d:/pic/pic_project/code lm35/osaos/kernel/events/osa_csem.h"
extern void _OS_Csem_Signal(OST_CSEM *pCSem);


extern void _OS_Csem_Signal_I(OST_CSEM *pCSem);
#line 1 "d:/pic/pic_project/code lm35/osaos/kernel/events/osa_flag.h"
#line 1 "d:/pic/pic_project/code lm35/osaos/kernel/events/osa_msg.h"
#line 1 "d:/pic/pic_project/code lm35/osaos/kernel/events/osa_queue.h"
#line 91 "d:/pic/pic_project/code lm35/osaos/kernel/events/osa_queue.h"
extern void _OS_Queue_Send (OST_QUEUE *pQueue, OST_MSG Msg);
extern OST_MSG _OS_Queue_Get (OST_QUEUE *pQueue);
#line 1 "d:/pic/pic_project/code lm35/osaos/kernel/events/osa_smsg.h"
#line 1 "d:/pic/pic_project/code lm35/osaos/kernel/events/osa_squeue.h"
#line 1 "d:/pic/pic_project/code lm35/osaos/kernel/timers/osa_stimer.h"
#line 1 "d:/pic/pic_project/code lm35/osaos/kernel/timers/osa_stimer_old.h"
#line 1 "d:/pic/pic_project/code lm35/osaos/kernel/timers/osa_dtimer.h"
#line 1 "d:/pic/pic_project/code lm35/osaos/kernel/timers/osa_qtimer.h"
#line 1 "d:/pic/pic_project/code lm35/osaos/kernel/timers/osa_ttimer.h"
#line 53 "d:/pic/pic_project/code lm35/osaos/kernel/timers/osa_ttimer.h"
void _OS_InitDelay( OST_UINT16  Delay);
#line 1 "d:/pic/pic_project/code lm35/osaos/kernel/timers/osa_timer.h"
#line 1660 "d:/pic/pic_project/code lm35/osaos/osa.h"
 extern volatile   OST_UINT _OS_Temp_I;
#pragma funcall main LED1_TASK
#pragma funcall main LED2_TASK
#pragma funcall main DISPLAY_TASK
#pragma funcall main SENSOR_TASK
#pragma funcall main SERIAL_TASK
#line 26 "D:/PIC/SmartModule/SmartModule.c"
OST_QUEUE SENSOR_QUEUE;
OST_QUEUE RECIEVE_QUEUE;
OST_QUEUE DISPLAY_QUEUE;

OST_MSG SENSOR_MSG_QUEUE[ 3 ];
OST_MSG RECIEVE_MSG_QUEUE[ 1 ];
OST_MSG DISPLAY_MSG_QUEUE[ 1 ];



void LED1_TASK(void);
void LED2_TASK(void);
void DISPLAY_TASK(void);
void SENSOR_TASK(void);
void SERIAL_TASK(void);

void Systick_Init();

void main()
{
 HWStartUp();
 OS_Init();

   { ; (SENSOR_QUEUE).Q.cSize = 3 ; (SENSOR_QUEUE).Q.cBegin = 0; (SENSOR_QUEUE).Q.cFilled = 0; (SENSOR_QUEUE).pMsg = (OST_MSG*)(SENSOR_MSG_QUEUE); ; } ;
   { ; (RECIEVE_QUEUE).Q.cSize = 1 ; (RECIEVE_QUEUE).Q.cBegin = 0; (RECIEVE_QUEUE).Q.cFilled = 0; (RECIEVE_QUEUE).pMsg = (OST_MSG*)(RECIEVE_MSG_QUEUE); ; } ;
   { ; (DISPLAY_QUEUE).Q.cSize = 1 ; (DISPLAY_QUEUE).Q.cBegin = 0; (DISPLAY_QUEUE).Q.cFilled = 0; (DISPLAY_QUEUE).pMsg = (OST_MSG*)(DISPLAY_MSG_QUEUE); ; } ;

  { _OS_Task_Create( 1 , ( OST_UINT16 )&(LED1_TASK)); } ;
  { _OS_Task_Create( 1 , ( OST_UINT16 )&(LED2_TASK)); } ;
  { _OS_Task_Create( 3 , ( OST_UINT16 )&(DISPLAY_TASK)); } ;
  { _OS_Task_Create( 0 , ( OST_UINT16 )&(SENSOR_TASK)); } ;
  { _OS_Task_Create( 0 , ( OST_UINT16 )&(SERIAL_TASK)); } ;
 Systick_Init();
  for(;;) { _OS_Flags.bBestTaskFound = 0; _OS_Flags.bCheckingTasks = 1; _OS_Best_Priority = 0; _OS_Worst_Priority = 0; if ( _OS_Flags.bInCriticalSection ) goto _OS_SCHED_CHECK_READY; ; _OS_n = 5 ; do { _OS_Cur_Pos = _OS_TaskQueue[_OS_n-1]; _OS_SCHED_CHECK_READY:  _OS_CurTask = &_OS_Tasks[_OS_Cur_Pos]; __OS_SET_FSR_CUR_TASK() ; if (! ((  OST_TASK_STATE*)&_indf)->bEnable  || ((  OST_TASK_STATE*)&_indf)->bPaused ) goto _OS_SCHED_CONTINUE; ; if (! ((  OST_TASK_STATE*)&_indf)->bReady )  { _OS_SCHED_RUN:; _OS_JumpToTask() ; asm { clrf __status }; asm { movlw hi_addr($) }; asm { movwf __pclath }; ; __OS_SET_FSR_CUR_TASK() ; if (!_OS_Flags.bCheckingTasks) { if ( ((  OST_TASK_STATE*)&_indf)->bReady  || _OS_Flags.bEventOK) { _OS_TaskLevel[_OS_Cur_Pos] -= _OS_Worst_Priority; _OS_n = _OS_Best_n; while (_OS_n) { _OS_TaskQueue[_OS_n] = _OS_TaskQueue[_OS_n-1]; _OS_n--; } _OS_TaskQueue[0] = _OS_Cur_Pos; ; } goto SCHED_END; } } if ( ((  OST_TASK_STATE*)&_indf)->bDelay  && ! ((  OST_TASK_STATE*)&_indf)->bCanContinue ) goto _OS_SCHED_CONTINUE; ; if ( ((  OST_TASK_STATE*)&_indf)->bReady )  { _OS_Temp = _OS_TaskLevel[_OS_Cur_Pos]; if (!(_OS_Temp & 0x80)) { _OS_Temp += 8; _OS_Temp -= _OS_CurTask->State.cPriority; _OS_TaskLevel[_OS_Cur_Pos] = _OS_Temp; } ; if (_OS_Temp > _OS_Best_Priority) { _OS_Worst_Priority = _OS_Best_Priority; _OS_Best_Priority = _OS_Temp; _OS_Best_n = _OS_n-1; _OS_Flags.bBestTaskFound = 1; } else if (_OS_Temp > _OS_Worst_Priority) { _OS_Worst_Priority = _OS_Temp; } } _OS_SCHED_CONTINUE:;  } while ( ! _OS_Flags.bInCriticalSection  && --_OS_n); if (_OS_Flags.bBestTaskFound) { _OS_Flags.bCheckingTasks = 0; _OS_Flags.bEventOK = 0; _OS_Cur_Pos = _OS_TaskQueue[_OS_Best_n]; _OS_CurTask = &_OS_Tasks[_OS_Cur_Pos]; __OS_SET_FSR_CUR_TASK() ; if ( ((  OST_TASK_STATE*)&_indf)->bEnable  && ! ((  OST_TASK_STATE*)&_indf)->bPaused ) goto _OS_SCHED_RUN; } SCHED_END:; } ;
 while(1);
}
void LED1_TASK(void)
{
 unsigned char CV;
 while(1)
 {
 if ( ((RECIEVE_QUEUE).Q.cFilled) )
 {
   { { { asm{ movlw hi_addr(__OS_ReturnSave) }; asm{ movwf __pclath }; asm{ bcf __pclath, 0 }; asm{ movlw $+4 }; asm{ movwf __fsr }; asm{ movlw hi_addr($+0x8002) }; asm{ goto __OS_ReturnSave }; } ; if (!_OS_CheckEvent((((RECIEVE_QUEUE).Q.cFilled)) != 0)) asm{ return} ; } ;  { CV = _OS_Queue_Get(&(RECIEVE_QUEUE)); } ; } ;
 if (CV ==  65 )
 LED1_PIN =  0 ;
 else if (CV ==  66 )
 LED1_PIN =  1 ;
 }
  { _OS_InitDelay(100); { asm{ movlw hi_addr(__OS_ReturnSave) }; asm{ movwf __pclath }; asm{ movlw $+4 }; asm{ movwf __fsr }; asm{ movlw hi_addr($+0x2)}; asm{ goto __OS_ReturnSave }; } ; } ;
 }
}
void LED2_TASK(void)
{
 unsigned char CV;
 unsigned char Blink;
 while(1)
 {
 if ( ((RECIEVE_QUEUE).Q.cFilled) )
 {
   { { { asm{ movlw hi_addr(__OS_ReturnSave) }; asm{ movwf __pclath }; asm{ bcf __pclath, 0 }; asm{ movlw $+4 }; asm{ movwf __fsr }; asm{ movlw hi_addr($+0x8002) }; asm{ goto __OS_ReturnSave }; } ; if (!_OS_CheckEvent((((RECIEVE_QUEUE).Q.cFilled)) != 0)) asm{ return} ; } ;  { CV = _OS_Queue_Get(&(RECIEVE_QUEUE)); } ; } ;
 if (CV ==  67 )
 Blink = 1;
 else if (CV ==  68 )
 Blink = 0;
 }
 if (Blink)
 LED2_PIN ^= 1;
  { _OS_InitDelay(60); { asm{ movlw hi_addr(__OS_ReturnSave) }; asm{ movwf __pclath }; asm{ movlw $+4 }; asm{ movwf __fsr }; asm{ movlw hi_addr($+0x2)}; asm{ goto __OS_ReturnSave }; } ; } ;
 }
}
void DISPLAY_TASK()
{
 static char* Temp[8];
 static unsigned int ADC_Value = 0;
 while(1)
 {
 if ( ((DISPLAY_QUEUE).Q.cFilled) )
 {
   { { { asm{ movlw hi_addr(__OS_ReturnSave) }; asm{ movwf __pclath }; asm{ bcf __pclath, 0 }; asm{ movlw $+4 }; asm{ movwf __fsr }; asm{ movlw hi_addr($+0x8002) }; asm{ goto __OS_ReturnSave }; } ; if (!_OS_CheckEvent((((DISPLAY_QUEUE).Q.cFilled)) != 0)) asm{ return} ; } ;  { ADC_Value = _OS_Queue_Get(&(DISPLAY_QUEUE)); } ; } ;
 ADC_Value = (float) ADC_Value * 0.122;
 IntToStr(ADC_Value, Temp);
 Lcd_Out(2, 1, Temp);
 Lcd_Out_CP("*C");
 }
  { _OS_InitDelay(500); { asm{ movlw hi_addr(__OS_ReturnSave) }; asm{ movwf __pclath }; asm{ movlw $+4 }; asm{ movwf __fsr }; asm{ movlw hi_addr($+0x2)}; asm{ goto __OS_ReturnSave }; } ; } ;
 }
}
void SENSOR_TASK(void)
{
 static unsigned int ADC_Value = 0;
 while(1)
 {
 ADC_Value = ADC_Read( 5 );
   { if ( ((SENSOR_QUEUE).Q.cFilled == (SENSOR_QUEUE).Q.cSize) ) { { { asm{ movlw hi_addr(__OS_ReturnSave) }; asm{ movwf __pclath }; asm{ bcf __pclath, 0 }; asm{ movlw $+4 }; asm{ movwf __fsr }; asm{ movlw hi_addr($+0x8002) }; asm{ goto __OS_ReturnSave }; } ; if (!_OS_CheckEvent((!((SENSOR_QUEUE).Q.cFilled == (SENSOR_QUEUE).Q.cSize)) != 0)) asm{ return} ; } ; } _OS_Queue_Send(&(SENSOR_QUEUE), (OST_MSG) (ADC_Value)); } ;
  { _OS_InitDelay(2); { asm{ movlw hi_addr(__OS_ReturnSave) }; asm{ movwf __pclath }; asm{ movlw $+4 }; asm{ movwf __fsr }; asm{ movlw hi_addr($+0x2)}; asm{ goto __OS_ReturnSave }; } ; } ;
 }
}
void SERIAL_TASK(void)
{
 static unsigned int ADC_Value = 0;
 static char* Temp[8];
 unsigned char Recieve_Data = 0;
 while(1)
 {
 if (UART1_Data_Ready())
 {
 Recieve_Data = UART1_Read();
   { ; _OS_Queue_Send(&(RECIEVE_QUEUE), (OST_MSG) (Recieve_Data)); ; } ;
 UART1_Write(Recieve_Data);
 }
 if ( ((SENSOR_QUEUE).Q.cFilled) )
 {
   { { { asm{ movlw hi_addr(__OS_ReturnSave) }; asm{ movwf __pclath }; asm{ bcf __pclath, 0 }; asm{ movlw $+4 }; asm{ movwf __fsr }; asm{ movlw hi_addr($+0x8002) }; asm{ goto __OS_ReturnSave }; } ; if (!_OS_CheckEvent((((SENSOR_QUEUE).Q.cFilled)) != 0)) asm{ return} ; } ;  { ADC_Value = _OS_Queue_Get(&(SENSOR_QUEUE)); } ; } ;
   { ; _OS_Queue_Send(&(DISPLAY_QUEUE), (OST_MSG) (ADC_Value)); ; } ;
 IntToStr(ADC_Value, Temp);
 UART1_Write_Text("{");
 UART1_Write_Text(Temp);
 UART1_Write_Text("}");
 UART1_Write(0x0A);
 }
  { _OS_InitDelay(2); { asm{ movlw hi_addr(__OS_ReturnSave) }; asm{ movwf __pclath }; asm{ movlw $+4 }; asm{ movwf __fsr }; asm{ movlw hi_addr($+0x2)}; asm{ goto __OS_ReturnSave }; } ; } ;
 }
}
void Systick_Init()
{
 OPTION_REG = 0x84;
 TMR0 = 100;
 INTCON = 0xA0;
}
void Systick_INT() iv 0x0004 ics ICS_AUTO
{
 if (TMR0IF_bit)
 {
 TMR0IF_bit = 0;
 TMR0 = 100;
  { { ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ;  { ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; } } ; { OST_UINT _os_i; ; ; for (_os_i = 0; _os_i < 5 ; _os_i++) { if (_OS_Tasks[_os_i].State.bDelay){ if (!++_OS_Tasks[_os_i].Timer) _OS_Tasks[_os_i].State.bDelay = 0; } } } ; ; ; ; } ;
 }
}
