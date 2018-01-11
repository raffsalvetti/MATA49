/*
 * MyCPP_Abs.cpp
 *
 *  Created on: 8 de dez de 2017
 *      Author: raffaello
 */

#include "MyCPP_CommonHeader.h"

class MyCPP_Abs : public TimeWorks, public FuncaoUnaria<double, double> {

public:
	MyCPP_Abs() : TimeWorks() {}
	~MyCPP_Abs(){}

	std::string getName() {
		return "Abs";
	}

	double operarCpp(double x) {
		inicioCpp();
		x = fabs(x);
		fimCpp();
		return x;
	}

	double operarAsm(double x) {
		inicioAsm();
		x = MyAsm_abs(x);
		fimAsm();
		return x;
	}
};

FuncaoUnaria<double, double> *_abs = new MyCPP_Abs();
