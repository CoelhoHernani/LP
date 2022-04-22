(*
 * Autor: Hernâni Coelho
 * Aluno: 1800045
 * Data: 20/04/2022
 * versão 1.0
*)
open Str

(*Indicação nome do ficheiro para ler*)
let ficheiro ="dados/receitasV1.csv";;

(*Estrutura de Dados de um Registo*)
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

(*Obtém o valor em formato string, que se encontra na cabelça da lista recebida 
- Retorna String do facto - caso receba algo
- String vazia - caso lista vazia *)
let obterValorString lista = (
  match lista with
  | [] -> " "
  | h::t -> h
);;

 (*Separa os elementos da linha *)
let separar linha = (   
  let tokens = (String.split_on_char ';' linha) in   
    {                                                  (* Separa os elementos da linah pelo "\t" *)
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
- recebe string como argumento
- retorna lista registos*)
let lerFicheiro ficheiro : registo list =( 
  if Sys.file_exists (ficheiro) then 
    begin
      let canal = open_in ficheiro in                                 (*Abrir o ficheiro*)
      try let ler () = 
        try Some (input_line canal) with End_of_file ->None in
        let rec lerLinha lista = 
          match ler () with 
          | Some linha -> lerLinha(separar linha ::lista)
          | None -> close_in_noerr canal; List.rev lista in lerLinha[]
      with e -> close_in_noerr canal; []
    end
  else []
);;


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
  Printf.printf "| 11: %25s | %-39s |\n" registo.ingrediente11 registo.qtdIng11;
  print_endline (String.make 75 '-');
  Printf.printf "\nModo de Preparação:\n%s\n" registo.preparacao;
);;



let rec obterRegisto lista index =(
  match lista with
  | [] -> raise (Failure "Lista esta vazia")
  | first::rest -> 
      if index = 1 then first 
      else obterRegisto rest (index-1)
);;

let rec imprimirMenuReceitas lista =( 
  match lista with
  | [] -> print_endline (String.make 38 '-');Printf.printf("Estas são as receitas diponiveis de momento!\n\n\n");
  | h::t -> print_endline (String.make 38 '-'); (Printf.printf "| %2s: %-30s |\n" h.numero h.nome); imprimirMenuReceitas t;
) 

(*Função que apresenta menu e corre as funcionalidades*)
let menu = (
  let lRegistos = List.tl(lerFicheiro ficheiro) in        (*nova lista filtrada, para não incluir o primeiro registo (1º linha do file) da lista que recebe da funcao lerFicheiro*)
  let terminaCiclo = ref false in
  while not !terminaCiclo do
    ignore(Sys.command "clear");
    Printf.printf ("\n*****Bem Vindo ao Mundo das Receitas*****\n\n");
    imprimirMenuReceitas lRegistos;  
    Printf.printf ("Indique a opção que pretende:\n\t1 - Visualizar uma receita\n\t2 - Visualizar ementa do chefe\n\t0 - Sair\nOpção: ");
    let controlo = read_int() in
    if controlo = 1 then (
      Printf.printf ("\nIndique o numero da receita que pretende visualizar: ");
      let indice = read_int() in
      let receita = obterRegisto lRegistos indice in
        imprimirRegisto receita;
      )
    else if controlo = 2 then Printf.printf "Estamos a trabalhar na funcionalidade 2\n"
    else terminaCiclo := true;
    Printf.printf"\nPressione uma tecla para Continuar\n";
    let voltar = read_line() in Printf.printf "%s" voltar;
  done
);;


(*Inicio do Programa*)
let main() = (
  menu;
);;