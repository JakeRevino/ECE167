#include "BOARD.h"
#include "serial.h"
#include "ToneGeneration.h"
#include <xc.h>
#include <stdio.h>

#ifdef TONE_GEN_TEST

#define DELAY(x)    {int wait; for (wait = 0; wait <= x; wait++) {asm("nop");}}
#define A_BIT       18300
#define A_LOT       183000

int main(void) {
    BOARD_Init();
    printf("Beginning Tone Generation Test\r\n");
    ToneGeneration_Init();
    while (1) {

        ToneGeneration_SetFrequency(TONE_196);
        ToneGeneration_ToneOn();
        DELAY(A_LOT);
    }
    ToneGeneration_ToneOff();
    return 0;
}

#endif