let parque he me hs ms =

  let horas = 
    if hs > he && ms < me then hs - he
    else if hs > he && ms >= me then hs - he + 1
    else if hs < he && ms < me then 24 - he + hs 
    else if hs > he && ms >= me then 24 - he + hs + 1
    else 1
  in
  let valorPagar =
    if horas = 1 then 120 
    else if horas = 2 then 120+140
    else if horas = 3 then 120+140+150
    else (horas - 3) * 155 + 120+140+150
  in
  valorPagar;;  
  
  let main () =
    ignore(Sys.command "clear");
    print_string "Hora de Entrada    : ";
    let he = read_int() in
    print_string "Minutos de Entrada : ";
    let me = read_int() in
    print_string "Hora de Saida      : ";
    let hs = read_int() in
    print_string "Minutos de Saida   : ";
    let ms = read_int() in 
    Printf.printf "O custo é de %d%! Centimos\n" (parque he me hs ms);;
   

let () = main ();;