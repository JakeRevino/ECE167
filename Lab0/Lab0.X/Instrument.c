#include <BOARD.h>
#include <AD.h>
#include <ToneGeneration.h>
#include <pwm.h>
#include <xc.h>

#include <stdio.h>
#include <stdlib.h>

#ifdef INSTRUMENT_TEST

int main(void) {
    // initialize all the things
    BOARD_Init();
    AD_Init();
    AD_AddPins(AD_A0);
    ToneGeneration_Init();

    // set up some variables
    unsigned int pot = AD_A0;
    int PotValue = 0;
    int OldPotValue = 1;
    int FilterValue = 0;

    // send out an alive message
    printf("Instrument is ready to rock!\r\n");

    while (1) {
        // read value from pot but only change it if the new value has changed enough
        PotValue = AD_ReadADPin(pot);
        if ((PotValue > OldPotValue + 10) || (PotValue < OldPotValue - 10)) {
            FilterValue = (PotValue + OldPotValue) / 2;
            OldPotValue = PotValue;
        }
        // create an offset for the pot value to not go below 0
        FilterValue = PotValue / 10;
        // if no buttons then no tone
        if (BUTTON_STATES() == 0x00) {
            ToneGeneration_ToneOff();
        }
        // each button will set a different tone
        if (BUTTON_STATES() == 0x01) {
            ToneGeneration_SetFrequency(TONE_196 - FilterValue);
            ToneGeneration_ToneOn();
        }
        if (BUTTON_STATES() == 0x02) {
            ToneGeneration_SetFrequency(TONE_293 - FilterValue);
            ToneGeneration_ToneOn();
        }
        if (BUTTON_STATES() == 0x03) {
            ToneGeneration_SetFrequency(TONE_440 - FilterValue);
            ToneGeneration_ToneOn();
        }
        if (BUTTON_STATES() == 0x04) {
            ToneGeneration_SetFrequency(TONE_440 - FilterValue);
            ToneGeneration_ToneOn();
        }
        if (BUTTON_STATES() == 0x08) {
            ToneGeneration_SetFrequency(TONE_659 - FilterValue);
            ToneGeneration_ToneOn();
        }
    }
    while (1);
}
#endif