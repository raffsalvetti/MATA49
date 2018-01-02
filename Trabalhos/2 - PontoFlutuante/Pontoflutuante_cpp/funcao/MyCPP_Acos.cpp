/*
 * MyCPP_Acos.cpp
 *
 *  Created on: 8 de dez de 2017
 *      Author: raffaello
 */

#include "MyCPP_CommonHeader.h"

class MyCPP_Acos : public TimeWorks, public FuncaoUnaria<double, double> {

public:
	MyCPP_Acos() : TimeWorks(){}
	~MyCPP_Acos(){}

	std::string getName() {
		return "Acos";
	}

	double operarCpp(double x) {
		inicioCpp();
		x = acos(x);
		fimCpp();
		return x;
	}

	double operarAsm(double x) {
		inicioAsm();
		x = MyAsm_acos(x);
		fimAsm();
		return x;
	}
};

FuncaoUnaria<double, double> *_acos = new MyCPP_Acos();
