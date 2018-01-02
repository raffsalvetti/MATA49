/*
 * TimeWorks.h
 *
 *  Created on: 9 de dez de 2017
 *      Author: raffaello
 */

#ifndef FUNCAO_BASE_TIMEWORKS_H_
#define FUNCAO_BASE_TIMEWORKS_H_

#include <boost/chrono.hpp>

class TimeWorks {

private:
	boost::chrono::high_resolution_clock::time_point _inicio_cpp;
	boost::chrono::high_resolution_clock::time_point _fim_cpp;
	boost::chrono::high_resolution_clock::time_point _inicio_asm;
	boost::chrono::high_resolution_clock::time_point _fim_asm;

public:
	TimeWorks() {
		_inicio_cpp = {};
		_fim_cpp = {};
		_inicio_asm = {};
		_fim_asm = {};
	}
	~TimeWorks(){}
	void inicioCpp();
	void fimCpp();
	boost::chrono::nanoseconds getExecTimeCpp();

	void inicioAsm();
	void fimAsm();
	boost::chrono::nanoseconds getExecTimeAsm();
};


#endif /* FUNCAO_BASE_TIMEWORKS_H_ */
