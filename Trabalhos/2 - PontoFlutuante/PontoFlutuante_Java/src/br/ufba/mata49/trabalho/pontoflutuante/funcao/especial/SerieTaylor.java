package br.ufba.mata49.trabalho.pontoflutuante.funcao.especial;

import br.ufba.mata49.trabalho.pontoflutuante.funcao.base.FuncaoQuaternaria;
import br.ufba.mata49.trabalho.pontoflutuante.funcao.base.ComponenteSerie;

public class SerieTaylor implements FuncaoQuaternaria<Double, Double, Long, ComponenteSerie, Boolean> {

	private Potencia potencia;
	private Fatorial fatorial;
	
	public SerieTaylor() {
		potencia = new Potencia();
		fatorial = new Fatorial();
	}
	
	@Override
	public String getName() {
		return "Taylor";
	}
	
	public Double operar(Double x1, Long x2) {
		return operar(x1, x2, ComponenteSerie.TODOS, false);
	}

	@Override
	public Double operar(Double x1, Long x2, ComponenteSerie x3, Boolean alternada) {
		Double taylor = 0D;
		int iter = 0;
		boolean sinal = false;
		while(iter < x2) {
			if(x3 == ComponenteSerie.TODOS || (x3 == ComponenteSerie.PAR && iter % 2 == 0) || (x3 == ComponenteSerie.IMPAR && iter % 2 != 0))
				taylor += (((sinal=!sinal) || !alternada) ? 1 : -1) * (potencia.operar(x1, (long)iter)/(double)fatorial.operar((long)iter));
			iter++;
		}
		return taylor;
	}
	
}
