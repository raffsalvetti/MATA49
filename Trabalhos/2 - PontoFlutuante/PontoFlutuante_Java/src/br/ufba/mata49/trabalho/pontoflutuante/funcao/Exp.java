package br.ufba.mata49.trabalho.pontoflutuante.funcao;

import br.ufba.mata49.trabalho.pontoflutuante.funcao.base.FuncaoUnaria;
import br.ufba.mata49.trabalho.pontoflutuante.funcao.base.TimeWorks;
import br.ufba.mata49.trabalho.pontoflutuante.funcao.especial.SerieTaylor;

public class Exp extends TimeWorks implements FuncaoUnaria<Double, Double> {

	private SerieTaylor serieTaylor;
	
	public Exp() {
		serieTaylor = new SerieTaylor();
	}
	
	@Override
	public String getName() {
		return "Exp";
	}

	@Override
	public Double operar(Double x) {
		inicio();
//		x = serieTaylor.operar(x, (long) 15);
		x = Math.exp(x);
		fim();
		return x;
	}

}
