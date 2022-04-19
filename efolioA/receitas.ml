
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
let ficheiro ="receitas.txt";;

(*let lista : registo list = [];;*)
let iterRegisto = -1;;

let obterValorInteiro valor = (
  int_of_string valor
);;

(* Altera os valores no registo 
  - Executa opção de alteração recebida
  - Retorna Registo alterado *)
  let preencherRegisto reg valor tipo = (
    match tipo with
    | 0 -> (reg.numero <- valor;reg)
    | 1 -> (reg.nome <- valor;reg)
    | 2 -> (reg.preparacao <- valor;reg)
    | 3 -> (reg.ingrediente1 <- valor;reg)
    | 4 -> (reg.qtdIng1 <- valor;reg)
    | 5 -> (reg.ingrediente2 <- valor;reg)
    | 6 -> (reg.qtdIng2 <- valor;reg)
    | 7 -> (reg.ingrediente3 <- valor;reg)
    | 8 -> (reg.qtdIng3 <- valor;reg)
    | 9 -> (reg.ingrediente4 <- valor;reg)
    | 10 -> (reg.qtdIng4 <- valor;reg)
    | 11 -> (reg.ingrediente5 <- valor;reg)
    | 12 -> (reg.qtdIng5 <- valor;reg)
    | 13 -> (reg.ingrediente6 <- valor;reg)
    | 14 -> (reg.qtdIng6 <- valor;reg)
    | 15 -> (reg.ingrediente7 <- valor;reg)
    | 16 -> (reg.qtdIng7 <- valor;reg)
    | 17 -> (reg.ingrediente8 <- valor;reg)
    | 18 -> (reg.qtdIng8 <- valor;reg)
    | 19 -> (reg.ingrediente9 <- valor;reg)
    | 20 -> (reg.qtdIng9 <- valor;reg)
    | 21 -> (reg.ingrediente10 <- valor;reg)
    | 22 -> (reg.qtdIng10 <- valor;reg)
    | 23 -> (reg.ingrediente11 <- valor;reg)
    | 24 -> (reg.qtdIng11 <- valor;reg)
    | _ -> reg
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
  iterRegisto = -1; 
  let reg:registo = {numero=" ";nome=" ";preparacao=" ";ingrediente1=" ";qtdIng1=" ";ingrediente2=" ";qtdIng2=" ";
  ingrediente3=" ";qtdIng3=" ";ingrediente4=" ";qtdIng4=" ";ingrediente5=" ";qtdIng5=" ";
  ingrediente6=" ";qtdIng6=" ";ingrediente7=" ";qtdIng7=" ";ingrediente8=" ";qtdIng8=" ";
  ingrediente9=" ";qtdIng9=" ";ingrediente10=" ";qtdIng10=" ";ingrediente11=" "; qtdIng11=" "} in
  let tokens = (String.split_on_char 't' linha) in                                                     (* Separa os elementos da linah pelo ";" *)
  let rec dados (tokens, reg) = (
    match tokens with
    | [] -> reg;
    | h::t -> preencherRegisto reg (obterValorString t) (iterRegisto+1);
  )
  in dados(tokens, reg);

);;

let lerFicheiro ficheiro : registo list =(
  let lista : registo list = []; in 
  let canal = open_in ficheiro in                                 (*Abrir o ficheiro*)
  try
  while true                                                                
    do
      let linha = input_line canal in
      let registo = separar linha in
      registo :: lista;
      Printf.printf "[%s]" registo.numero;
      (*lista@[separar linha];*)
    done; lista;
    with End_of_file -> close_in canal; lista;
);;

let imprimirRegisto registo = (
  Printf.printf "nome: %s" registo.nome;

);;

let rec obterRegisto lista index =(
    match lista with
  | [] -> raise (Failure "Lista esta vazia")
  | first::rest -> 
      if index = 0 then first 
      else obterRegisto rest (index-1)
);;


let menu = (
  let dados = lerFicheiro ficheiro; in
  ignore(Sys.command "clear");
  print_string "\nIndique o numero da receita que pretende visulizar: ";
  let indice = read_int() in
  let receita = obterRegisto dados indice in
  imprimirRegisto receita;
);;


(*Inicio do Programa*)
let() = (
  menu;
);;