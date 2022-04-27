#include "QEI.h"
#include "BOARD.h"
#include <xc.h>
#include <stdio.h>

//#define portA PORTDbits.RD6 // pin 36
//#define portB PORTDbits.RD7 // pin 37

static int currentQEIcount = 0;
static int portA = 0;
static int portB = 0;
static int prevA = 0;
static int prevB = 0;
static int state = 0b00;

void Rollover() { // this function keeps the count between 0 and 360 degrees
    if (currentQEIcount == 97) {
        currentQEIcount = 0;
    }
    if (currentQEIcount == -1) {
        currentQEIcount = 96;
    }
}

void StateMachine(int A, int B); // function prototype to determine rising or falling

/* This state machine implements grey encoding for each state (portA and portB)
 * There are 4 states (0-3) and since we are using grey-encoding, only 2 possible
 * changes can occur in each state.
 * */
void StateMachine(int A, int B) {
    switch (state) {
        case 0b00:
            if ((A == 1) && (B == 0)) {
                state = 0b10;
                currentQEIcount += 1;
                Rollover();
                // printf("Count: %d\n", currentQEIcount);
            }
            if ((A == 0) && (B == 1)) {
                state = 0b01;
                currentQEIcount -= 1;
                Rollover();
                //  printf("Count: %d\n", currentQEIcount);
            }
            break;
        case 0b10:
            if ((A == 1) && (B == 1)) {
                state = 0b11;
                currentQEIcount += 1;
                Rollover();
                //   printf("Count: %d\n", currentQEIcount);
            }
            if ((A == 0) & (B == 0)) {
                state = 0b00;
                currentQEIcount -= 1;
                Rollover();
                //  printf("Count: %d\n", currentQEIcount);
            }
            break;
        case 0b11:
            if ((A == 0) && (B == 1)) {
                state = 0b01;
                currentQEIcount += 1;
                Rollover();
                //  printf("Count: %d\n", currentQEIcount);
            }
            if ((A = 1) && (B == 0)) {
                state = 0b10;
                currentQEIcount -= 1;
                Rollover();
                //  printf("Count: %d\n", currentQEIcount);
            }
            break;
        case 0b01:
            if ((A == 0) && (B == 0)) {
                state = 0b00;
                currentQEIcount += 1;
                Rollover();
                //  printf("Count: %d\n", currentQEIcount);
            }
            if ((A == 1) && (B == 1)) {
                state = 0b11;
                currentQEIcount -= 1;
                Rollover();
                //  printf("Count: %d\n", currentQEIcount);
            }
            break;
    }
}

/**
 * @function QEI_Init(void)
 * @param none
 * @brief  Enables the Change Notify peripheral and sets up the interrupt, anything
 *         else that needs to be done to initialize the module. 
 * @return SUCCESS or ERROR (as defined in BOARD.h)
 */
char QEI_Init(void) {
    // INIT Change notify
    CNCONbits.ON = 1; // Change Notify On
    CNENbits.CNEN15 = 1; //enable one phase
    CNENbits.CNEN16 = 1; //enable other phase
    int temp = PORTD; // this is intentional to ensure a interrupt occur immediately upon enabling
    IFS1bits.CNIF = 0; // clear interrupt flag
    IPC6bits.CNIP = 1; //set priority
    IPC6bits.CNIS = 3; // and sub priority
    IEC1bits.CNIE = 1; // enable change notify

    // the rest of the function goes here
    return SUCCESS;
}

/**
 * @function QEI_GetPosition(void) 
 * @param none
 * @brief This function returns the current count of the Quadrature Encoder in ticks.      
 */
int QEI_GetPosition(void) {
    return currentQEIcount;
}

/**
 * @Function QEI_ResetPosition(void) 
 * @param  none
 * @return none
 * @brief  Resets the encoder such that it starts counting from 0.
 */
void QEI_ResetPosition() {
    currentQEIcount = 0; // reset the count
    state = 0b00; // reset the state
}

//int main(void) {
//    BOARD_Init();
//    QEI_Init();
//
//    while (1) {
//       // int encoderPos = QEI_GetPosition();
//      //  printf("Encoder Position: %d\r\n", encoderPos);
//    }
//
//    return 0;
//}

void __ISR(_CHANGE_NOTICE_VECTOR) ChangeNotice_Handler(void) {
    static char readPort = 0;
    readPort = PORTD; // this read is required to make the interrupt work
    IFS1bits.CNIF = 0;
    //anything else that needs to happen goes here

    // read A and B
    portA = PORTDbits.RD6; // pin 36
    portB = PORTDbits.RD7; // pin 37 
    if ((portA != prevA) || portB != prevB) { // if different from prev
        StateMachine(portA, portB); // run SM
        prevA = portA; // set A and B to prev
        prevB = portB;
    }
}