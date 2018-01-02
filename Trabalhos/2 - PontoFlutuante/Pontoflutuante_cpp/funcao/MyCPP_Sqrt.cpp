/*
 * MyCPP_Sqrt.cpp
 *
 *  Created on: 8 de dez de 2017
 *      Author: raffaello
 */
 
#include "especial/SerieTaylor.h"
#include "MyCPP_CommonHeader.h"

class MyCPP_Sqrt : public TimeWorks, public FuncaoUnaria<double, double> {
private:
	SerieTaylor *taylor;

public:
	MyCPP_Sqrt() : TimeWorks(){
		taylor = new SerieTaylor();
	}
	~MyCPP_Sqrt(){}

	std::string getName() {
		return "Sqrt";
	}

	double operarCpp(double x) {
		inicioCpp();
//		x = taylor->operar(x, 100, ComponenteSerie::IMPAR, true);
		x = sqrt(x);
		fimCpp();
		return x;
	}

	double operarAsm(double x) {
		inicioAsm();
		x = MyAsm_sqrt(x);
		fimAsm();
		return x;
	}
};

FuncaoUnaria<double, double> *_sqrt = new MyCPP_Sqrt();
