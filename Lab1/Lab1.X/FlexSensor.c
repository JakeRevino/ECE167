#include <AD.h>
#include <BOARD.h>
#include <stdio.h>
#include <Oled.h>
#include <math.h>
#include "ToneGeneration.h"
#include "serial.h"

#ifdef FLEX_SENSOR_TEST

#define DELAY(x)    {int wait; for (wait = 0; wait <= x; wait++) {asm("nop");}}
#define TIME 200000
#define SCALER 10

int main(void) {
    BOARD_Init();
    AD_Init();
    OledInit();
    ToneGeneration_Init();
    printf("Beginning Flex Test\r\n");

    AD_AddPins(AD_A1); // Add pin A1
    unsigned int flex = AD_A1; // AD pin to use
    int flexVal = 0;
    int flexAngle = 0;
    char flexString[50] = {};

    while (1) {
        flexVal = AD_ReadADPin(flex); // read and store the reading
        flexAngle = (3.27 * flexVal) + 349; // Eq. from Excel, using a 67k resistor
        printf("AD Reading: %d\r\n", flexAngle);
        DELAY(TIME);

        // printing angle to OLED
        sprintf(flexString, "Angle: %d", flexAngle);
        OledClear(OLED_COLOR_BLACK);
        OledDrawString(flexString);
        OledUpdate();
        DELAY(TIME);

        ToneGeneration_SetFrequency(flexAngle / SCALER); // dividing it by 10 to reduce frequency to an audible range
        ToneGeneration_ToneOn();
    }
    ToneGeneration_ToneOff();
}
#endif