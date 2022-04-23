(*
 * Autor: Hernâni Coelho
 * Aluno: 1800045
 * Data: 20/04/2022
 * versão 1.0
*)

(*Indicação do diretorio do ficheiro de entrada*)
let ficheiro ="dados/receitasV1.csv";;

(*Estrutura de Dados de um Registo de receita*)
type registo ={
  mutable numero: string;
  mutable nome: string;
  mutable preparacao: string;
  mutable ingrediente1: string;
  mutable qtdIng1: string;
  mutable ingrediente2: string;
  mutable qtdIng2: string;
  mutable ingrediente3: string;
  mutable qtdIng3: string;
  mutable ingrediente4: string;
  mutable qtdIng4: string;
  mutable ingrediente5: string;
  mutable qtdIng5: string;
  mutable ingrediente6: string;
  mutable qtdIng6: string;
  mutable ingrediente7: string;
  mutable qtdIng7: string;
  mutable ingrediente8: string;
  mutable qtdIng8: string;
  mutable ingrediente9: string;
  mutable qtdIng9: string;
  mutable ingrediente10: string;
  mutable qtdIng10: string;
  mutable ingrediente11: string;
  mutable qtdIng11: string;
}

(*Preenche um registo de receita com a informação que recebe de uma linha
-recebe uma string, separa pelo delimitador
-retorna um registo de receita para adicionar na lista de registo*)
let preencherRegisto linha = (   
  let tokens = (String.split_on_char ';' linha) in   (* Separa os elementos da linah pelo ";"*)
    {                                                (*Adiciona nos campos de registo conforme ordem da lista de tokens*)  
    numero = List.nth tokens 0;
    nome = List.nth tokens 1;
    preparacao = List.nth tokens 2;
    ingrediente1 = List.nth tokens 3;
    qtdIng1 = List.nth tokens 4;
    ingrediente2 = List.nth tokens 5;
    qtdIng2 = List.nth tokens 6;
    ingrediente3 = List.nth tokens 7;
    qtdIng3 = List.nth tokens 8;
    ingrediente4 = List.nth tokens 9;
    qtdIng4 = List.nth tokens 10;
    ingrediente5 = List.nth tokens 11;
    qtdIng5 = List.nth tokens 12;
    ingrediente6 = List.nth tokens 13;
    qtdIng6 = List.nth tokens 14;
    ingrediente7 = List.nth tokens 15;
    qtdIng7 = List.nth tokens 16;
    ingrediente8 = List.nth tokens 17;
    qtdIng8 = List.nth tokens 18;
    ingrediente9 = List.nth tokens 19;
    qtdIng9 = List.nth tokens 20;
    ingrediente10 = List.nth tokens 21;
    qtdIng10 = List.nth tokens 22;
    ingrediente11 = List.nth tokens 23;
    qtdIng11 = List.nth tokens 24;
    }
);;

(*Função para ler o ficheiro
- recebe string como argumento (localização do ficheiro)
- retorna lista registos*)
let lerFicheiro ficheiro : registo list =( 
  if Sys.file_exists (ficheiro) then                                      (*Verifica se ficheiro existe*)
    begin
      let canal = open_in ficheiro in                                     (*Abrir o ficheiro, para ler*)               
        try let ler () = 
          try Some (input_line canal) with End_of_file ->None in          
          let rec lerLinha lista =                                        (*Lê linha a linha recursivamente, recebe e retorna uma lista de registos*)
            match ler () with                                             (*pattern matching*)
            | Some linha -> lerLinha(preencherRegisto linha ::lista)      (*se houver alguma coisa, adiciona registo à lista*)
            | None -> close_in_noerr canal; List.rev lista in lerLinha[]  (*Quando acabar, fecha canal, inverte lista*)
        with e -> close_in_noerr canal; []                                (*caso não consiga levanta excepção e fecha canal*)
    end
  else []
);;

(*Função para imprimir informação de um registo
- recebe um registo
- não retorna nada (unit)*)
let imprimirRegisto registo = (
  print_endline (String.make 75 '-');  
  Printf.printf "|  Receita %s: %-60s|\n" registo.numero registo.nome;
  print_endline (String.make 75 '-');
  Printf.printf "|         Ingredientes          |                Quantidade               |\n"; 
  print_endline (String.make 75 '-');
  Printf.printf "|  1: %-25s | %-39s |\n" registo.ingrediente1 registo.qtdIng1;
  print_endline (String.make 75 '-'); 
  Printf.printf "|  2: %-25s | %-39s |\n" registo.ingrediente2 registo.qtdIng2;
  print_endline (String.make 75 '-'); 
  Printf.printf "|  3: %-25s | %-39s |\n" registo.ingrediente3 registo.qtdIng3;
  print_endline (String.make 75 '-');
  Printf.printf "|  4: %-25s | %-39s |\n" registo.ingrediente4 registo.qtdIng4;
  print_endline (String.make 75 '-');
  Printf.printf "|  5: %-25s | %-39s |\n" registo.ingrediente5 registo.qtdIng5;
  print_endline (String.make 75 '-');
  Printf.printf "|  6: %-25s | %-39s |\n" registo.ingrediente6 registo.qtdIng6;
  print_endline (String.make 75 '-');
  Printf.printf "|  7: %-25s | %-39s |\n" registo.ingrediente7 registo.qtdIng7;
  print_endline (String.make 75 '-');
  Printf.printf "|  8: %-25s | %-39s |\n" registo.ingrediente8 registo.qtdIng8;
  print_endline (String.make 75 '-');
  Printf.printf "|  9: %-25s | %-39s |\n" registo.ingrediente9 registo.qtdIng9;
  print_endline (String.make 75 '-');
  Printf.printf "| 10: %-25s | %-39s |\n" registo.ingrediente10 registo.qtdIng10;
  print_endline (String.make 75 '-');
  Printf.printf "| 11: %-25s | %-39s |\n" registo.ingrediente11 registo.qtdIng11;
  print_endline (String.make 75 '-');
  Printf.printf "\nModo de Preparação:\n%s\n\n" registo.preparacao;
);;

