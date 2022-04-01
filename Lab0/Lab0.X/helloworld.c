#include <stdio.h>
#include <stdlib.h>
#include <xc.h>

#include <BOARD.h>
#include <serial.h>
#include <AD.h>
#include <pwm.h>

/**
 * This macro initializes all LEDs for use. It enables the proper pins as outputs and also turns all
 * LEDs off.
 */
#define LEDS_INIT() do {LATECLR = 0xFF; TRISECLR = 0xFF;} while (0)
/**
 * This macro sets the LEDs on according to which bits are high in the argument. Bit 0 corresponds
 * to LED0.
 * @param leds Set the LEDs to this value where 1 means on and 0 means off.
 */
#define LEDS_SET(leds) do { LATE = (leds); } while (0)


#ifdef HELLO_WORLD_TEST

#define DELAY(x)    {int wait; for (wait = 0; wait <= x; wait++) {asm("nop");}}
#define A_BIT       18300
#define A_LOT       183000
////#define DISABLE_ADINIT
//#define TIMES_TO_READ 4000
//
//#define ODD_ACTIVE (AD_A1|AD_A3|AD_A5)
//#define EVEN_ACTIVE (AD_A0|AD_A2|AD_A4)
//
//#define ALLADMINUSBATT ALLADPINS 

 #define MIN_RAMP 0
 #define MAX_RAMP 1000
 #define FIRST_PERIOD PWM_20KHZ
 #define SECOND_PERIOD PWM_500HZ
 //#define DELAY() for(i=0;i < NOPCOUNT; i++) __asm("nop")
 #define NOPCOUNT 520000

int main(void) {
    LEDS_INIT();
    unsigned int i, j;
    BOARD_Init();
    printf("Uno PWM Test Harness\r\n");
    PWM_Init();
    PWM_AddPins(PWM_PORTX11 | PWM_PORTY04 | PWM_PORTY10 | PWM_PORTY12 | PWM_PORTZ06);
    PWM_SetFrequency(FIRST_PERIOD);


    printf("Ramping PWM from %d-%d%% in 10%% steps at %d with a delay between\r\n", MIN_RAMP, MAX_RAMP, FIRST_PERIOD);
    unsigned char ch = 0;
    for (j = MIN_RAMP; j <= MAX_RAMP; j += 100) {
        PWM_SetDutyCycle(PWM_PORTX11, j);
        PWM_SetDutyCycle(PWM_PORTY04, j + 20);
        PWM_SetDutyCycle(PWM_PORTY10, j + 40);
        PWM_SetDutyCycle(PWM_PORTY12, j + 60);
        PWM_SetDutyCycle(PWM_PORTZ06, j + 80);
        printf("Outputting %d%% Duty Cycle\r\n", j / 10);
        DELAY(520000);
    }
    printf("Setting Period to %d and repeating ramp\r\n", SECOND_PERIOD);
    PWM_End();
    PWM_Init();
    PWM_AddPins(PWM_PORTX11 | PWM_PORTY04 | PWM_PORTY10 | PWM_PORTY12 | PWM_PORTZ06);
    PWM_SetFrequency(FIRST_PERIOD);
    for (j = MIN_RAMP; j <= MAX_RAMP; j += 100) {
        PWM_SetDutyCycle(PWM_PORTX11, j);
        PWM_SetDutyCycle(PWM_PORTY04, j + 20);
        PWM_SetDutyCycle(PWM_PORTY10, j + 40);
        PWM_SetDutyCycle(PWM_PORTY12, j + 60);
        PWM_SetDutyCycle(PWM_PORTZ06, j + 80);
        printf("Outputting %d%% Duty Cycle\r\n", j / 10);
        DELAY(520000);
    }
    PWM_End();



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
       // LEDS_SET(0b1111);
        if (AD_IsNewDataReady()) {
            printf("\r\nReading: %d", AD_ReadADPin(AD_A0));
            DELAY(A_BIT);
            LEDS_SET(AD_A0);
        }
    }
    //  BOARD_Init();
    //  AD_Init();
    printf("Hello World!\n");
    BOARD_End();
    while (1);

}
#endif