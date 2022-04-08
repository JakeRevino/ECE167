#include <AD.h>
#include <BOARD.h>
#include <stdio.h>
#include <Oled.h>
#include <math.h>
#include "ToneGeneration.h"
#include "serial.h"

#define DELAY(x)    {int wait; for (wait = 0; wait <= x; wait++) {asm("nop");}}
#define TIME 200000
#define SCALER 10
#define ValFromScope 100 // Peak-to-peak voltage measured on scope

#ifdef PIEZO_TEST

int main(void) {
    BOARD_Init();
    AD_Init();
    OledInit();
    ToneGeneration_Init();
    printf("Beginning Piezo Test\r\n");

    AD_AddPins(AD_A1);
    AD_AddPins(AD_A2);
    unsigned int flex = AD_A1;
    unsigned int piezo = AD_A2;
    int flexVal = 0;
    int flexAngle = 0;
    int piezoVal = 0;
    int i;

    while (1) {
        flexVal = AD_ReadADPin(flex); // read and store the FLEX reading
        flexAngle = (3.27 * flexVal) + 349; // Eq. from Excel, using a 67k resistor
        piezoVal = AD_ReadADPin(piezo); // read and store the PIEZO reading

        if (piezoVal > ValFromScope) { // if true then piezo got flicked
            ToneGeneration_SetFrequency(flexAngle / SCALER); // dividing it by 10 to reduce frequency to an audible range
            ToneGeneration_ToneOn();
            
            for (i = 0; i < TIME; i++) {
                 piezoVal = AD_ReadADPin(piezo); // re-read piezo sensor
                 if (piezoVal > ValFromScope) { // check if piezo was flicked again
                     i = 0; // reset the timer
                 }
                 continue;
            }
            ToneGeneration_ToneOff(); // turn off the tone when done
        }
    }
}
#endif