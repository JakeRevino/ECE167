#include <stdio.h>
#include <stdlib.h>
#include "BOARD.h"
#include "serial.h"


#ifdef HELLO_WORLD_TEST
int main(void) {
    BOARD_Init();
    printf("Hello World!\n");
    BOARD_End();
    while (1);
}
#endif