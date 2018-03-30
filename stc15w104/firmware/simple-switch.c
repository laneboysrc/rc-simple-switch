#include "stdint.h"
#include "stdbool.h"

#include "stc15x10x.h"

#define TIMER_RESOLUTION 16  // Timer0 tick every 16us

// The output MOSFET is connected to RSTOUT_LOW (P3.3) on the MCU, which
// needs to be programmed with the ISP tool to be low after reset.
// This way the load stays off when the MCU is starting up.
#define SWITCH_OUT P33
#define SERVO_IN P34

#define TMR_TOO_LOW (600 / TIMER_RESOLUTION)
#define TMR_TOO_HIGH (2400 / TIMER_RESOLUTION)
#define TMR_OFF (1400 / TIMER_RESOLUTION)
#define TMR_ON (1600 / TIMER_RESOLUTION)

static void output_is_off()
{
    SWITCH_OUT = 0;

    while (1) {
        // Wait for servo pulse being low
        while (SERVO_IN);

        // Wait for servo pulse rising edge
        while (!SERVO_IN);

        // Start measuring the servo pulse width
        TL0 = 0;

        while(1) {
            // Wait for servo pulse falling edge
            if (!SERVO_IN) {
                // Pulse longer than 1600us? -> Turn on!
                if (TL0 > TMR_ON) {
                    // Exit this function!
                    return;
                }
                // ... all other pulse lengths: ignore
                break;
            }

            if (TL0 > TMR_TOO_HIGH) {
                // Pulse longer than 2400us? -> Ignore
                break;
            }
        }
    }
}

static void output_is_on()
{
    SWITCH_OUT = 1;

    while (1) {
        // Wait for servo pulse being low
        while (SERVO_IN);

        // Wait for servo pulse rising edge
        while (!SERVO_IN);

        // Start measuring the servo pulse width
        TL0 = 0;

        while(1) {
            // Wait for servo pulse falling edge
            if (!SERVO_IN) {
                // Pulse shorter than 600us? -> Ignore
                if (TL0 < TMR_TOO_LOW) {
                    break;
                }
                // Pulse shorter than 1400us? -> Turn off!
                if (TL0 < TMR_OFF) {
                    // Exit this function!
                    return;
                }
                // ... all other pulse lengths: ignore
                break;
            }

            if (TL0 > TMR_TOO_HIGH) {
                // Pulse longer than 2400us? -> Ignore
                break;
            }
        }
    }
}

//----------------------------------------------------------------------------
void main()
{
    P3M0 = 1 << 3;  // Push-pull output on P3.3
    P3M1 = 0x00;

    // The programmer sets the clock to 6 MHz. We divide that by 8, and then
    // run the timer sysclock/12.
    // 6 MHz / (8 * 12) = 16 us per tick

    PCON2 = 0x03;   // Master clock frequency/8

    TMOD = 0x02;    // Timer0 Mode 2 (8 bit mode)
    AUXR = 0x00;    // The clock source of Timer 0 is SYSclk/12
    TH0 = 0;
    TR0 = 1;        // Enable Timer0

    while (1) {
        output_is_off();
        output_is_on();
    }
}

