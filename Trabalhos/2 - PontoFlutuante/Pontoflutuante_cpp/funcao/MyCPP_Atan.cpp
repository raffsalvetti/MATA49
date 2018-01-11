/*
 * MyCPP_Atan.cpp
 *
 *  Created on: 8 de dez de 2017
 *      Author: raffaello
 */

#include "MyCPP_CommonHeader.h"

class MyCPP_Atan : public TimeWorks, public FuncaoUnaria<double, double> {

public:
	MyCPP_Atan() : TimeWorks(){}
	~MyCPP_Atan(){}

	std::string getName() {
		return "Atan";
	}

	double operarCpp(double x) {
		inicioCpp();
		x = atan(x);
		fimCpp();
		return x;
	}

	double operarAsm(double x) {
		inicioAsm();
		x = MyAsm_atan(x);
		fimAsm();
		return x;
	}
};

FuncaoUnaria<double, double> *_atan = new MyCPP_Atan();
