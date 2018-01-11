package br.ufba.mata49.trabalho.pontoflutuante.funcao;

import br.ufba.mata49.trabalho.pontoflutuante.funcao.base.FuncaoBinaria;
import br.ufba.mata49.trabalho.pontoflutuante.funcao.base.FuncaoUnaria;
import br.ufba.mata49.trabalho.pontoflutuante.funcao.base.TimeWorks;
import br.ufba.mata49.trabalho.pontoflutuante.funcao.especial.Potencia;

public class Atan extends TimeWorks implements FuncaoUnaria<Double, Double>, FuncaoBinaria<Double, Double, Boolean> {

private Potencia potencia;
	
	public Atan() {
		potencia = new Potencia();
	}
	
	@Override
	public String getName() {
		return "Atan";
	}

	@Override
	public Double operar(Double x) {
		return operar(x, false);
	}
	
	@Override
	public Double operar(Double x, Boolean inRad) {
		Double atan = 0D;
		inicio();
		atan = Math.atan(x);
//		if(!inRad)
//			x = x * Math.PI / 180; // convertendo pra rad
//		int iter = 1;
//		boolean inverter = false;
//		while(iter < 20) {
//			if(iter % 2 != 0) {
//				atan += ((inverter=!inverter)?1:-1) * (potencia.operar(x, (long)iter)/(long)iter);
//			}
//			iter++;
//		}
		fim();
		return atan;
	}

}
