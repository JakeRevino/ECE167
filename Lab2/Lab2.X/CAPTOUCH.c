#include "CAPTOUCH.h"
#include "BOARD.h"
#include "QEI.h"
#include "pwm.h"
#include "serial.h"
#include "AD.h"

#include <stdio.h>
#include <stdlib.h>
#include <xc.h>

#define delta_ticks 898 // difference in rise times touched vs. untouched, converted to ticks

static int time;
static int prevTime;
static int aveIndex;
static int input;
static int sum;
static int frame[3] = {};
static int average;

/**
 * @function    CAPTOUCH_Init(void)
 * @brief       This function initializes the module for use. Initialization is 
 *              done by opening and configuring timer 2, opening and configuring the input capture
 *              peripheral, and setting up the interrupt.
 * @return      SUCCESS or ERROR (as defined in BOARD.h)
 */
char CAPTOUCH_Init(void) {
    // following block inits the timer
    T2CON = 0;
    T2CONbits.TCKPS = 0b011;
    PR2 = 0xFFFF;
    T2CONbits.ON = 1;

    //this block inits input capture
    IC4CON = 0;
    IC4CONbits.ICTMR = 1;
    IC4CONbits.ICM = 0b010;

    IFS0bits.IC4IF = 0;
    IPC4bits.IC4IP = 7;
    IEC0bits.IC4IE = 1;
    IC4CONbits.ON = 1;
    // whatever else you need to do to initialize your module

    return SUCCESS;

}

/**
 * @function    CAPTOUCH_IsTouched(void)
 * @brief       Returns TRUE if finger is detected. Averaging of previous measurements 
 *              may occur within this function, however you are NOT allowed to do any I/O
 *              inside this function.
 * @return      TRUE or FALSE
 */
char CAPTOUCH_IsTouched(void) {
    /* if time between triggers is long enough, then it was touched */
    int dT = average - prevTime;
    if (dT >= delta_ticks) {
        return TRUE;
    }
    return FALSE;
}

//int main(void) {
//    BOARD_Init();
//    AD_Init();
//    CAPTOUCH_Init();
//
//    // use input capture pin 35 (specified in CAPTOUCH.h)
//    TRISDbits.TRISD11 = 1; // set pin 35 as input
//    int touchFlag = 0;
//    while (1) {
//        if (CAPTOUCH_IsTouched() == TRUE && touchFlag == 0) {
//            printf("Touched!\r\n");
//            touchFlag = 1;
//        } else if (CAPTOUCH_IsTouched() == FALSE && touchFlag == 1) {
//            touchFlag = 0;
//        }
//
//    }
//    return 0;
//}

void __ISR(_INPUT_CAPTURE_4_VECTOR) InputCapture_Handler(void) {
    IFS0bits.IC4IF = 0;
    // IC4BUF contains the timer value when the rising edge occurred.

    prevTime = average; // set previous time to average
    // 3-point rolling average
    sum -= frame[aveIndex]; // remove oldest data
    input = IC4BUF; // pull new data from IC2BUF
    frame[aveIndex] = input; // put new data into frame
    sum += input; // calculate new sum
    aveIndex = (aveIndex + 1) % 3; // roll-over to 0 if sum is greater than window
    average = sum / 3; // calculate new average
}