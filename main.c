
/*
 * Name: main.c
 * Project: macro_keyboard
 * Author: Paul Bersee
 * Creation Date: 2010-10-04
 * License: GNU GPL v2
 */

/*NOTE
 * This file is a modified version of main.c in HIDKeys. * 
 * Though though a heavily modified version, the following notes need to be
 * added to abide by the GNU GPL v2 licence
 * 
 * https://www.obdev.at/products/vusb/hidkeys.html
 * Copyright: (c) 2006 by OBJECTIVE DEVELOPMENT Software GmbH
 */

#define F_CPU 16000000L

#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/pgmspace.h>
#include <avr/wdt.h>

#include <stdint.h>
#include <stdbool.h>

#include <util/delay.h>

#include "usbdrv/usbdrv.h"
#include "usbdrv/oddebug.h"

#define NUM_KEYS 18
#define NUM_KEY_ROW 3
#define NUM_KEY_COLL 6

#if (NUM_KEY_ROW * NUM_KEY_COLL != NUM_KEYS)
#error *** Mismatch in number of rows, collumns and total number of keys ***
#endif

#define PIN(x) (0b1 << x)

#if (NUM_KEY_ROW > 3)
    /*
     * The READ_PINS define only supports upto 3 pins at this time.
     * This limitation came forward because no more were required for the 
     * Project. More can be supported, but changes to hardwareInit and READ_PINS
     * needs to be made.
     */
    #error *** Only 3 row pins are supported at this time ***
#else
    #define READ_PINS()  ((PINB & (PIN(PINB4) | PIN(PINB3) | PIN(PINB2))) >> 2)
#endif

static void hardwareInit(void);
static void usb_setup(void);

static void clear_output(void);
static uint8_t keyPressed(void);


/* pin assignments.
 * Numnbers 04-12 match arduino pinout standard
 * PBx & PDx match atmel 328p pinout naming
 * 
 * INPUTS:
 * 12 -> pb4
 * 11 -> pb3
 * 10 -> pb2

 * OUTPUTS:
 * 09 -> pb1
 * 08 -> pb0
 * 07 -> pd7
 * 06 -> pd6
 * 05 -> pd5
 * 04 -> pd4

 * USB:
 * PD0	USB-
 * PD1	debug tx
 * PD2	USB+ (int0)
*/

static void hardwareInit(void)
/*
 * Properly configures the pin on the microcontroller for communication.
 * Doesn't initialize USB, this is done in the main function
*/
{
    //set PB0 and PB1 to output
    DDRB |=  (PIN(DDB0) | PIN(DDB1));
    //set pb4-3-2 to input
    DDRB &= ~(PIN(DDB4) | PIN(DDB3) | PIN(DDB2));
            
    //set pd7-6-5-4 as output
    DDRD |= (PIN(DDD7) | PIN(DDD6) | PIN(DDD5) | PIN(DDD4));
    
    //disable pullup resistor for pb4-3-2
    PORTB &= ~(PIN(PORTB4) | PIN(PORTB3) | PIN(PORTB2));
    
    //set output for pd7-6-5-4 and pb0-1 to low, don't effectd other pins
    clear_output();
}

static void usb_setup(void)
{
    uint8_t i;
    
    odDebugInit();
	usbInit();
    usbDeviceDisconnect();  /* enforce re-enumeration, do this while interrupts are disabled! */
    i = 0;
    while(--i){             /* fake USB disconnect for > 250 ms */
        wdt_reset();
        _delay_ms(1);
    }
    usbDeviceConnect();

	sei();
}

static void clear_output(void)
//sets the output pins for the keyboard to low
{
    PORTB &= ~(PIN(PORTB0) | PIN(PORTB1));
    PORTD &= ~(PIN(PORTD7) | PIN(PORTD6) | PIN(PORTD5) | PIN(PORTD4));
}

static void set_pin_high(uint8_t pin)
{
    #if (NUM_KEY_COLL > 6)
    //set_pin_high can currently only handle 6 different pins.
    //if more are used, undefined behaviour might occor
    //configure more pins and modify this function approriately for more collums
    #error *** no more than 6 collumn pins are supported at this time. ***
    #endif
    
    //convert 0b00 to 0b01 and 0b01 to 0b10, don't effect other pins
    PORTB |= (0b1 << pin) & 0b11;
    
    //convert key 2 to 6 to correct pin on PORTD, don't effect other pins
    PORTD |= (0b1 << (4+(pin-2))) & 0xf0; //0b11110000
}

