:- [dados].
:- [regras].

:- dynamic corpoCeleste/5.

main :-																						%%'Apresenta o manu ao utilizador'
	writeln("Menu"), nl, 
    writeln('>> opcao um comando, seguido de um ponto final:'),
    writeln('  0. Sair'),
    writeln('  1. Verificar se o corpo celeste X orbita em torno de Y'),
	writeln('  2. Listar planetas de uma estrela'),
	writeln('  3. Listar satelites de um planeta'),
	writeln('  4. Listar planetas com satelites'),
	writeln('  5. Verificar se o planeta tem satelite'),
	writeln('  6. Verificar qual o maior planeta'),
	writeln('  7. Total de corpos celestes que orbitam em torno de outro'),
    writeln('  8. Media de diametros dos satelites em torno de um planeta'),
	writeln('  9. Ano de descoberta de um corpo celeste'),
	writeln('  10. Listar hierarquicamente corpos celestes a partir de um'),
	writeln('  11. Atualizar ano de descoberta'),
    read(Comando),
    opcao(Comando).
	

retornamenu :-
	nl, writeln("c. para continuar"),
    read(_),																				%%'Aceita qualquer valor, dá a ideia de passagem de menu ao utilizador'
    main. 

opcao(0) :- 
    writeln('Sair'), halt.

opcao(1) :- 
    nl, writeln('Indique o corpo celeste X:'), read(X),
    writeln('Indique o corpo celeste Y:'), read(Y),
    writeln('X orbita Y:'),
	orbita(X,Y), retornamenu.												%%'Respectiva função e retorno ao menu'

opcao(2) :- 
    nl, writeln('Indique a estrela:'), read(Estrela),
    writeln('Lista de planetas da estrela:'),
    listar_planeta(Estrela), retornamenu.											    %%'Respectiva função e retorno ao menu'

opcao(3) :- 
    nl, writeln('Indique o planeta:'), read(Planeta),
    writeln('Lista de satelites do planeta:'),
	listar_satelites(Planeta), retornamenu.								                %%'Respectiva função e retorno ao menu'

opcao(4) :- 
    nl, writeln('Lista dos planetas que tem satelites:'),
	listar_planetas_com_satelites, retornamenu.										%%'Respectiva função e retorno ao menu'

opcao(5) :-
    nl, writeln('Indique o planeta:'), read(Planeta),
    writeln('Tem Satelites:'),
    tem_satelite(Planeta), retornamenu.							%%'Respectiva função e retorno ao menu'

opcao(6) :-
    nl, writeln('O maior planeta e:'),
	maior_planeta, retornamenu. 						%%'Respectiva função e retorno ao menu'

opcao(7) :-
    nl, writeln('Indique o corpo celeste:'), read(Corpo),								%%'Variavel para a função'	
	total_corpos_celeste(Corpo), retornamenu.			%%'Respectiva função e retorno ao menu'

opcao(8) :- 
    nl, writeln('Indique o planeta:'), read(Planeta),					%%'Variavel para a função'	
 	media_diametro_satelites(Planeta), retornamenu.						%%'Respectiva função e retorno ao menu'

opcao(9) :-
    nl, writeln('Indique o planeta:'), read(Corpo),
    ano_descoberta_corpo(Corpo), retornamenu.					%%'Respectiva função e retorno ao menu'
				  
opcao(10) :- 
    nl, writeln('Indique o corpo celeste:'),read(Corpo),
	lista_corpos_celeste(Corpo), retornamenu.

opcao(11) :-
    nl, writeln('Indique o corpo celeste que pretende atualizar:'),read(Corpo),
    writeln('Indique o novo valor para o ano de descoberta:'),read(Ano),
	alterar_ano_descoberta_corpo(Corpo,Ano), retornamenu.	