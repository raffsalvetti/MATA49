package br.ufba.mata49.trabalho.pontoflutuante.funcao.base;

public abstract class TimeWorks {
	private Long inicio;
	private Long fim;
	
	public void inicio() {
		this.inicio = System.nanoTime();
	}
	
	public void fim() {
		this.fim = System.nanoTime();
	}
	
	public Long getExecTime() {
		return this.fim - this.inicio;
	}
}
