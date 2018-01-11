/*
 * MyCPP_Sin.cpp
 *
 *  Created on: 8 de dez de 2017
 *      Author: raffaello
 */


#include "especial/SerieTaylor.h"
#include "MyCPP_CommonHeader.h"

class MyCPP_Sin : public TimeWorks, public FuncaoUnaria<double, double> {
private:
	SerieTaylor *taylor;

public:
	MyCPP_Sin() : TimeWorks(){
		taylor = new SerieTaylor();
	}
	~MyCPP_Sin(){}

	std::string getName() {
		return "Sin";
	}

	double operarCpp(double x) {
		inicioCpp();
		//		x = taylor->operar(x, 100, ComponenteSerie::IMPAR, true);
		x = sin(x);
		fimCpp();
		return x;
	}

	double operarAsm(double x) {
		inicioAsm();
		x = MyAsm_sin(x);
		fimAsm();
		return x;
	}

};

FuncaoUnaria<double, double> *_sin = new MyCPP_Sin();
