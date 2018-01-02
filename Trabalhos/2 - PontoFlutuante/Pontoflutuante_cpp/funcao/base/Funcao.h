/*
 * Funcao.h
 *
 *  Created on: 9 de dez de 2017
 *      Author: raffaello
 */

#ifndef FUNCAO_BASE_FUNCAO_H_
#define FUNCAO_BASE_FUNCAO_H_

#include <string>

class Funcao {

public:
	virtual ~Funcao(){}
	virtual std::string getName() = 0;
};


#endif /* FUNCAO_BASE_FUNCAO_H_ */
