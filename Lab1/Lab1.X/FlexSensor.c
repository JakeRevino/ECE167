#include <AD.h>
#include <BOARD.h>
#include <stdio.h>
#include <Oled.h>
#include <math.h>
#include "ToneGeneration.h"
#include "serial.h"

#ifdef LAB1_MAIN

#define DELAY(x)    {int wait; for (wait = 0; wait <= x; wait++) {asm("nop");}}
#define TIME 200000

unsigned int flex = AD_A1; // AD pin to use
int flexVal = 0;
int OldFlexVal = 1;
int flexAngle = 0;
int frequency;
char flexString[50] = {};
int FilterValue = 0;

int main(void) {
    BOARD_Init();
    AD_Init();
    OledInit();
    ToneGeneration_Init();
    printf("Beginning Flex Test\r\n");

    AD_AddPins(AD_A1); // Add pin A1

    while (1) {

        //PotValue = AD_ReadADPin(pot);
        flexVal = AD_ReadADPin(flex); // read and store the reading
        printf("AD Reading: %d\r\n", flexVal);
        if ((flexVal > OldFlexVal + 1) || (flexVal < OldFlexVal - 1)) { // want to have a difference of 10
            FilterValue = (flexVal + OldFlexVal) / 2; // taking the moving average
            OldFlexVal = flexVal;
        }
        // create an offset for the pot value to not go below 0
        FilterValue = flexVal / 10;
        
        flexAngle = -(flexVal / 2.6951) + 379; // equation from Excel
        //printf("AD Reading: %d\r\n", flexVal);

        DELAY(TIME);
        // printing angle to OLED
        sprintf(flexString, "Angle: %d", flexAngle);
        OledClear(OLED_COLOR_BLACK);
        OledDrawString(flexString);
        OledUpdate();

        // multiply the angle by 10 to go from 0 kHz to about 1000 kHz
        ToneGeneration_SetFrequency(flexAngle * FilterValue);
        ToneGeneration_ToneOn();
    }
    ToneGeneration_ToneOff();
}
#endif