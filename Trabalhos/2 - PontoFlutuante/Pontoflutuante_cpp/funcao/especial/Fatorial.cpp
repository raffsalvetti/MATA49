/*
 * Fatorial.cpp
 *
 *  Created on: 8 de dez de 2017
 *      Author: raffaello
 */

#include "Fatorial.h"

std::string Fatorial::getName() {
	return "Fat";
}

double Fatorial::operarCpp(unsigned long int x) {
	double fatorial = 1;
	while(x > 0) {
		fatorial *= x;
		x--;
	}
	return fatorial;
}

double Fatorial::operarAsm(unsigned long int x){
	return (double)x;
}
