package br.ufba.mata49.trabalho.pontoflutuante.funcao;

import br.ufba.mata49.trabalho.pontoflutuante.funcao.base.FuncaoUnaria;
import br.ufba.mata49.trabalho.pontoflutuante.funcao.base.ComponenteSerie;
import br.ufba.mata49.trabalho.pontoflutuante.funcao.base.TimeWorks;
import br.ufba.mata49.trabalho.pontoflutuante.funcao.especial.SerieTaylor;

public class Sin extends TimeWorks implements FuncaoUnaria<Double, Double>{

	private SerieTaylor taylor;
	
	public Sin() {
		taylor = new SerieTaylor();
	}
	
	@Override
	public String getName() {
		return "Sin";
	}

	@Override
	public Double operar(Double x) {
		inicio();
		x = Math.sin(x);
//		x = taylor.operar(x, (long) 20, ComponenteSerie.IMPAR, true);
		fim();
		return x;
	}

}
