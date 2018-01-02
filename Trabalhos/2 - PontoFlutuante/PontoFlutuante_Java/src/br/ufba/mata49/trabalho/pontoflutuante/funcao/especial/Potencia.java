package br.ufba.mata49.trabalho.pontoflutuante.funcao.especial;

import br.ufba.mata49.trabalho.pontoflutuante.funcao.base.FuncaoBinaria;

public class Potencia implements FuncaoBinaria<Double, Double, Long> {

	@Override
	public String getName() {
		return "Potencia";
	}

	@Override
	public Double operar(Double x1, Long x2) {
		Double potencia = x1;
		if(x2 == 0) {
			return 1D;
		} else {
			while((x2 - 1) > 0) {
				potencia *= x1;
				x2--;
			}
		}
		return potencia;
	}

}
