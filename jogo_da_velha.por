programa
{
	
	funcao inicio()
	{
		//Bloco1: Declarando variáveis
		inteiro jogoDaVelha[][] = {
			{0, 0, 0},
			{0, 0, 0},
			{0, 0, 0}
		}
		cadeia jogador1, jogador2, jogadorAtual
		inteiro contadorLinha, contadorColuna
		inteiro contadorRodadas = 0
		inteiro linhaEscolhida, colunaEscolhida
		
		 
		//Bloco2: Colhendo o nome dos jogadores
		escreva("Digite o nome do primeiro jogador: ")
		leia(jogador1)
		escreva("Digite o nome do segundo jogador: ")
		leia(jogador2)

		//Bloco3: Funcionamento do jogo
		escreva("\n") // Dando uma quebra de linha
		faca {			
			//Bloco3.1: Mostrar o tabuleiro 
			escreva("\nJogo da Véia. " + " Rodada nº: " + (contadorRodadas + 1) + "\n")
			escreva("\n")
			contadorLinha = 0			
			faca {
				 contadorColuna = 0
				 faca {
				 	escolha (jogoDaVelha[contadorLinha][contadorColuna]) {
				 		
				 		caso 1:
				 			escreva("[ X ]")
				 		pare
				 		
				 		caso 2: 
				 			escreva("[ O ]") 
				 		pare
	
				 		caso contrario:
				 			escreva("[   ]")
				 	}
					contadorColuna++	
				 } enquanto(contadorColuna < 3)
				 
				 escreva("\n")
				 contadorLinha++
				 
			} enquanto(contadorLinha < 3)
			escreva("\n")
			//Fim Bloco3.1

			//Bloco3.15: Verificador de vitórias
			se (
				//Verificar vitória horizontal
				(jogoDaVelha[0][0] == 1 e jogoDaVelha[0][1] == 1 e jogoDaVelha[0][2] == 1) ou 
				(jogoDaVelha[1][0] == 1 e jogoDaVelha[1][1] == 1 e jogoDaVelha[1][2] == 1) ou
				(jogoDaVelha[2][0] == 1 e jogoDaVelha[2][1] == 1 e jogoDaVelha[2][2] == 1) ou
				//Verificar vitória vertical
				(jogoDaVelha[0][0] == 1 e jogoDaVelha[1][0] == 1 e jogoDaVelha[2][0] == 1) ou 
				(jogoDaVelha[0][1] == 1 e jogoDaVelha[1][1] == 1 e jogoDaVelha[2][1] == 1) ou
				(jogoDaVelha[0][2] == 1 e jogoDaVelha[1][2] == 1 e jogoDaVelha[2][2] == 1) ou
				//Verificar vitória diagonal
				(jogoDaVelha[0][0] == 1 e jogoDaVelha[1][1] == 1 e jogoDaVelha[2][2] == 1) ou 
				(jogoDaVelha[2][0] == 1 e jogoDaVelha[1][1] == 1 e jogoDaVelha[0][2] == 1) 
			) {
				escreva(jogador1 + " venceu a partida!\n")
				pare
			}
			senao se (
				//Verificar vitória horizontal
				(jogoDaVelha[0][0] == 2 e jogoDaVelha[0][1] == 2 e jogoDaVelha[0][2] == 2) ou 
				(jogoDaVelha[1][0] == 2 e jogoDaVelha[1][1] == 2 e jogoDaVelha[1][2] == 2) ou
				(jogoDaVelha[2][0] == 2 e jogoDaVelha[2][1] == 2 e jogoDaVelha[2][2] == 2) ou
				//Verificar vitória vertical
				(jogoDaVelha[0][0] == 2 e jogoDaVelha[1][0] == 2 e jogoDaVelha[2][0] == 2) ou 
				(jogoDaVelha[0][1] == 2 e jogoDaVelha[1][1] == 2 e jogoDaVelha[2][1] == 2) ou
				(jogoDaVelha[0][2] == 2 e jogoDaVelha[1][2] == 2 e jogoDaVelha[2][2] == 2) ou
				//Verificar vitória diagonal
				(jogoDaVelha[0][0] == 2 e jogoDaVelha[1][1] == 2 e jogoDaVelha[2][2] == 2) ou 
				(jogoDaVelha[2][0] == 2 e jogoDaVelha[1][1] == 2 e jogoDaVelha[0][2] == 2) 
			) {
				escreva("O " + jogador2 + " venceu a partida!\n")
				pare
			}
			senao se (contadorRodadas == 9) {
				escreva("Deu véia")
				pare
			}
			
			//3.2:coleta os dados até o jogador escolher dados válidos 
			faca {
				//3.2.1: Armazenar o nome do jogador atual
				se (contadorRodadas % 2 == 0) {
					jogadorAtual = jogador1 
				} senao {
					jogadorAtual = jogador2
				}				
				//Bloco3.2.2: Coleta as coordenadas da jogada
				escreva(jogadorAtual + ", digite o número da linha: ")
				leia(linhaEscolhida)
			
				escreva(jogadorAtual + ", digite o número da coluna: ")
				leia(colunaEscolhida)
	
				//Bloco3.2.3: Verifica validade da coordenada
				se (
					(linhaEscolhida > 3 ou linhaEscolhida < 1) ou 
					(colunaEscolhida > 3 ou colunaEscolhida < 1)
				) {
					escreva("\nEsta coordenada " + linhaEscolhida + " x " + colunaEscolhida + " não existe. \n \n")
				} 
				senao se (jogoDaVelha[linhaEscolhida - 1][colunaEscolhida - 1] != 0) {
					escreva("\nEsta posição já foi escolhida\n \n")
				}
				
				senao { 
					pare
				}
			} enquanto(verdadeiro)	
			
			//Bloco3.4: Determinar qual jogador irá modificar um valor da matriz
			se (contadorRodadas % 2 == 0) {
				jogoDaVelha[linhaEscolhida - 1][colunaEscolhida - 1] = 1 
			} senao {
				jogoDaVelha[linhaEscolhida - 1][colunaEscolhida - 1] = 2
			}
			contadorRodadas++
		} enquanto(contadorRodadas < 10)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 3425; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */