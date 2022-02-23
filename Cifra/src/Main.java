import java.util.Scanner;

public class Main {

    private static final String ALFABETO = "abcdefghijklmnopqrstuvwxyz";        // alfabeto completo para referência
    private static final String CONSOANTES = "bcdfghjklmnpqrstvwxyz";           // consoantes para referência

    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);                                  // cria um scanner para captar a entrada do usuário
        System.out.println("Insira a palavra a ser codificada: ");              // informa o usuário do que deve ser inserido
        String palavra = scan.nextLine();                                       // pega a entrada do usuário e coloca na variável palavra

        String palavraCifrada = cifraPalavra(palavra);                          // chama o método para cifrar a palavra inserida
        System.out.println(palavraCifrada);                                     // mostra a palavra cifrada ao usuário

        scan.close();                                                           // fecha o scanner para evitar vazamento de recursos
    }

    private static String cifraPalavra(String str){                             // método para cifrar a palavra
        char strArray[] = str.toCharArray();                                    // guarda a string em forma de array de caracteres
        String resultado = new String();                                        // variável para guardar o resultado da cifra
        
        for (char c : strArray) {                                               // loop que passa pela palavra, letra por letra
            resultado = resultado.concat(Character.toString(c));                // concatena a letra atual ao resultado

            if(CONSOANTES.contains(Character.toString(c))) {                    // checa se a letra atual esta presente na string que contém apenas consoantes
                resultado = resultado.concat(proxVogal(c));                     // concatena o resultado do método proxVogal ao resultado
                resultado = resultado.concat(proxConsoante(c));                 // concatena o resultado do método proxConsoante ao resultado
            }
        }

        return resultado;                                                       // retorna a palavra cifrada
    }

    private static String proxVogal(char c) {                                   // método que retorna a próxima vogal depois de 'c'
        int posicao = ALFABETO.indexOf(Character.toString(c));                  // usando a string constante ALFABETO, pega a posição do caractere 'c'
        
        if (posicao < 3){                                                       // série de if's para identificar a vogal mais próxima de 'c'
            return "a";                                                         // a vogal 'a' se encontra na posição 0, portanto, se 'c' estiver
        }                                                                       // em uma posição menor do que 3, essa é a vogal mais próxima, já que 'e' 
        else if (posicao < 7) {                                                 // fica na posição 4 e a vogal mais perto do início tem preferência.
            return "e";                                                         // a mesma lógica é utilizada para o resto das vogais.
        }
        else if (posicao < 12) {
            return "i";
        }
        else if (posicao < 18){
            return "o";
        }
        
        return "u";                                                             
    }
    
    private static String proxConsoante(char c) {                               // método que retorna a próxima consoante depois de 'c'
        int posicao = ALFABETO.indexOf(Character.toString(c));                  // usando a string constante ALFABETO, pega a posição do caractere 'c'
        
        if(posicao == 25){                                                      // checa se o caractere em questão é a letra 'z' por meio de sua posição
            return Character.toString(c);                                       // caso sim, o retorna
        }
            
        posicao++;                                                              // incrementa o valor da posição em 1, efetivamente avançando uma letra no alfabeto

        if (posicao == 4 || posicao == 8 || posicao == 14 || posicao == 20) {   // checa se a nova letra é uma vogal
            posicao++;                                                          // caso sim, passa para a próxima letra. Como não existem duas vogais adjacentes,
        }                                                                       // não é necessário checagens adicionais
        
        return Character.toString(ALFABETO.charAt(posicao));                    // retorna a próxima consoante convertida para string para poder ser concatenada
    }
}
