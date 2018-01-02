package br.ufba.mata49.trabalho.pontoflutuante.funcao;

import br.ufba.mata49.trabalho.pontoflutuante.funcao.base.FuncaoUnaria;
import br.ufba.mata49.trabalho.pontoflutuante.funcao.base.TimeWorks;

public class Tan extends TimeWorks implements FuncaoUnaria<Double, Double> {

	private Sin sin;
	private Cos cos;
	
	public Tan() {
		sin = new Sin();
		cos = new Cos();
	}
	
	@Override
	public String getName() {
		return "Tan";
	}

	@Override
	public Double operar(Double x) {
		inicio();
		x = Math.tan(x);
//		x = sin.operar(x) / cos.operar(x);
		fim();
		return x;
	}

}
