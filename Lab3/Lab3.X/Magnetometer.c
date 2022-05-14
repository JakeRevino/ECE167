#include "BOARD.h"
#include "BNO055.h"
//#include "I2C.h"
#include "Ascii.h"
#include "timers.h"
#include "serial.h"

#include <stdio.h>
#include <stdlib.h>
#include <xc.h>

//#define MAGNETOMETER_TEST
#ifdef MAGNETOMETER_TEST

#define POWERPIN_LAT LATFbits.LATF1
#define POWERPIN_TRIS TRISFbits.TRISF1
#define numSamples 500
//#define _20ms 20

int main(void) {
    // Required module Inits
    BOARD_Init();
    BNO055_Init();
    TIMERS_Init();

    int time = 0; // this will be for a start time
    int i = 0; // loop counter

    int xMag = 0;
    while (1) {
        xMag = BNO055_ReadMagX();
        printf("%06d\r\n", xMag);
        time = TIMERS_GetMilliSeconds(); // make a start time
        while ((TIMERS_GetMilliSeconds() - time) < 30); // 20ms == 1/50Hz
    }

}
#endif