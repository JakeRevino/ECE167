#include "CAPTOUCH.h"
#include "BOARD.h"
#include "QEI.h"
#include "pwm.h"
#include "serial.h"
#include "AD.h"

#include <stdio.h>
#include <stdlib.h>
#include <xc.h>

//#define CAPTOUCH_TEST /* ######### UNCOMMENT THIS LINE TO RUN MODULE ######## */
#ifdef CAPTOUCH_TEST
int main(void) {
    BOARD_Init();
    AD_Init();
    CAPTOUCH_Init();

    // use input capture pin 35 (specified in CAPTOUCH.h)
    TRISDbits.TRISD11 = 1; // set pin 35 as input
    int touchFlag = 0;
    while (1) {
        if (CAPTOUCH_IsTouched() == TRUE && touchFlag == 0) {
            printf("Touched!\r\n");
            touchFlag = 1;
        } else if (CAPTOUCH_IsTouched() == FALSE && touchFlag == 1) {
            touchFlag = 0;
        }

    }
    return 0;
}
#endif