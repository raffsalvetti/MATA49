/*
 * FuncaoBinaria.h
 *
 *  Created on: 9 de dez de 2017
 *      Author: raffaello
 */

#ifndef FUNCAO_BASE_FUNCAOBINARIA_H_
#define FUNCAO_BASE_FUNCAOBINARIA_H_

#include "Funcao.h"

template<typename R, typename I1, typename I2> class FuncaoBinaria : public Funcao {
public:
	virtual ~FuncaoBinaria(){}
	virtual R operar(I1 x1, I2 x2) = 0;
};


#endif /* FUNCAO_BASE_FUNCAOBINARIA_H_ */
