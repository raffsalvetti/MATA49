package br.ufba.mata49.trabalho.pontoflutuante.funcao.especial;

import br.ufba.mata49.trabalho.pontoflutuante.funcao.base.FuncaoUnaria;

public class Fatorial implements FuncaoUnaria<Long, Long> {

	@Override
	public String getName() {
		return "Fat";
	}

	@Override
	public Long operar(Long x) {
		 Long fatorial = 1L;
		 while(x > 0) {
			 fatorial *= x;
			 x--;
		 }
		 return fatorial;
	}

}
