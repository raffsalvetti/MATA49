/*
 * FuncaoQuaternaria.h
 *
 *  Created on: 9 de dez de 2017
 *      Author: raffaello
 */

#ifndef FUNCAO_BASE_FUNCAOQUATERNARIA_H_
#define FUNCAO_BASE_FUNCAOQUATERNARIA_H_

#include "Funcao.h"

template<typename R, typename I1, typename I2, typename I3, typename I4> class FuncaoQuaternaria : public Funcao {
public:
	virtual ~FuncaoQuaternaria(){}
	virtual R operar(I1 x1, I2 x2, I3 x3, I4 x4) = 0;
};


#endif /* FUNCAO_BASE_FUNCAOQUATERNARIA_H_ */
