package br.ufba.mata49.trabalho.pontoflutuante.funcao;

import br.ufba.mata49.trabalho.pontoflutuante.funcao.base.FuncaoUnaria;
import br.ufba.mata49.trabalho.pontoflutuante.funcao.base.TimeWorks;

public class Sqrt extends TimeWorks implements FuncaoUnaria<Double, Double> {

	@Override
	public String getName() {
		return "Sqrt";
	}

	@Override
	public Double operar(Double x) {
		Double n = x;
		inicio();
		n = Math.sqrt(x);
//		double y = 1D;
//		while(n - y > 0.0000000001F) {
//			n = (n + y)/2;
//			y = x/n;
//		}
		fim();
		return n;
	}

}
