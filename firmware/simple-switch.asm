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

    ; PROCESSOR   PIC10F200
    ; #include    <p10f200.inc>

    PROCESSOR   PIC10LF322
    #include    <p10lf322.inc>

    __CONFIG     _WDTE_OFF & _MCLRE_OFF & _CP_OFF

SERVO_IN            equ 0
OUTPUT_PIN          equ 1

TIMER_RESOLUTION    equ 32

TMR_TOO_LOW         equ     600 / TIMER_RESOLUTION
TMR_TOO_HIGH        equ     2400 / TIMER_RESOLUTION
TMR_OFF             equ     1400 / TIMER_RESOLUTION
TMR_ON              equ     1600 / TIMER_RESOLUTION


GPIO                equ PORTA



;******************************************************************************
;* VARIABLE DEFINITIONS
;******************************************************************************
.data UDATA

pulse_width         res 1



;******************************************************************************
; Reset vector
;******************************************************************************
.code_reset CODE    0x000
;    goto    Init


;******************************************************************************
; Relocatable code section
;******************************************************************************
.code_main CODE

;******************************************************************************
; Initialization
;******************************************************************************
Init
    movlw   10000100b   ; Wakeup on pin change disables, weak pull-ups enabled,
                        ; Timer0 clock source Fosc/4, Prescaler assigned to
                        ; Timer0, Prescaler 1:32 (= 32us per tick @ 4 MHz)
    ;option
    movwf   OPTION_REG

    movlw   00000001b   ; GPIO 0 input, all others output
    ;tris    6
    movlw   TRISA



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

    clrf    TMR0

    ; Wait for servo pulse falling edge
off_wait_for_falling
    movlw   TMR_TOO_HIGH
    subwf   TMR0, W
    bc      output_is_off
    btfsc   GPIO, SERVO_IN
    goto    off_wait_for_falling

    movf    TMR0, W
    movwf   pulse_width
    movlw   TMR_TOO_LOW
    subwf   pulse_width, w
    bnc     output_is_off
    movlw   TMR_ON
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

    clrf    TMR0

    ; Wait for servo pulse falling edge
on_wait_for_falling
    movlw   TMR_TOO_HIGH
    subwf   TMR0, W
    bc      output_is_on
    btfsc   GPIO, SERVO_IN
    goto    on_wait_for_falling

    movf    TMR0, W
    movwf   pulse_width
    movlw   TMR_TOO_LOW
    subwf   pulse_width, w
    bnc     output_is_on
    movlw   TMR_OFF
    subwf   pulse_width, w
    bc      output_is_on

    bcf     GPIO, OUTPUT_PIN

    goto    Main_loop



    END     ; Directive 'end of program'
