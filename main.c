#include <stdio.h>
#include <stdint.h>
#define SEQUENCE_LEN 100 //Define how many numbers you want generated

extern uint32_t xorwow(uint32_t* state);

int main() {
    //Additional entropy by seeding last argument with current time
    srand(time(0));
    uint32_t state[5] = { 123456787, 362436069, 521288629, 5783321, rand()};
    uint32_t prng = xorwow(state);
    for (int i = 0; i < SEQUENCE_LEN; i++) {
        prng = xorwow(state);
        printf("%u\n", prng);
    }
    return 0;
}
