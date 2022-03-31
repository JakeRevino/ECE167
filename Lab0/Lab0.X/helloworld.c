#include <stdio.h>
#include <stdlib.h>
#include <xc.h>

#include <BOARD.h>
#include <serial.h>
#include <AD.h>

#ifdef HELLO_WORLD_TEST

#define DELAY(x)    {int wait; for (wait = 0; wait <= x; wait++) {asm("nop");}}
#define A_BIT       18300
#define A_LOT       183000
//#define DISABLE_ADINIT
#define TIMES_TO_READ 4000

#define ODD_ACTIVE (AD_A1|AD_A3|AD_A5)
#define EVEN_ACTIVE (AD_A0|AD_A2|AD_A4)

#define ALLADMINUSBATT ALLADPINS 

int main(void) {

    unsigned int wait = 0;
    int readcount = 0;
    unsigned int CurPin = 0;
    unsigned int PinListing = 0;
    char FunctionResponse = 0;
    char TestFailed = FALSE;
    BOARD_Init();
    AD_Init();
    AD_AddPins(AD_A0);
    while (1) {
        if (AD_IsNewDataReady()) {
            printf("\r\nReading: %d", AD_ReadADPin(AD_A0));
            DELAY(A_BIT);
        }
    }
    //    BOARD_Init();
    //    printf("Hello World!\n");
        BOARD_End();
    //    while (1);

}
#endif