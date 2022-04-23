**************
* Instalação *
**************

O programa foi desenvolvido em linguagem OCaml com a versão 4.11.1 e
testado no sistema operativo Ubuntu (linux)

O método de instalação utilizado é o descrito na página oficial do Ocaml
( https://ocaml.org/docs/install.html ) para a versão de SO referida anteriormente

$  apt install ocaml

**************
* Compilação *
**************

Para compilar o programa basta escrever na linha de comandos o seguinte comando, a estrutura dos
ficheiros não deverá ser alterada:

$  ocamlopt -o receitas receitas.ml

**************
*  Execução  *
**************

Para executar o programa basta escrever na linha de comandos o seguinte comando:

$  ./receitas

Após o programa iniciar, carrega para a memoria uma lista de registos com a informação 
do ficheiro localizado em /dados/receitasV1.csv.
Será apresentado um menu com a informação suscinta das receitas carregadas, bem como as opções disponiveis
ao utilizador.