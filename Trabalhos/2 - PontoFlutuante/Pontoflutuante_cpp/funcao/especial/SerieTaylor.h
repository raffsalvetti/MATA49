/*
 * SerieTaylor.h
 *
 *  Created on: 9 de dez de 2017
 *      Author: raffaello
 */

#ifndef FUNCAO_ESPECIAL_SERIETAYLOR_H_
#define FUNCAO_ESPECIAL_SERIETAYLOR_H_

#include "../base/ComponenteSerie.h"
#include "../base/FuncaoQuaternaria.h"
#include "Potencia.h"
#include "Fatorial.h"

class SerieTaylor : public FuncaoQuaternaria<double, double, unsigned long int, ComponenteSerie, bool> {

private:
	Potencia *potencia;
	Fatorial *fatorial;

public:
	SerieTaylor() {
		potencia = new Potencia();
		fatorial = new Fatorial();
	}
	~SerieTaylor(){}
	std::string getName();
	double operar(double x1, unsigned long int x2);
	double operar(double x1, unsigned long int x2, ComponenteSerie x3, bool alternada);
};


#endif /* FUNCAO_ESPECIAL_SERIETAYLOR_H_ */
