/*
 * MyCPP_Asin.cpp
 *
 *  Created on: 8 de dez de 2017
 *      Author: raffaello
 */

#include "MyCPP_CommonHeader.h"

class MyCPP_Asin : public TimeWorks, public FuncaoUnaria<double, double> {

public:
	MyCPP_Asin() : TimeWorks(){}
	~MyCPP_Asin(){}

	std::string getName() {
		return "Asin";
	}

	double operarCpp(double x) {
		inicioCpp();
		x = asin(x);
		fimCpp();
		return x;
	}

	double operarAsm(double x) {
		inicioAsm();
		x = MyAsm_asin(x);
		fimAsm();
		return x;
	}
};

FuncaoUnaria<double, double> *_asin = new MyCPP_Asin();
