#include "BOARD.h"
#include "BNO055.h"
#include "Ascii.h"
#include "timers.h"
#include "serial.h"

#include <stdio.h>
#include <stdlib.h>
#include <xc.h>

#define POWERPIN_LAT LATFbits.LATF1
#define POWERPIN_TRIS TRISFbits.TRISF1
#define numSamples 500
#define _1hr 180000  // 180000 samples at 50 Hz is 1 hr of data
#define _10sec 500  // 500 samples at 50 Hz is 10 seconds of data
#define _20ms 20 // sampling at 50Hz ==> 20ms (1/50 = 0.02)
#define angleScaler 46 // this value came from trial and error 
#define GyroXOffset 7.75 // values from Matlab after taking the mean of the 10s data
#define GyroYOffset 17.913
#define GyroZOffset 29.072
#define Raw2AngleConv 131.068
#define _20sec 1000

int main(void) {
    // Required module Inits
    BOARD_Init();
    BNO055_Init();
    TIMERS_Init();

    int time = 0;

    int accelX = 0;
    int accelY = 0;
    int accelZ = 0;

    int magX = 0;
    int magY = 0;
    int magZ = 0;

    for (int i = 0; i <= _20sec; i++) {
        accelX = BNO055_ReadAccelX();
        accelY = BNO055_ReadAccelY();
        accelZ = BNO055_ReadAccelZ();
        magX = BNO055_ReadMagX();
        magY = BNO055_ReadMagY();
        magZ = BNO055_ReadMagZ();
        //        printf("%d, %d, %d\r\n", accelX, accelY, accelZ);
        printf("%d, %d, %d\r\n", magX, magY, magZ);
        time = TIMERS_GetMilliSeconds(); // make a start time
        while ((TIMERS_GetMilliSeconds() - time) < 20); // 20ms == 1/50Hz
    }
    // take accelerometer & magnetometer data for X, Y, & Z while moving
    // take a lot of data, 2 sets (training and validation)
    // plot norm of both accel and mag vs time
    // take mean and std dev. of the norm to see how good the "raw" sensors are
    // calibrate sensor reading using null shifts and scale factor from earlier
    // plot norm AGAIN
    // run data through matlab code as in part 2 to get scale factor and biases for each sensor
    // there is a function to output calibrated sensor data
    // plot pre- and post-calibration norm of each
    // make a table of means and std devs. 

}