/*
 * MyCPP_Ln.cpp
 *
 *  Created on: 8 de dez de 2017
 *      Author: raffaello
 */

#include "especial/Potencia.h"
#include "MyCPP_CommonHeader.h"

class MyCPP_Ln : public TimeWorks, public FuncaoUnaria<double, double> {

private:
	Potencia *potencia;

public:
	MyCPP_Ln() : TimeWorks(){
		potencia = new Potencia();
	}
	~MyCPP_Ln(){}

	std::string getName() {
		return "Ln";
	}

	double operarCpp(double x) {
		double ln = 0;
		inicioCpp();
		ln = log(x);
		fimCpp();
		return ln;
	}

	double operarAsm(double x) {
		inicioAsm();
		x = MyAsm_ln(x);
		fimAsm();
		return x;
	}
};

FuncaoUnaria<double, double> *_ln = new MyCPP_Ln();
