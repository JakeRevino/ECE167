#include "QEI.h"
#include "pwm.h"
#include "Oled.h"
#include <stdio.h>

#define DELAY(x)    {int wait; for (wait = 0; wait <= x; wait++) {asm("nop");}}
#define TIME 200000
#define SCALER 10

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



        // printf("Angle: %d\r\n", angle);
        if (angle >= 0 && angle <= 50) {
            PWM_SetDutyCycle(PWM_PORTY12, angle);
            PWM_SetDutyCycle(PWM_PORTY10, angle + 1000);
            PWM_SetDutyCycle(PWM_PORTY04, angle + 1);
        } else {
            PWM_SetDutyCycle(PWM_PORTY12, 1);
            PWM_SetDutyCycle(PWM_PORTY10, 1000);
            PWM_SetDutyCycle(PWM_PORTY04, 500);
        }
    }

    // if nob has not been turned
    // color == yellow
    // plus 45 deg = orange... plus 45 = red
}