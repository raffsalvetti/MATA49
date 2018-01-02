package br.ufba.mata49.trabalho.pontoflutuante;

import java.util.Arrays;

import br.ufba.mata49.trabalho.pontoflutuante.funcao.Abs;
import br.ufba.mata49.trabalho.pontoflutuante.funcao.Acos;
import br.ufba.mata49.trabalho.pontoflutuante.funcao.Asin;
import br.ufba.mata49.trabalho.pontoflutuante.funcao.Atan;
import br.ufba.mata49.trabalho.pontoflutuante.funcao.Cos;
import br.ufba.mata49.trabalho.pontoflutuante.funcao.Dummy;
import br.ufba.mata49.trabalho.pontoflutuante.funcao.Exp;
import br.ufba.mata49.trabalho.pontoflutuante.funcao.Ln;
import br.ufba.mata49.trabalho.pontoflutuante.funcao.Sin;
import br.ufba.mata49.trabalho.pontoflutuante.funcao.Sqrt;
import br.ufba.mata49.trabalho.pontoflutuante.funcao.Tan;
import br.ufba.mata49.trabalho.pontoflutuante.funcao.base.FuncaoUnaria;
import br.ufba.mata49.trabalho.pontoflutuante.funcao.base.TimeWorks;

public class MATA49_PontoFlutuante_Main {

	private FuncaoUnaria funcoes[] = { 
				new Dummy(),
				new Abs(),
				new Exp(),
				new Ln(),
				new Sqrt(),
				new Cos(),
				new Sin(),
				new Tan(),
				new Acos(),
				new Asin(),
				new Atan()
			};
	
	public MATA49_PontoFlutuante_Main(String[] args) {
		double x = 30;
		if(args.length > 0) {
			System.out.println("parametro de entrada: " + args[0]);
			x = Double.parseDouble(args[0]);
		}
		for (FuncaoUnaria fu : Arrays.asList(funcoes)) {
			System.out.println(fu.getName() + "(" + x + ")");
			System.out.println("\tResultado Java: " + fu.operar(x) + "; Tempo: " + ((TimeWorks)fu).getExecTime() + " nanoseconds");
			System.out.println("");
		}
	}
	
	public static void main(String[] args) {
		new MATA49_PontoFlutuante_Main(args);
	}
}
