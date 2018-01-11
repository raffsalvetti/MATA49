package br.ufba.mata49.trabalho.pontoflutuante.funcao;

import br.ufba.mata49.trabalho.pontoflutuante.funcao.base.FuncaoUnaria;
import br.ufba.mata49.trabalho.pontoflutuante.funcao.base.TimeWorks;

public class Acos extends TimeWorks implements FuncaoUnaria<Double, Double> {

	private Asin asin;
	
	public Acos() {
		asin = new Asin();
	}
	
	@Override
	public String getName() {
		return "Acos";
	}

	@Override
	public Double operar(Double x) {
		inicio();
		x = Math.acos(x);
//		x = (Math.PI / 2) - asin.operar(x);
		fim();
		return x; 
	}

}
