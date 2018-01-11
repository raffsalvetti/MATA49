package br.ufba.mata49.trabalho.pontoflutuante.funcao;

import br.ufba.mata49.trabalho.pontoflutuante.funcao.base.FuncaoUnaria;
import br.ufba.mata49.trabalho.pontoflutuante.funcao.base.TimeWorks;

public class Dummy extends TimeWorks implements FuncaoUnaria<Double, Double> {

	@Override
	public String getName() {
		return "Dummy";
	}

	@Override
	public Double operar(Double x) {
		int i = 0;
		inicio();
		while(i < 999) {
			i++;
		}
		fim();
		return (double)i;
	}

}
