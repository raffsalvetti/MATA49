package br.ufba.mata49.trabalho.pontoflutuante.funcao;

import br.ufba.mata49.trabalho.pontoflutuante.funcao.base.FuncaoUnaria;
import br.ufba.mata49.trabalho.pontoflutuante.funcao.base.TimeWorks;
import br.ufba.mata49.trabalho.pontoflutuante.funcao.especial.Potencia;

public class Ln extends TimeWorks implements FuncaoUnaria<Double, Double> {

	private Potencia potencia;
	
	public Ln() {
		potencia = new Potencia();
	}
	
	@Override
	public String getName() {
		return "Ln";
	}

	@Override
	public Double operar(Double x) {
		Double ln = 0D;
		inicio();
		ln = Math.log(x);
//		if(x <= 0 || x > 2) {
//			fim();
//			return -666D;
//		}
//		int iter = 1;
//		boolean inverter = false;
//		while(iter < 9999) {
//			ln += ((inverter=!inverter)?1:-1) * (potencia.operar(x - 1, (long) iter) / (double)iter);
//			iter++;
//		}
		fim();
		return ln;
	}

}
