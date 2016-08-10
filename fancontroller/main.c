#include <avr/io.h>

int main() {

	TCCR0A |= (2 << COM0A0) | (3 << COM0B0) | (3 << WGM00);
	TCCR0B |= (1 << CS00);

	DDRB |= (1 << PB1) | (1 << PB0);

	OCR0A = 50;
	OCR0B = 50;

	while (1) {

	}

	return 0;
}
