/*
 * MyCPP_Tan.cpp
 *
 *  Created on: 8 de dez de 2017
 *      Author: raffaello
 */

#include "especial/SerieTaylor.h"
#include "MyCPP_CommonHeader.h"

class MyCPP_Tan : public TimeWorks, public FuncaoUnaria<double, double> {
private:
	SerieTaylor *taylor;

public:
	MyCPP_Tan() : TimeWorks(){
		taylor = new SerieTaylor();
	}
	~MyCPP_Tan(){}

	std::string getName() {
		return "Tan";
	}

	double operarCpp(double x) {
		inicioCpp();
//		x = taylor->operar(x, 100, ComponenteSerie::IMPAR, true);
		x = tan(x);
		fimCpp();
		return x;
	}

	double operarAsm(double x) {
		inicioAsm();
		x = MyAsm_tan(x);
		fimAsm();
		return x;
	}
};

FuncaoUnaria<double, double> *_tan = new MyCPP_Tan();
