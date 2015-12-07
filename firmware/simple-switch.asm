;******************************************************************************
;
;   simple-switch.asm
;
;******************************************************************************
;
;   Author:         Werner Lane
;   E-mail:         laneboysrc@gmail.com
;
;******************************************************************************
    TITLE       RC Simple Switch
    LIST        r=dec
    RADIX       dec

    PROCESSOR   PIC10F200
    #include    <p10f200.inc>
    __CONFIG     _WDTE_OFF & _MCLRE_OFF & _CP_OFF



;******************************************************************************
;* CONSTANT DEFINITIONS
;******************************************************************************
SERVO_IN            equ     0   ; Servo input is GP0
OUTPUT_PIN          equ     2   ; Switch output is GP2

TIMER_RESOLUTION    equ     32  ; Timer runs at Fosc/4 / 32 => 1 tick every 32us

TMR_TOO_LOW         equ     600 / TIMER_RESOLUTION
TMR_TOO_HIGH        equ     2400 / TIMER_RESOLUTION
TMR_OFF             equ     1400 / TIMER_RESOLUTION
TMR_ON              equ     1600 / TIMER_RESOLUTION



;******************************************************************************
;* VARIABLE DEFINITIONS
;******************************************************************************
.data UDATA

pulse_width         res 1



;******************************************************************************
; Reset vector
;******************************************************************************
.code_reset CODE    0x000


;******************************************************************************
; Initialization
;******************************************************************************
Init
    movwf   OSCCAL      ; The last address in the program memory contains
                        ; the factory set OSCCAL value with an movlw
                        ; instruction. We put this value into OSCCAL to get
                        ; a precise clock,
                        ; See data sheet section 9.2.2 INTERNAL 4 MHz OSCILLATOR

    movlw   b'10000100' ; Wakeup on pin change disables, weak pull-ups enabled,
                        ; Timer0 clock source Fosc/4, Prescaler assigned to
                        ; Timer0, Prescaler 1:32 (= 32us per tick @ 4 MHz)
    option

    movlw   b'00000001' ; GPIO 0 input, all others output
    tris    6

    clrf    GPIO        ; Set all ports to low


;**********************************************************************
; Main program
;**********************************************************************
Main_loop

output_is_off
    ; Wait for servo pulse being low
    btfsc   GPIO, SERVO_IN
    goto    $-1

    ; Wait for servo pulse rising edge
    btfss   GPIO, SERVO_IN
    goto    $-1

    ; Start measuring the servo pulse width
    clrf    TMR0

    ; Wait for servo pulse falling edge
off_wait_for_falling
    movlw   TMR_TOO_HIGH
    subwf   TMR0, W
    bc      output_is_off           ; Pulse longer than 2400us? -> Ignore
    btfsc   GPIO, SERVO_IN
    goto    off_wait_for_falling

    movf    TMR0, W
    movwf   pulse_width
    movlw   TMR_TOO_LOW             ; Pulse shorter than 600us? -> Ignore
    subwf   pulse_width, w
    bnc     output_is_off
    movlw   TMR_ON                  ; Pulse longer than 1600us? -> Turn on!
    subwf   pulse_width, w
    bnc     output_is_off

    bsf     GPIO, OUTPUT_PIN



output_is_on
    ; Wait for servo pulse being low
    btfsc   GPIO, SERVO_IN
    goto    $-1

    ; Wait for servo pulse rising edge
    btfss   GPIO, SERVO_IN
    goto    $-1

    ; Start measuring the servo pulse width
    clrf    TMR0

    ; Wait for servo pulse falling edge
on_wait_for_falling
    movlw   TMR_TOO_HIGH
    subwf   TMR0, W
    bc      output_is_on            ; Pulse longer than 2400us? -> Ignore
    btfsc   GPIO, SERVO_IN
    goto    on_wait_for_falling

    movf    TMR0, W
    movwf   pulse_width
    movlw   TMR_TOO_LOW             ; Pulse shorter than 600us? -> Ignore
    subwf   pulse_width, w
    bnc     output_is_on
    movlw   TMR_OFF                 ; Pulse shorter than 1400us? -> Turn off!
    subwf   pulse_width, w
    bc      output_is_on

    bcf     GPIO, OUTPUT_PIN

    goto    Main_loop


;**********************************************************************
    END     ; Directive 'end of program'