/* The following function returns an index for the first key pressed. It
 * returns 0 if no key is pressed.
 */
static uint8_t keyPressed(void)
{
    uint8_t row, coll, input; //x and y rows of the macro keyboard
    
    for (coll=0; coll<NUM_KEY_COLL; coll++) {
        clear_output();
        set_pin_high(coll);
        
        //wait a couple of instructions.
        //won't read pins connected to PORTD without this wait.
        for (uint8_t i=0; i<50; i++);
        
        input = READ_PINS();
        
        //quick check to see if any of the pins are activated
        if (input != 0){            

            for (row=0; row<NUM_KEY_ROW; row++) {                
                //go through pins, return first one that is high
                if (input & (0b1 << row)){
                    //if high pin is found, return corrisponding ID
                    return (coll*NUM_KEY_ROW)+row+1;
                } 
            }
        }
    }
    //if no pressed keys have been found 
    return 0;   
}

/* ------------------------------------------------------------------------- */
/* ----------------------------- USB interface ----------------------------- */
/* ------------------------------------------------------------------------- */

/*
 * The keys on the keyboard are numbered as followed, as a result of the way
 * the keyPressed function has been implemented.
 *  |----|----|----|----|----|----|
 *  | 7  | 10 | 13 | 16 | 1  | 4  |
 *  |----|----|----|----|----|----|
 *  | 8  | 11 | 14 | 17 | 2  | 5  |
 *  |----|----|----|----|----|----|
 *  | 9  | 12 | 15 | 18 | 3  | 5  |   
 *  |----|----|----|----|----|----|
 * 
 * However, this doesn't make much sense and makes programming on the host side
 * more complicated. So an additional translation step is added to line the key
 * ids up nicely with the keys on the keyboard, as shown below
 * 
 *  |----|----|----|----|----|----|
 *  | 1  | 2  | 3  | 4  | 5  | 6  |
 *  |----|----|----|----|----|----|
 *  | 7  | 8  | 9  | 10 | 11 | 12 |
 *  |----|----|----|----|----|----|
 *  | 13 | 14 | 15 | 16 | 17 | 18 |   
 *  |----|----|----|----|----|----|
 * 
 * For this, the following lookup table has been created. The key ID is entered,
 * and the lookup table matches it to the correct key ID
*/  
static const uint8_t keyMap[NUM_KEYS+1] PROGMEM = {
    /*maps all keys of the keyboard to an ID that lines op logically with
     the keyboard layout
     */
     0, /*0 for when no keys are pressed*/
     5,  11, 17,  6, 12, 18,
     1,  7,  13,  2,  8, 14,
     3,  9,  15,  4, 10, 16
};
#if (NUM_KEYS > 18)
/*
 * keyMap in its current form only supports 18 unique keys. It can be easily
 * extended by increasing the NUM_KEYS constant and adding more keys to the
 * keyMap array.
 */
#error *** only 18 pins supported by the lookup table ***
#endif

#define translate_key(key) pgm_read_byte(keyMap+key)

uchar	usbFunctionSetup(uchar data[8])
{
    /*
     * Returning data is handled by the main loop, so this function is not
     * needed. However, the code doesn't compile without this function, so it's 
     * just here, being all empty
     */
  return 0;
}

/* ------------------------------------------------------------------------- */



int	main(void)
{
    uint8_t key, prevKey = 0, translated_key;
    bool keyChanged = false;

	wdt_enable(WDTO_2S);
    hardwareInit();
    usb_setup();
    
    while(true){
		/*called every loop to keep chip running properly*/
        wdt_reset();
        usbPoll();
        
        /*
         * rest of the main loop is a debounce program and the needed calls to 
         * make the connection over the interrupt endpoint working
         */
        
        key = keyPressed();
        if(prevKey != key){
            keyChanged = true;
            prevKey = key;
        }
        
        _delay_ms(22); //delay based on HIDKey project. Importance unknown.
        
        //If button isn't bouncing and usb is ready
        if(keyChanged && keyPressed() == prevKey && usbInterruptIsReady()){
            keyChanged = false;
            
            /* use last key and not current key status in order to avoid lost
               changes in key status. */
            translated_key = translate_key(prevKey);
            usbSetInterrupt(&translated_key, sizeof(translated_key));
        }
	}
	return 0;
}

/* ------------------------------------------------------------------------- */
