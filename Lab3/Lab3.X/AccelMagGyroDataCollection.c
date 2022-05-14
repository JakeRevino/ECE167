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

#define ACTIVATE_MODULE
#ifdef ACTIVATE_MODULE
int main(void) {
    // Required module Inits
    BOARD_Init();
    BNO055_Init();
    TIMERS_Init();

    // declare variables needed for module
    int i = 0;
    int time = 0;
    int GyroX = 0;
    int angleX = 0;
    int GyroY = 0;
    int angleY = 0;
    int GyroZ = 0;
    int angleZ = 0;

#define OUTPUT_CORRECTED_DATA
#ifdef OUTPUT_CORRECTED_DATA

    //for (i = 0; i <= _10sec; i++) {
    while (1) {
        GyroX = (BNO055_ReadGyroX() + GyroXOffset) / Raw2AngleConv; // Read and convert X
        GyroY = (BNO055_ReadGyroY() + GyroYOffset) / Raw2AngleConv; // Read and convert Y
        GyroZ = (BNO055_ReadGyroZ() - GyroZOffset) / Raw2AngleConv; // Read and convert Z
        angleX = GyroX + angleX; // sum the X angles
        angleY = GyroY + angleY; // sum the Y angles
        angleZ = GyroZ + angleZ; // sum the Z angles
        printf("%d, %d, %d\r\n", (angleX / angleScaler), (angleY / angleScaler), (angleZ / angleScaler));
        time = TIMERS_GetMilliSeconds(); // make a start time
        while ((TIMERS_GetMilliSeconds() - time) < _20ms); // delay
    }
#endif

    // #define COLLECT_ACCEL_DATA
#ifdef COLLECT_ACCEL_DATA
    for (i = 0; i <= numSamples; i++) {
        printf("%d\r\n", BNO055_ReadAccelX());
        time = TIMERS_GetMilliSeconds(); // make a start time
        while ((TIMERS_GetMilliSeconds() - time) < 20); // 20ms == 1/50Hz
    }
    printf("\n\n");

    for (i = 0; i <= numSamples; i++) {
        printf("%d\r\n", BNO055_ReadAccelY());
        time = TIMERS_GetMilliSeconds(); // make a start time
        while ((TIMERS_GetMilliSeconds() - time) < 23); // 20ms == 1/50Hz
    }
    printf("\n\n");

    for (i = 0; i <= numSamples; i++) {

        printf("%d\r\n", BNO055_ReadAccelZ());
        time = TIMERS_GetMilliSeconds(); // make a start time
        while ((TIMERS_GetMilliSeconds() - time) < 20); // 20ms == 1/50Hz
    }
    printf("\n\n");
#endif

    //#define COLLECT_MAGNETOMETER_DATA
#ifdef COLLECT_MAGNETOMETER_DATA
    for (i = 0; i <= numSamples; i++) {
        //  while (1) {
        printf("%d\r\n", BNO055_ReadMagX());
        time = TIMERS_GetMilliSeconds(); // make a start time
        while ((TIMERS_GetMilliSeconds() - time) < 23); // 20ms == 1/50Hz
    }
    printf("\n\n");

    for (i = 0; i <= numSamples; i++) {
        //     while (1) {
        printf("%d\r\n", BNO055_ReadMagY());
        time = TIMERS_GetMilliSeconds(); // make a start time
        while ((TIMERS_GetMilliSeconds() - time) < 23); // 20ms == 1/50Hz
    }
    printf("\n\n");

    for (i = 0; i <= numSamples; i++) {
        //  while (1) {
        printf("%d\r\n", BNO055_ReadMagZ());
        time = TIMERS_GetMilliSeconds(); // make a start time
        while ((TIMERS_GetMilliSeconds() - time) < 23); // 20ms == 1/50Hz
    }
    printf("\n\n");
#endif

    //#define COLLECT_GYSOSCOPE_DATE
#ifdef COLLECT_GYSOSCOPE_DATE
    //    for (i = 0; i < _10sec; i++) {
    //        // while (1) {
    //        if (i == 0) {
    //            printf("***** NEW DATA STARTING NOW *****\n");
    //            printf("%d    %d    %d\r\n", BNO055_ReadGyroX(), BNO055_ReadGyroY(), BNO055_ReadGyroZ());
    //            time = TIMERS_GetMilliSeconds(); // make a start time
    //            while ((TIMERS_GetMilliSeconds() - time) < 20); // 20ms == 1/50Hz
    //        } else {
    //            printf("%d    %d    %d\r\n", BNO055_ReadGyroX(), BNO055_ReadGyroY(), BNO055_ReadGyroZ());
    //            time = TIMERS_GetMilliSeconds(); // make a start time
    //            while ((TIMERS_GetMilliSeconds() - time) < 20); // 20ms == 1/50Hz
    //        }
    //    }
    printf("\n\n\n");

#endif
}
#endif
