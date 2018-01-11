package br.ufba.mata49.trabalho.pontoflutuante.funcao.base;

public interface FuncaoQuaternaria<R, I1, I2, I3, I4> extends Funcao {
	R operar(I1 x1, I2 x2, I3 x3, I4 x4);
}
