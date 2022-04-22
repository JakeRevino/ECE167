#include "QEI.h"
#include "pwm.h"
#include "Oled.h"
#include <stdio.h>

#define DELAY(x)    {int wait; for (wait = 0; wait <= x; wait++) {asm("nop");}}
#define TIME 200000
#define SCALER 10

//#define COLOR_ENCODER_TEST
#ifdef COLOR_ENCODER_TEST
int main(void) {
    BOARD_Init();
    PWM_Init();
    QEI_Init();
    OledInit();
    char flexString[50] = {};

    // use pwm signal to change color on LEDs, 3 lines RGB
    PWM_AddPins(PWM_PORTY12); // pin 5
    PWM_AddPins(PWM_PORTY10); // pin 6
    PWM_AddPins(PWM_PORTY04); // pin 9

    int angle = 1000;

    while (1) {
        angle = QEI_GetPosition();
        sprintf(flexString, "Angle: %d", angle);
        OledClear(OLED_COLOR_BLACK);
        OledDrawString(flexString);
        OledUpdate();
        DELAY(TIME);

        if (angle >= 0 && angle <= 4) {
            // yellow
            PWM_SetDutyCycle(PWM_PORTY12, 0);
            PWM_SetDutyCycle(PWM_PORTY10, 0); // green gets scaled
            PWM_SetDutyCycle(PWM_PORTY04, 1000);

        } else if (angle >= 5 && angle <= 8) {
            // lighter yellow
            PWM_SetDutyCycle(PWM_PORTY12, 0);
            PWM_SetDutyCycle(PWM_PORTY10, 200);
            PWM_SetDutyCycle(PWM_PORTY04, 1000);

        } else if (angle >= 9 && angle <= 12) {
            // orange
            PWM_SetDutyCycle(PWM_PORTY12, 0);
            PWM_SetDutyCycle(PWM_PORTY10, 400);
            PWM_SetDutyCycle(PWM_PORTY04, 1000);

        } else if (angle >= 13 && angle <= 16) {
            // lighter orange
            PWM_SetDutyCycle(PWM_PORTY12, 0); 
            PWM_SetDutyCycle(PWM_PORTY10, 600);
            PWM_SetDutyCycle(PWM_PORTY04, 1000);

        } else if (angle >= 17 && angle <= 20) {
            // red
            PWM_SetDutyCycle(PWM_PORTY12, 0);
            PWM_SetDutyCycle(PWM_PORTY10, 800); 
            PWM_SetDutyCycle(PWM_PORTY04, 1000);

        } else if (angle >= 21 && angle <= 24) {
            // lighter red
            PWM_SetDutyCycle(PWM_PORTY12, 0); // red gets scaled
            PWM_SetDutyCycle(PWM_PORTY10, 1000);
            PWM_SetDutyCycle(PWM_PORTY04, 1000);

        } else if (angle >= 25 && angle <= 28) {
            // violet
            PWM_SetDutyCycle(PWM_PORTY12, 200);
            PWM_SetDutyCycle(PWM_PORTY10, 1000);
            PWM_SetDutyCycle(PWM_PORTY04, 1000);

        } else if (angle >= 29 && angle <= 32) {
            // lighter violet
            PWM_SetDutyCycle(PWM_PORTY12, 400);
            PWM_SetDutyCycle(PWM_PORTY10, 1000);
            PWM_SetDutyCycle(PWM_PORTY04, 1000); 

        } else if (angle >= 33 && angle <= 36) {
            // blue
            PWM_SetDutyCycle(PWM_PORTY12, 600);
            PWM_SetDutyCycle(PWM_PORTY10, 1000);
            PWM_SetDutyCycle(PWM_PORTY04, 1000);

        } else if (angle >= 37 && angle <= 40) {
            // lighter blue
            PWM_SetDutyCycle(PWM_PORTY12, 800);
            PWM_SetDutyCycle(PWM_PORTY10, 1000);
            PWM_SetDutyCycle(PWM_PORTY04, 1000);

        } else if (angle >= 41 && angle <= 44) {
            // green
            PWM_SetDutyCycle(PWM_PORTY12, 900);
            PWM_SetDutyCycle(PWM_PORTY10, 1000);
            PWM_SetDutyCycle(PWM_PORTY04, 1000);

        } else if (angle >= 45 && angle <= 48) {
            // lighter green
            PWM_SetDutyCycle(PWM_PORTY12, 400);
            PWM_SetDutyCycle(PWM_PORTY10, 0);
            PWM_SetDutyCycle(PWM_PORTY04, 400);

        } else if (angle >= 49 && angle <= 52) {
            // lighter yellow
            PWM_SetDutyCycle(PWM_PORTY12, 0);
            PWM_SetDutyCycle(PWM_PORTY10, 0);
            PWM_SetDutyCycle(PWM_PORTY04, 600);

        } else if (angle >= 53 && angle <= 56) {
            // orange
            PWM_SetDutyCycle(PWM_PORTY12, 0);
            PWM_SetDutyCycle(PWM_PORTY10, 501);
            PWM_SetDutyCycle(PWM_PORTY04, 1000);

        } else if (angle >= 57 && angle <= 60) {
            // lighter orange
            PWM_SetDutyCycle(PWM_PORTY12, 0);
            PWM_SetDutyCycle(PWM_PORTY10, 700);
            PWM_SetDutyCycle(PWM_PORTY04, 1000);

        } else if (angle >= 61 && angle <= 64) {
            // red
            PWM_SetDutyCycle(PWM_PORTY12, 0);
            PWM_SetDutyCycle(PWM_PORTY10, 0);
            PWM_SetDutyCycle(PWM_PORTY04, 1000);

        } else if (angle >= 65 && angle <= 68) {
            // lighter red
            PWM_SetDutyCycle(PWM_PORTY12, 0);
            PWM_SetDutyCycle(PWM_PORTY10, 400);
            PWM_SetDutyCycle(PWM_PORTY04, 400);

        } else if (angle >= 69 && angle <= 72) {
            // violet
            PWM_SetDutyCycle(PWM_PORTY12, 0);
            PWM_SetDutyCycle(PWM_PORTY10, 1000);
            PWM_SetDutyCycle(PWM_PORTY04, 0);

        } else if (angle >= 73 && angle <= 76) {
            // lighter violet
            PWM_SetDutyCycle(PWM_PORTY12, 0);
            PWM_SetDutyCycle(PWM_PORTY10, 400);
            PWM_SetDutyCycle(PWM_PORTY04, 0);

        } else if (angle >= 77 && angle <= 80) {
            // blue
            PWM_SetDutyCycle(PWM_PORTY12, 1000);
            PWM_SetDutyCycle(PWM_PORTY10, 1000);
            PWM_SetDutyCycle(PWM_PORTY04, 0);

        } else if (angle >= 81 && angle <= 84) {
            // lighter blue
            PWM_SetDutyCycle(PWM_PORTY12, 400);
            PWM_SetDutyCycle(PWM_PORTY10, 400);
            PWM_SetDutyCycle(PWM_PORTY04, 0);

        } else if (angle >= 85 && angle <= 88) {
            // green
            PWM_SetDutyCycle(PWM_PORTY12, 1000);
            PWM_SetDutyCycle(PWM_PORTY10, 0);
            PWM_SetDutyCycle(PWM_PORTY04, 1000);

        } else if (angle >= 89 && angle <= 92) {
            // lighter green
            PWM_SetDutyCycle(PWM_PORTY12, 400);
            PWM_SetDutyCycle(PWM_PORTY10, 0);
            PWM_SetDutyCycle(PWM_PORTY04, 400);

        } else if (angle >= 93 && angle <= 96) {
            // lighter green
            PWM_SetDutyCycle(PWM_PORTY12, 400);
            PWM_SetDutyCycle(PWM_PORTY10, 0);
            PWM_SetDutyCycle(PWM_PORTY04, 600);
        }
    }

    // if nob has not been turned
    // color == yellow
    // plus 45 deg = orange... plus 45 = red
}
#endif