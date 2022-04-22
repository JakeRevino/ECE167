#include "PING.h"
#include "timers.h"
#include "BOARD.h"
#include <stdio.h>

#define _10us 0x7 // 6.25 ticks but rounded up to 7
#define _60ms 0x927C // 37500 ticks
#define milli 10e-3
#define micro 10e-6
#define LightSpeed 340 // speed of light = 340m/s
#define slope 58.3
#define b 80.1

static int distance;
static int TOF_start;
static int TOF_end;
static int timeFlag;

// Setup pin 34 on IO shield for the change notify PORTDbits.RD5

/**
 * @function    PING_Init(void)
 * @brief       Sets up both the timer and Change notify peripherals along with their
 *              respective interrupts.  Also handles any other tasks needed such as pin 
 *              I/O directions, and any other things you need to initialize the sensor.
 *              TIMERS library must be inited before this library.
 * @return      SUCCESS or ERROR (as defined in BOARD.h)
 */
char PING_Init(void) {
    // following block inits the timer
    T4CON = 0;
    T4CONbits.TCKPS = 0b110;
    PR4 = 0xFFFF; // this is not the timer value wanted
    T4CONbits.ON = 1;
    IFS0bits.T4IF = 0;
    IPC4bits.T4IP = 3;
    IEC0bits.T4IE = 1;

    // following block inits change notify
    CNCONbits.ON = 1; // Change Notify On
    CNENbits.CNEN14 = 1;
    int temp = PORTD; // this is intentional to ensure a interrupt occur immediately upon enabling
    IFS1bits.CNIF = 0; // clear interrupt flag
    IPC6bits.CNIP = 1; //set priority
    IPC6bits.CNIS = 3; // and sub priority
    IEC1bits.CNIE = 1; // enable change notify

    //Anything else that needs to occur goes here
    TRISDbits.TRISD5 = 1; // sets ECHO pin 34 as input (also CN pin)
    TRISDbits.TRISD11 = 0; // sets TRIGGER pin 35 as output

    return SUCCESS;

}

/**
 * @function    PING_GetDistance(void)
 * @brief       Returns the calculated distance in mm using the sensor model determined
 *              experimentally. 
 *              No I/O should be done in this function
 * @return      distance in mm
 */
unsigned int PING_GetDistance(void) {
     //58.3x+80.5
    unsigned int TOF = (PING_GetTimeofFlight() + b) / slope;
    
    
    return TOF - 1;
}

/**
 * @function    PING_GetTimeofFlight(void)
 * @brief       Returns the raw microsecond duration of the echo from the sensor.
 *              NO I/O should be done in this function.
 * @return      time of flight in uSec
 */
unsigned int PING_GetTimeofFlight(void) {
    int temp = TOF_end - TOF_start; // difference between end and start times is time of flight
    return (unsigned int) temp;
}

void __ISR(_CHANGE_NOTICE_VECTOR) ChangeNotice_Handler(void) {
    static char readPort = 0;
    readPort = PORTD; // this read is required to make the interrupt work
    IFS1bits.CNIF = 0;
    //Anything else that needs to occur goes here

    if (PORTDbits.RD5 == 1) {
        TOF_start = TIMERS_GetMicroSeconds();
    }
    else if (PORTDbits.RD5 == 0) {
        TOF_end = TIMERS_GetMicroSeconds();
    }
}

void __ISR(_TIMER_4_VECTOR) Timer4IntHandler(void) {
    IFS0bits.T4IF = 0;
    //Anything else that needs to occur goes here
    if (timeFlag == 0) {
        PR4 = _10us; // load PR4 with 10us for trigger
        timeFlag = 1; // raise flag
        LATDbits.LATD11 = 1; // raise trigger pin after 60ms
    } else if (timeFlag == 1) { 
        PR4 = _60ms; // load PR4 with 60ms to delay
        timeFlag = 0; // lower the flag
        LATDbits.LATD11 = 0; // lower trigger pin after 10us
    }
}