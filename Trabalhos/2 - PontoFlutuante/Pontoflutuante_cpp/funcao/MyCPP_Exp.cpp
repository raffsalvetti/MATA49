/*
 * MyCPP_Exp.cpp
 *
 *  Created on: 8 de dez de 2017
 *      Author: raffaello
 */


#include "especial/SerieTaylor.h"
#include "MyCPP_CommonHeader.h"

class MyCPP_Exp : public TimeWorks, public FuncaoUnaria<double, double> {
private:
	SerieTaylor *taylor;

public:
	MyCPP_Exp() : TimeWorks(){
		taylor = new SerieTaylor();
	}
	~MyCPP_Exp(){}

	std::string getName() {
		return "Exp";
	}

	double operarCpp(double x) {
		inicioCpp();
		//		x = taylor->operar(x, 100);
		x = exp(x);
		fimCpp();
		return x;
	}

	double operarAsm(double x) {
		inicioAsm();
		x = MyAsm_exp(x);
		fimAsm();
		return x;
	}

};

FuncaoUnaria<double, double> *_exp = new MyCPP_Exp();
