/*
 * Fatorial.h
 *
 *  Created on: 9 de dez de 2017
 *      Author: raffaello
 */

#ifndef FUNCAO_ESPECIAL_FATORIAL_H_
#define FUNCAO_ESPECIAL_FATORIAL_H_

#include "../base/FuncaoUnaria.h"

class Fatorial : public FuncaoUnaria<double, unsigned long int> {
public:
	Fatorial(){}
	~Fatorial(){}

	std::string getName();
	double operarCpp(unsigned long int x);
	double operarAsm(unsigned long int x);
};


#endif /* FUNCAO_ESPECIAL_FATORIAL_H_ */
