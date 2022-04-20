
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

(*Indicação nome do ficheiro para ler*)
let ficheiro ="receitas.csv";;

let obterValorInteiro valor = (
  int_of_string valor
);;

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
  let tokens = (String.split_on_char '\t' linha) in   
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
- retorna lista string*)
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
  Printf.printf "Receita: %s\n" registo.nome;
  Printf.printf "Receita: %s\n" registo.preparacao;

);;

let rec obterRegisto lista index =(
  match lista with
  | [] -> raise (Failure "Lista esta vazia")
  | first::rest -> 
      if index = 0 then first 
      else obterRegisto rest (index-1)
);;

let criarRegistos listaS : registo list =(
  let rec listaRegisto listaR = (
    match listaS with
    | []-> []
    | h::t -> listaRegisto(separar h :: listaR);
  )in listaRegisto [];
);;

let menu = (
  let registosLista = lerFicheiro ficheiro in
  ignore(Sys.command "clear");
  print_string "\nIndique o numero da receita que pretende visulizar: ";
  let indice = read_int() in
  let receita = obterRegisto registosLista indice in
  imprimirRegisto receita;
);;


(*Inicio do Programa*)
let() = (
  menu;
);;