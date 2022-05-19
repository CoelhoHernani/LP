%Regras
cls :- write('\e[2J').

show_list(X):-
    forall(	member(Y, X), (write(Y), nl) ).											%%'Função para apresentar cada elemento da lista'

orbita(CorpoX, CorpoY) :- 
    corpoCeleste(CorpoX,_,_,_,_), true,
    corpoCeleste(CorpoY,_,_,_,_), true,
    (corpoCeleste(CorpoX,_,CorpoY,_,_) -> write("yes"); write("no"));
    format('O corpo ~w ou ~w nao existe.', [CorpoX, CorpoY]).

listar_planeta(Estrela) :-
    corpoCeleste(Estrela,'estrela',_,_,_), true,
    findall(Planeta,corpoCeleste(Planeta,'planeta',Estrela,_,_), Lista),
    show_list(Lista);
    format('~w nao e uma estrela ou nao existe.', [Estrela]).

listar_satelites(Planeta) :-
    corpoCeleste(Planeta,'planeta',_,_,_), true,
    findall(Satelite,corpoCeleste(Satelite,_,Planeta,_,_), Lista),
    show_list(Lista);
    format('~w nao e um planeta ou nao existe.', [Planeta]).
                
listar_planetas_com_satelites :-
    findall(Planeta,corpoCeleste(_,'satelite',Planeta,_,_),Lista), 
    sort(Lista,Lista1),
    show_list(Lista1).
                            
tem_satelite(Planeta):-
    corpoCeleste(Planeta,'planeta',_,_,_), true,
    (corpoCeleste(_,'satelite',Planeta,_,_) ->write("yes"); write("no"));
    format('~w nao e um planeta ou nao existe.', [Planeta]).

maior_planeta :-
    findall(Diametro,corpoCeleste(_,'planeta',_,Diametro,_),Lista), max(Lista,0).

max([],D) :- 
    corpoCeleste(Planeta,'planeta',_,D,_)->write(Planeta).
max([H|T],D) :- 
    H>D -> L=H,
    max(T,L); max(T,D).

total_corpos_celeste(Corpo):-
    corpoCeleste(Corpo,_,_,_,_), true,
    aggregate_all(count, corpoCeleste(_,_,Corpo,_,_), Count),
    format('~w corpo(s) celeste(s) orbita(m) em torno de(a) ~w.', [Count, Corpo]);
    format('~w nao existe.', [Corpo]).

media_diametro_satelites(Planeta):-
    corpoCeleste(Planeta,_,_,_,_), true,
    (findall(D,corpoCeleste(_,'satelite',Planeta,D,_),Lista),
    sum_list(Lista, S),
    length(Lista, L),
    L > 0, M is S/L,
    format('A media dos diametros dos satelites em torno de ~w e ~w km.', [Planeta, M]);
    format('O planeta ~w nao tem satelites.', [Planeta]));
    format('~w nao e um planeta.', [Planeta]).
    
ano_descoberta_corpo(Corpo):-
    corpoCeleste(Corpo,_,_,_,_), true,
    corpoCeleste(Corpo,_,_,_,Ano)->
    format('O corpo celeste ~w foi descoberto no ano ~w.', [Corpo, Ano]);
    format('~w nao existe.', [Corpo]).

lista_corpos_celeste(Corpo):-
    findall(C,corpoCeleste(C,_,_,_,_),Lista),
    nth0(Indice, Lista, Corpo),
    write(Indice).     

alterar_ano_descoberta_corpo(Corpo,Ano):-
    corpoCeleste(Corpo,_,_,_,_), true,
    retract(corpoCeleste(Corpo,_,_,_,_)),												
	assert(corpoCeleste(Corpo,_,_,_,Ano)),													
	format('O ano de descoberta do corpo celeste ~w foi atualizado para ~w.',[Corpo,Ano]);
    format('~w nao existe.', [Corpo]).