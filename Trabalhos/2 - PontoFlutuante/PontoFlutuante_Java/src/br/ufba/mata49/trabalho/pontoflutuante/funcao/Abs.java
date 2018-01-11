package br.ufba.mata49.trabalho.pontoflutuante.funcao;

import br.ufba.mata49.trabalho.pontoflutuante.funcao.base.FuncaoUnaria;
import br.ufba.mata49.trabalho.pontoflutuante.funcao.base.TimeWorks;

public class Abs extends TimeWorks implements FuncaoUnaria<Double, Double> {
	
	@Override
	public String getName() {
		return "Abs";
	}
	
	@Override
	public Double operar(Double x) {
		inicio();
		x = Math.abs(x);
//		if(x < 0)
//			x *= -1;
//		Double y = (double) (Double.doubleToLongBits(x) >> 31);
//		x = ((double)(Double.doubleToLongBits(x) ^ Double.doubleToLongBits(y))) - y;
		fim();
		return x;
	}

}
