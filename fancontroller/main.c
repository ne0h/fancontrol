#include <avr/io.h>

int main() {

	// Set timer to 8 bit fast pwm mode
	TCCR0A = (2 << COM0A0) | (2 << COM0B0) | (3 << WGM00);
	TCCR0B = (0 << WGM02) | (1 << CS00);

	// Set prescaler to 1
	TCCR1 = (0 << PWM1A) | (0 << COM1A0) | (1 << CS10);

	GTCCR = (1 << PWM1B) | (2 << COM1B0);
	DDRB  |= (1 << PB1) | (1 << PB0);

	OCR0A = 127;
	OCR0B = 255;

	while (1) {

	}

	return 0;
}
