#include "PING.h"
#include "timers.h"
#include "BOARD.h"
#include "pwm.h"
#include "serial.h"
#include "Ascii.h"
#include "QEI.h"
#include "AD.h"
#include "ToneGeneration.h"
#include <stdio.h>
#include <xc.h>
#include <stdlib.h>

#define DELAY(x)    {int wait; for (wait = 0; wait <= x; wait++) {asm("nop");}}
#define TIME 1500

unsigned int Convert2CM(unsigned int distance);
unsigned int Convert2CM(unsigned int distance) {
    return distance/10;
}

int main(void) {
    BOARD_Init();
    TIMERS_Init();
    PING_Init();
    PWM_Init();
    ToneGeneration_Init();
    
    int distance;
    int time;
    
    while (1) {
        distance = PING_GetDistance();
        time = PING_GetTimeofFlight(); 
        printf("Distance: %d\r\n", distance);
        DELAY(TIME);
        
        ToneGeneration_SetFrequency(distance * 10);
        ToneGeneration_ToneOn();
    }
   
    
    return 0;
}