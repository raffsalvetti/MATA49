/*
 * SerieTaylor.cpp
 *
 *  Created on: 8 de dez de 2017
 *      Author: raffaello
 */

#include <iostream>
#include "SerieTaylor.h"

using namespace std;

std::string SerieTaylor::getName() {
	return "Taylor";
}

double SerieTaylor::operar(double x1, unsigned long int x2) {
	return operar(x1, x2, ComponenteSerie::TODOS, false);
}

double SerieTaylor::operar(double x1, unsigned long int x2, ComponenteSerie x3, bool alternada) {
	double taylor = 0;
	unsigned int iter = 0;
	bool sinal = false;
	while(iter < x2) {
		if((x3 == ComponenteSerie::TODOS) ||
				((x3 == ComponenteSerie::PAR) && (iter % 2 == 0)) ||
				((x3 == ComponenteSerie::IMPAR) && (iter % 2 != 0))) {
			sinal = !sinal;
			taylor += ((double)(sinal || !alternada) ? 1 : -1) * (potencia->operar(x1, iter)/fatorial->operarCpp(iter));
		}
		iter++;
	}
	return taylor;
}
