/*
 * TimeWorks.cpp
 *
 *  Created on: 8 de dez de 2017
 *      Author: raffaello
 */

#include "TimeWorks.h"

void TimeWorks::inicioCpp() {
	_inicio_cpp = boost::chrono::high_resolution_clock::now();
}

void TimeWorks::fimCpp() {
	_fim_cpp = boost::chrono::high_resolution_clock::now(); //colocar o tempo
}

boost::chrono::nanoseconds TimeWorks::getExecTimeCpp() {
	return boost::chrono::duration_cast<boost::chrono::nanoseconds>(_fim_cpp - _inicio_cpp);
}

void TimeWorks::inicioAsm() {
	_inicio_asm = boost::chrono::high_resolution_clock::now();
}

void TimeWorks::fimAsm() {
	_fim_asm = boost::chrono::high_resolution_clock::now(); //colocar o tempo
}

boost::chrono::nanoseconds TimeWorks::getExecTimeAsm() {
	return boost::chrono::duration_cast<boost::chrono::nanoseconds>(_fim_asm - _inicio_asm);
}
