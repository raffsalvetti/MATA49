/*
 * MATA49_PontoFlutuante_Main.cpp
 *
 *  Created on: 8 de dez de 2017
 *      Author: raffaello
 */

#include <iostream>
#include "funcao/assembly/MyAsmFunctions.h"
#include "funcao/base/FuncaoUnaria.h"
#include "funcao/base/TimeWorks.h"

using namespace std;

extern FuncaoUnaria<double, double> *_dummy;
extern FuncaoUnaria<double, double> *_abs;
extern FuncaoUnaria<double, double> *_exp;
extern FuncaoUnaria<double, double> *_ln;
extern FuncaoUnaria<double, double> *_sqrt;
extern FuncaoUnaria<double, double> *_cos;
extern FuncaoUnaria<double, double> *_sin;
extern FuncaoUnaria<double, double> *_tan;
extern FuncaoUnaria<double, double> *_acos;
extern FuncaoUnaria<double, double> *_asin;
extern FuncaoUnaria<double, double> *_atan;

int main(int argc, char* argv[]) {
	FuncaoUnaria<double, double> *funcoes[] = {
			_dummy,
			_abs,
			_exp,
			_ln,
			_sqrt,
			_cos,
			_sin,
			_tan,
			_acos,
			_asin,
			_atan
	};

	double x = 30;
	if(argc > 1) {
		cout << "parametro de entrada: " << argv[1] << endl;
		x = atof(argv[1]);
	}
	cout << "inicio" << endl;
	for (FuncaoUnaria<double, double> *fu : funcoes) {
		if(fu != NULL) {
			double outCpp = fu->operarCpp(x);
			double outAsm = fu->operarAsm(x);
			TimeWorks *tw = (dynamic_cast<TimeWorks*>(fu));
			cout << fu->getName() << "(" << x << ")" << endl;
			cout << "\tResultado C++: " << outCpp << "; Tempo C++: " << tw->getExecTimeCpp() << endl;
			cout << "\tResultado Asm: " << outAsm << ";Tempo Asm: " << tw->getExecTimeAsm() << endl;
			cout << "\tGanho: " << tw->getExecTimeCpp().count() << " / " << tw->getExecTimeAsm().count() << " = " << (tw->getExecTimeCpp().count() / (tw->getExecTimeAsm().count() == 0 ? 0.00001 : tw->getExecTimeAsm().count())) << endl;
			cout << endl;
		}
	}
	cout << "fim" << endl;
	system("pause");
}
