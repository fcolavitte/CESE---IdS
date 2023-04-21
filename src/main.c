#include <stdbool.h>
#include "gpio.h"


int main(void){
    gpio_t led_rojo = gpioCreate(1, 6, true, false);
    gpio_t tecla = gpioCreate(1, 7, false, false);
    while (true) {
        if (gpioGetValue(tecla)) {
            gpioSetOutput(led_rojo, true);
        } else {
            gpioSetOutput(led_rojo, false);
        }
    }
    return 0;
}