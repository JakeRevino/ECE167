#include "BOARD.h"
#include "BNO055.h"
//#include "I2C.h"
#include "Ascii.h"
#include "timers.h"
#include "serial.h"

#include <stdio.h>
#include <stdlib.h>
#include <xc.h>

//#define ACCELEROMETER_TEST
#ifdef ACCELEROMETER_TEST

#define POWERPIN_LAT LATFbits.LATF1
#define POWERPIN_TRIS TRISFbits.TRISF1
#define numSamples 500
//#define _20ms 20

int main(void) {
    // Required module Inits
    BOARD_Init();
    BNO055_Init();
    TIMERS_Init();
    int zup = 0;
    int i = 0;
    int time = 0;

    //#define COLLECT_ACCEL_DATA
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
//     for (i = 0; i <= numSamples; i++) {
//  //  while (1) {
//        printf("%d\r\n", BNO055_ReadMagX());
//        time = TIMERS_GetMilliSeconds(); // make a start time
//        while ((TIMERS_GetMilliSeconds() - time) < 23); // 20ms == 1/50Hz
//    }
//    printf("\n\n");
    //
    //    for (i = 0; i <= numSamples; i++) {
    //   //     while (1) {
    //        printf("%d\r\n", BNO055_ReadMagY());
    //        time = TIMERS_GetMilliSeconds(); // make a start time
    //        while ((TIMERS_GetMilliSeconds() - time) < 23); // 20ms == 1/50Hz
    //    }
    //    printf("\n\n");
    //
        for (i = 0; i <= numSamples; i++) {
      //  while (1) {
            printf("%d\r\n", BNO055_ReadMagZ());
            time = TIMERS_GetMilliSeconds(); // make a start time
            while ((TIMERS_GetMilliSeconds() - time) < 23); // 20ms == 1/50Hz
        }
        printf("\n\n");
#endif



    /*
        int time = 0; // this will be for a start time
        int i = 0; // loop counter

        // Accelerometer X-Axis variables
        int xSum = 0;
        float xAxis = 0;
        int xAverage = 0;
        float xScaled = 0;

        // Accelerometer Y-Axis variables
        int ySum = 0;
        float yAxis = 0;
        float yScaled = 0;
        int yAverage = 0;

        // Accelerometer Z-Axis variable
        int zSum = 0;
        float zAxis = 0;
        int zAverage = 0;
        float zScaled = 0;

        // Magnetometer X-Axis variables
        int xMag = 0;
        int xMagSum = 0;
        int xMagAve = 0;
        int xMin = 0;
        int xMax = 0;

        // Magnetometer Y-Axis variables
        int yMag = 0;
        int yMagSum = 0;
        int yMagAve = 0;
        int yMin = 0;
        int yMax = 0;

        // Magnetometer Z-Axis variables
        int zMag = 0;
        int zMagSum = 0;
        int zMagAve = 0;
        int zMin = 0;
        int zMax = 0;

       // for (i = 0; i <= numSamples; i++) { // only want to do this 500 times for calibration
              while (1) {
            xAxis = BNO055_ReadAccelX(); // Read Accelerometer X
            yAxis = BNO055_ReadAccelY(); // Read Accelerometer Y
            zAxis = BNO055_ReadAccelZ(); // Read Accelerometer Z

            xMag = BNO055_ReadMagX(); // Read Magnetometer X
            if (xMag > xMax) {
                xMax = xMag;
            } else if (xMag < xMin) {
                xMin = xMag;
            }
            yMag = BNO055_ReadMagY(); // Read Magnetometer Y
            if (yMag > yMax) {
                yMax = yMag;
            } else if (yMag < yMin) {
                yMin = yMag;
            }
            zMag = BNO055_ReadMagZ(); // Read Magnetometer Z
            if (zMag > zMax) {
                zMax = zMag;
            } else if (zMag < zMin) {
                zMin = zMag;
            }
            xSum = xSum + xAxis; // Sum up X
            ySum = ySum + yAxis; // Sum up Y
            zSum = zSum + zAxis; // Sum up Z

            xMagSum = xMagSum + xMag; // sum up magnetometer x output
            yMagSum = yMagSum + yMag; // sum up magnetometer y output
            zMagSum = zMagSum + zMag; // sum up magnetometer z output

            xScaled = (1 / 1.0045) * (xAxis + 19.5); // Calibrate X
            yScaled = (1 / 0.9955) * (yAxis + 11.5); // Calibrate Y
            zScaled = (1 / 0.9995) * (zAxis - 11.5); // Calibrate Z

              printf("X-orientation: %.2f;    Y-orientation: %.2f;    Z-orientation: %.2f\r\n", xScaled, yScaled, zScaled); // print out scaled x, y, and z
          //  printf("%06f\r\n", xMag); // print out scaled x, y, and z
            time = TIMERS_GetMilliSeconds(); // make a start time
            while ((TIMERS_GetMilliSeconds() - time) < 23); // 20ms == 1/50Hz

        }
        xMagAve = xMagSum / numSamples; // calculate average magnetometer X
        yMagAve = yMagSum / numSamples; // calculate average magnetometer Y
        zMagAve = zMagSum / numSamples; // calculate average magnetometer Z
      //  printf("X Max: %d;    X min: %d;    Y Max: %d;    Y Min: %d;    Z Max: %d;    Z Min: %d\r\n", xMax, xMin, yMax, yMin, zMax, zMin);
        //    xAverage = xSum / numSamples; // calculate average of X
        //    yAverage = ySum / numSamples; // calculate average of Y
        //    zAverage = zSum / numSamples; // calculate average of Z
        //
        //    printf("Average X: %06d\r\nAverage Y: %06d\r\nAverage Z: %06d\r\n", xAverage, yAverage, zAverage);

        // Average Z right side up = 988
        // Average Z upside down = -1011
        // Average positive Y = 1007
        // Average negative Y = -984
        // Average positive X = 985
        // Average negative X = -1024

        // Maximum Magnetometer X = 3.61E22
        // Min Magnetometer X = 4118.54
     */
}
#endif