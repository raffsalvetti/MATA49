/*
 * Dummy.cpp
 *
 *  Created on: 9 de dez de 2017
 *      Author: raffaello
 */

#include "MyCPP_CommonHeader.h"

using namespace std;

class MyCPP_Dummy : public TimeWorks, public FuncaoUnaria<double, double> {

public:
	MyCPP_Dummy() : TimeWorks() {}
	~MyCPP_Dummy(){}

	std::string getName() {
		return "Dummy";
	}

	double operarCpp(double x) {
		int i = 0;
		inicioCpp();
		while(i < 999) {
			i++;
		}
		fimCpp();
		return i;
	}

	double operarAsm(double x) {
		int i = 0;
		inicioAsm();
		while(i < 999) {
			i++;
		}
		fimAsm();
		return i;
	}
};

FuncaoUnaria<double, double> *_dummy = new MyCPP_Dummy();
