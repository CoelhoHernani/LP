let tri a b c =

  let printTipoTringulo =
    if a = b && c = b then Printf.printf "Triangulo equilatero\n"
    else if a = b || b = c || a = c then Printf.printf "Triangulo isosceles\n"
    else if a < c + b || b < c + a || c < b + a then Printf.printf "Triangulo proprio\n"
    else Printf.printf "Triangulo escaleno\n"
  in
  printTipoTringulo;;  
  
  let main () =
    ignore(Sys.command "clear");
    print_string "Insira o comprimento lado A    : ";
    let a = read_int() in
    print_string "Insira o comprimento lado B    : ";
    let b = read_int() in
    print_string "Insira o comprimento lado C    : ";
    let c = read_int() in
    tri a b c;;
   

    (*Função para iniciar o programa*)
let () = main ();;