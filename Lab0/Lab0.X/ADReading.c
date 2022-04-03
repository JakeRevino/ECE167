#include <xc.h>
#include "serial.h"
#include "AD.h"
#include "BOARD.h"
#include <stdio.h>

#define DELAY(x)    {int wait; for (wait = 0; wait <= x; wait++) {asm("nop");}}
#define A_BIT       18300
#define A_LOT       183000
//#define DISABLE_ADINIT
#define TIMES_TO_READ 4000

#define ODD_ACTIVE (AD_A1|AD_A3|AD_A5)
#define EVEN_ACTIVE (AD_A0|AD_A2|AD_A4)

#define ALLADMINUSBATT ALLADPINS 

#ifdef AD_READ_TEST

int main(void) {
    BOARD_Init();
    AD_Init();
    AD_AddPins(AD_A0);
    printf("Beginning A/D Reading Test\r\n");
    while (1) {
        if (AD_IsNewDataReady()) {
            printf("\r\nReading: %d", AD_ReadADPin(AD_A0));
            DELAY(A_BIT);
        }
    }
    return 0;
}
#endif