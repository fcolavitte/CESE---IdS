#include "gpio.h"
//#include "config.h"

#ifndef GPIO_COUNT
#define GPIO_COUNT 6
#endif

typedef struct{
    uint8_t port;
    uint8_t pin;
    bool output;
    bool alocated;
    bool inverted;
} gpio_s;

typedef gpio_s* gpio_t;


gpio_t gpioAlocate(void) {
    static struct gpio_s instances [GPIO_COUNT] = {0};
    gpio_t result = NULL;
    for (int indice = 0; indice< GPIO_COUNT; indice++) {
        if (instances [indice].alocated == false) {
            result = &instances [indice];
            result->alocated = true;
            break;
        }
    }
    return result;
}



gpio_t gpioCreate(uint8_t port, uint8_t pin, bool output, bool inverted) {
#ifdef STATIC
    gpio_t self = gpioAlocate();
#else
    gpio_t self = maloc(sizeof(struct gpio_s));
#endif
    if (result) {
        result->port = port;
        result->pin = pin;
        result->output = output;
        result->inverted = inverted;
        /* Lo configuro como entrada */
    }
    return result;
}

bool gpioGetValue(gpio_t output) {
    /* Leo el valor actual */
}

void gpioSetValue(gpio_t output, bool value) {
    if (output->output){
        /* Cambio el estado de la salida */
    }
}
