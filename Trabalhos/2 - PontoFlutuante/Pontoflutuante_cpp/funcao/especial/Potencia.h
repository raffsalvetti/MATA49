/*
 * Potencia.h
 *
 *  Created on: 9 de dez de 2017
 *      Author: raffaello
 */

#ifndef FUNCAO_ESPECIAL_POTENCIA_H_
#define FUNCAO_ESPECIAL_POTENCIA_H_

#include "../base/FuncaoBinaria.h"

class Potencia : public FuncaoBinaria<double, double, unsigned long int> {

public:
	Potencia(){}
	~Potencia(){}
	virtual std::string getName();
	virtual double operar(double x1, unsigned long int x2);
};



#endif /* FUNCAO_ESPECIAL_POTENCIA_H_ */
