/*
 * Potencia.cpp
 *
 *  Created on: 8 de dez de 2017
 *      Author: raffaello
 */

#include "Potencia.h"

std::string Potencia::getName() {
	return "Pot";
}

double Potencia::operar(double x1, unsigned long int x2) {
	double potencia = x1;
	if(x2 == 0) {
		return 1;
	} else {
		while((x2 - 1) > 0) {
			potencia *= x1;
			x2--;
		}
	}
	return potencia;
}
