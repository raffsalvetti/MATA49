package br.ufba.mata49.trabalho.pontoflutuante.funcao.base;

public interface FuncaoBinaria<R, I1, I2> extends Funcao {
	R operar(I1 x1, I2 x2);
}
