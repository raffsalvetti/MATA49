package br.ufba.mata49.trabalho.pontoflutuante.funcao;

import br.ufba.mata49.trabalho.pontoflutuante.funcao.base.FuncaoBinaria;
import br.ufba.mata49.trabalho.pontoflutuante.funcao.base.FuncaoUnaria;
import br.ufba.mata49.trabalho.pontoflutuante.funcao.base.TimeWorks;
import br.ufba.mata49.trabalho.pontoflutuante.funcao.especial.Potencia;

public class Asin extends TimeWorks implements FuncaoUnaria<Double, Double>, FuncaoBinaria<Double, Double, Boolean>{

	private Potencia potencia;
	
	public Asin() {
		potencia = new Potencia();
	}
	
	@Override
	public String getName() {
		return "Asin";
	}

	@Override
	public Double operar(Double x) {
		return operar(x, false);
	}
	
	@Override
	public Double operar(Double x, Boolean inRad) {
		Double asin = 0D;
		inicio();
		asin = Math.asin(x);
//		if(!inRad)
//			x = x * Math.PI / 180; // convertendo pra rad
//		int iter = 1;
//		Double componentePar = 1D;
//		while(iter < 20) {
//			if(iter % 2 == 0) {
//				componentePar *= (double)((iter - 1D) / iter);
//			} else {
//				asin += componentePar * (potencia.operar(x, (long)iter)/(long)iter);
//			}
//			iter++;
//		}
		fim();
		return asin;
	}

}
