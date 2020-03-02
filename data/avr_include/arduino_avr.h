#include <avr/io.h>
#include <util/delay.h>
#include <stdbool.h>
#include <stdint.h>

#define PIN(action, pin) \
    do {\
        set_to_output_mode(pin);\
        pin_##action(pin);\
    }while (0)

static inline void pin_high(uint8_t pin_num)
{
	switch (pin_num) {
		case 0:
			PORTD |= _BV(PD0);
			break;
		case 1:
			PORTD |= _BV(PD1);
			break;
		case 2:
			PORTD |= _BV(PD2);
			break;
		case 3:
			PORTD |= _BV(PD3);
			break;
		case 4:
			PORTD |= _BV(PD4);
			break;
		case 5:
			PORTD |= _BV(PD5);
			break;
		case 6:
			PORTD |= _BV(PD6);
			break;
		case 7:
			PORTD |= _BV(PD7);
			break;
		case 8:
			PORTB |= _BV(PB0);
			break;
		case 9:
			PORTB |= _BV(PB1);
			break;
		case 10:
			PORTB |= _BV(PB2);
			break;
		case 11:
			PORTB |= _BV(PB3);
			break;
		case 12:
			PORTB |= _BV(PB4);
			break;
		case 13:
			PORTB |= _BV(PB5);
			break;
	}
}

static inline void pin_low(uint8_t pin_num)
{
	switch (pin_num) {
		case 0:
			PORTD &= ~_BV(PD0);
			break;
		case 1:
			PORTD &= ~_BV(PD1);
			break;
		case 2:
			PORTD &= ~_BV(PD2);
			break;
		case 3:
			PORTD &= ~_BV(PD3);
			break;
		case 4:
			PORTD &= ~_BV(PD4);
			break;
		case 5:
			PORTD &= ~_BV(PD5);
			break;
		case 6:
			PORTD &= ~_BV(PD6);
			break;
		case 7:
			PORTD &= ~_BV(PD7);
			break;
		case 8:
			PORTB &= ~_BV(PB0);
			break;
		case 9:
			PORTB &= ~_BV(PB1);
			break;
		case 10:
			PORTB &= ~_BV(PB2);
			break;
		case 11:
			PORTB &= ~_BV(PB3);
			break;
		case 12:
			PORTB &= ~_BV(PB4);
			break;
		case 13:
			PORTB &= ~_BV(PB5);
			break;
	}
}

static inline void pin_toggle(uint8_t pin_num)
{
	switch (pin_num) {
		case 0:
			PORTD ^= _BV(PD0);
			break;
		case 1:
			PORTD ^= _BV(PD1);
			break;
		case 2:
			PORTD ^= _BV(PD2);
			break;
		case 3:
			PORTD ^= _BV(PD3);
			break;
		case 4:
			PORTD ^= _BV(PD4);
			break;
		case 5:
			PORTD ^= _BV(PD5);
			break;
		case 6:
			PORTD ^= _BV(PD6);
			break;
		case 7:
			PORTD ^= _BV(PD7);
			break;
		case 8:
			PORTB ^= _BV(PB0);
			break;
		case 9:
			PORTB ^= _BV(PB1);
			break;
		case 10:
			PORTB ^= _BV(PB2);
			break;
		case 11:
			PORTB ^= _BV(PB3);
			break;
		case 12:
			PORTB ^= _BV(PB4);
			break;
		case 13:
			PORTB ^= _BV(PB5);
			break;
	}
}

static inline void set_to_output_mode(uint8_t pin_num)
{
	switch (pin_num) {
		case 0:
			DDRD |= _BV(PD0);
			break;
		case 1:
			DDRD |= _BV(PD1);
			break;
		case 2:
			DDRD |= _BV(PD2);
			break;
		case 3:
			DDRD |= _BV(PD3);
			break;
		case 4:
			DDRD |= _BV(PD4);
			break;
		case 5:
			DDRD |= _BV(PD5);
			break;
		case 6:
			DDRD |= _BV(PD6);
			break;
		case 7:
			DDRD |= _BV(PD7);
			break;
		case 8:
			DDRB |= _BV(PB0);
			break;
		case 9:
			DDRB |= _BV(PB1);
			break;
		case 10:
			DDRB |= _BV(PB2);
			break;
		case 11:
			DDRB |= _BV(PB3);
			break;
		case 12:
			DDRB |= _BV(PB4);
			break;
		case 13:
			DDRB |= _BV(PB5);
			break;
	}
}

static inline uint8_t get_mask(uint8_t start, uint8_t end)
{
	return (((1 << end) - 1) << start);
}