(*Função que procura na lista o registo que se pretende
- recebe lista de registos e informação que nome/numero que identifica registo
- retorna o registo pretendido*)
let obterRegisto lista indice =(
  List.find (fun registo -> registo.numero = indice || registo.nome = indice) lista; (*Procura na lista o registo pelo nome ou numero*)
);;

(*Função recursiva que imprime no menu inicial as receitas disponiveis para analisar
- recebe lista de registos
- não retorna nada*)
let rec imprimirMenuReceitas lista =( 
  match lista with
  | [] -> print_endline (String.make 38 '-');Printf.printf("Estas são as receitas diponiveis de momento!\n\n\n");
  | h::t -> print_endline (String.make 38 '-'); (Printf.printf "| %2s: %-30s |\n" h.numero h.nome); imprimirMenuReceitas t;
);; 

(*Função que mediante as receitas selecionadas cria uma nova lista só com esses registos
- recebe uma string com identificação das escolhas
- retorna uma lista registos com os 3 registos*)
let compilarRegistos selecao lista =(
  let ldiaria : registo list = [] in                  (*lista de registos vazia*)
  let tokens = (String.split_on_char ',' selecao) in  (*separa argumentos pela virgula*)
    let rec compilar tokens ldiaria =(                (*recursivamente preenche a nova lista de registos com base nas escolhas do utilizador*)
      match tokens with
      | [] -> List.rev ldiaria                        (*quando processar a lista de tokens, devolve lista com 3 receitas*)
      | h::t -> compilar t (obterRegisto lista h::ldiaria)
    )in compilar tokens ldiaria 
);;

(*Função para processar ementa diaria compilando total de igredientes que são iguais
Nota: Função está incompleta, faltou fazer a compilação de ingredientes.
- recebe lista receitas diaria
- não retorna nada*)
let rec processarSelecaoDiaria lista =(
  match lista with
  | [] -> ()                                              (*quando acabar, não retorna nada, unit*)
  | h::t -> imprimirRegisto h; processarSelecaoDiaria t; 
);;

(*Função que apresenta menu e corre as funcionalidades
- do tipo unit*)
let menu = (
  let lRegistos = List.tl(lerFicheiro ficheiro) in            (*nova lista filtrada, para não incluir o primeiro registo (1º linha do file) da lista que recebe da funcao lerFicheiro*)
  let terminaCiclo = ref false in                     
    while not !terminaCiclo do                                (*ciclo while para ciclicamente apresentar interface menu ao utilizador, com variavel de controlo*)
      ignore(Sys.command "clear");                            (*limpa tela*)
      Printf.printf ("\n*****Bem Vindo ao Mundo das Receitas*****\n\n");  
      imprimirMenuReceitas lRegistos;                         (*Imprime resumo das receitas disponiveis*)
      Printf.printf ("Indique a opção que pretende:\n\t1 - Visualizar uma receita\n\t2 - Escolha diária do chef em número de três receitas\n\t0 - Sair\nOpção: ");
      let controlo = read_int() in                            (*utilizador indica opcao, para o levar à funcionalidade pretendida*)
        if controlo = 1 then (                        
          Printf.printf ("\nIndique o numero da receita que pretende visualizar: ");
          let indice = read_line() in
            let receita = obterRegisto lRegistos indice in    (*Obtém a receita e imprime de seguida a sua informação*)
              imprimirRegisto receita;    
          )
        else if controlo = 2 then (                           (*Funcionalidade não totalmente desenvolvida, ficou faltar processar para compilar informação entre receitas*)
          Printf.printf ("\nIndique separado por [,] três receitas: ");
          let selecao = read_line() in
            let ldiaria = compilarRegistos selecao lRegistos in   (*lista de registo da escolha diaria do chefe, manda para compilar informação*)
              processarSelecaoDiaria ldiaria;
          )
        else terminaCiclo := true;                            (*Qualquer outra tecla faz terminar ciclo e posteriormente o programa*)
      Printf.printf"\nPressione uma tecla para Continuar\n";
      let voltar = read_line() in ignore(voltar);             (*Permite utilizador controlar quando quer avançar no programa*)
    done
);;

(*Inicio do Programa*)
let main() = (
  menu;
);;