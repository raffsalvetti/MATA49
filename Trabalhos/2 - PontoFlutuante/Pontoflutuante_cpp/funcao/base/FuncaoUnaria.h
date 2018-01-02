/*
 * FuncaoUnaria.h
 *
 *  Created on: 9 de dez de 2017
 *      Author: raffaello
 */

#ifndef FUNCAO_BASE_FUNCAOUNARIA_H_
#define FUNCAO_BASE_FUNCAOUNARIA_H_

#include "Funcao.h"

template<typename R, typename I> class FuncaoUnaria : public Funcao {
public:
	virtual ~FuncaoUnaria(){}
	virtual R operarCpp(I x) = 0;
	virtual R operarAsm(I x) = 0;
};


#endif /* FUNCAO_BASE_FUNCAOUNARIA_H_ */
