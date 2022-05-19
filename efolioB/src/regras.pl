%Regras

%apresentar elementos de uma lista
show_list(X):-
    forall(	member(Y, X), (write(Y), nl) ).											

%verifica se X orbita Y
%recebe dois argumentos e verifica se sao validos
orbita(CorpoX, CorpoY) :- 
    corpoCeleste(CorpoX,_,_,_,_), true,
    corpoCeleste(CorpoY,_,_,_,_), true,
    (corpoCeleste(CorpoX,_,CorpoY,_,_), write("yes"); write("no"));
    format('O corpo ~w ou ~w nao existe.', [CorpoX, CorpoY]).

%lista todos os planetas de uma estrela
%recebe um argumento e verifica se é valido, 
%utiliza findall para criar uma lista dos resultados da condição 
listar_planeta(Estrela) :-
    corpoCeleste(Estrela,'estrela',_,_,_), true,
    findall(Planeta,corpoCeleste(Planeta,'planeta',Estrela,_,_), Lista),
    show_list(Lista);
    format('~w nao e uma estrela ou nao existe.', [Estrela]).

%lista todos satelites de um planeta
%recebe um argumento e verifica se é valido
%utiliza findall para criar uma lista dos resultados da condição 
listar_satelites(Planeta) :-
    corpoCeleste(Planeta,'planeta',_,_,_), true,
    findall(Satelite,corpoCeleste(Satelite,_,Planeta,_,_), Lista),
    show_list(Lista);
    format('~w nao e um planeta ou nao existe.', [Planeta]).

%lista de todos os planetas que têm satelites
%utiliza findall para criar uma lista dos resultados da condição                 
listar_planetas_com_satelites :-
    findall(Planeta,corpoCeleste(_,'satelite',Planeta,_,_),Lista), 
    sort(Lista,Lista1),
    show_list(Lista1).

%verifica se um planeta tem satelite
%recebe um argumento e verifica se é valido                            
tem_satelite(Planeta):-
    corpoCeleste(Planeta,'planeta',_,_,_), true,
    (corpoCeleste(_,'satelite',Planeta,_,_), write("yes"); write("no"));
    format('~w nao e um planeta ou nao existe.', [Planeta]).

%verifica dentro de uma lista de planetas qual o maior
%utiliza findall para criar uma lista dos resultados da condição 
%invoca regra max para recursivamente percorrer a lista e verificar o maior diametro 
maior_planeta :-
    findall(Diametro,corpoCeleste(_,'planeta',_,Diametro,_),Lista), max(Lista,0).

%caso base da recursividade de max
%ao atingir este caso, lista foi percorrida e estamos na presença do maior diametro encontrado
%com base no diametro invoca o facto para saber o nome do planeta
max([],D) :- 
    corpoCeleste(Planeta,'planeta',_,D,_), 
    format('O maior planeta e ~w com ~w km diametro.', [Planeta,D]).
%regra da recursividade H - cabeça da lista e T-restante lista D-variavel para diametro
%pela recursao a regra é chamada tantas vezes até atingir caso base
%valor do diametro é guardado em L se se verificar a condição
max([H|T],D) :- 
    H>D, L=H,
    max(T,L); max(T,D).

%verifica total de corpos celestes que orbitam em torno de outro
%recebe um argumento e verifica se é valido
%'Utiliza aggregate_all com a opção count, para contar corpos que verificam a condição
total_corpos_celeste(Corpo):-
    corpoCeleste(Corpo,_,_,_,_), true,
    aggregate_all(count, corpoCeleste(_,_,Corpo,_,_), Count),
    format('~w corpo(s) celeste(s) orbita(m) em torno de(a) ~w.', [Count, Corpo]);
    format('~w nao existe.', [Corpo]).

%verifica qual a media de diametros dos satelites de um planeta
%recebe um argumento e verifica se é valido
%utiliza findall para criar uma lista dos resultados da condição
%utiliza sum_list para somar os valores da lista e guardar em S
%utiliza length para verificar comprimento da lista e guarda em L
%calcula media M se lista nao for vazia
media_diametro_satelites(Planeta):-
    corpoCeleste(Planeta,_,_,_,_), true,
    (findall(D,corpoCeleste(_,'satelite',Planeta,D,_),Lista),
    sum_list(Lista, S),
    length(Lista, L),
    L > 0, M is S/L,
    format('A media dos diametros dos satelites em torno de ~w e ~w km.', [Planeta, M]);
    format('O planeta ~w nao tem satelites.', [Planeta]));
    format('~w nao e um planeta.', [Planeta]).

%verifica o ano de descoberta de um corpo celeste
%recebe um argumento e verifica se é valido    
ano_descoberta_corpo(Corpo):-
    corpoCeleste(Corpo,_,_,_,_), true,
    corpoCeleste(Corpo,_,_,_,Ano),
    format('O corpo celeste ~w foi descoberto no ano ~w.', [Corpo, Ano]);
    format('~w nao existe.', [Corpo]).

%regra por desenvolver
%lista_corpos_celeste(Corpo):-

%altera a data de descoberta de um corpo celeste
%recebe dois argumentos e verifica se é válido
%elimina facto correspondente e volta a defini-lo com a nova data     
alterar_ano_descoberta_corpo(Corpo,Ano):-
    corpoCeleste(Corpo,_,_,_,_), true,
    number(Ano), true,    
    retract(corpoCeleste(Corpo,_,_,_,_)),												
	assert(corpoCeleste(Corpo,_,_,_,Ano)),													
	format('O ano de descoberta do corpo celeste ~w foi atualizado para ~w.',[Corpo,Ano]);
    format('~w nao existe ou o ano nao esta bem definido.', [Corpo]).