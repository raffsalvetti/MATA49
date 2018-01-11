package br.ufba.mata49.trabalho.pontoflutuante.funcao.base;

public interface FuncaoUnaria<R, I> extends Funcao {
	R operar(I x);
}
