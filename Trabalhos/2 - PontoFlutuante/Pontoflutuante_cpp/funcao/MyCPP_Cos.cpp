/*
 * MyCPP_Cos.cpp
 *
 *  Created on: 8 de dez de 2017
 *      Author: raffaello
 */

#include "especial/SerieTaylor.h"
#include "MyCPP_CommonHeader.h"

class MyCPP_Cos : public TimeWorks, public FuncaoUnaria<double, double> {
private:
	SerieTaylor *taylor;

public:
	MyCPP_Cos() : TimeWorks(){
		taylor = new SerieTaylor();
	}
	~MyCPP_Cos(){}

	std::string getName() {
		return "Cos";
	}

	double operarCpp(double x) {
		inicioCpp();
		x = cos(x);
//		x = taylor->operar(x, 100, ComponenteSerie::PAR, true);
		fimCpp();
		return x;
	}

	double operarAsm(double x) {
		inicioAsm();
		x = MyAsm_cos(x);
		fimAsm();
		return x;
	}
};

FuncaoUnaria<double, double> *_cos = new MyCPP_Cos();
