% soal nomor satu

addOne([],[]).
addOne([H1|T1], [H2|T2]) :-
	is(H2,+(H1,1)),
	addOne(T1,T2).
	
% soal nomor dua
  
sameElemList([]).
sameElemList([_]).
sameElemList([X,X|T]) :- sameElemList([X|T]).

% soal nomor tiga

scalarMult(_, [], []).
scalarMult(X, [H|T], [Hx|R]) :-
    Hx is H * X,
    scalarMult(X, T, R).
	
% soal nomor empat

add([],[],[]).
add([A],0,A).
add(0,[A],A).
add([H1|T1],[H2|T2],Result) :-
	X is H1 + H2,
	add(T1,T2,Y),
	append([X],Y,Result).

% soal nomor lima

dot([], [], 0).
dot([A|Ta], [B|Tb], Rx) :-
    dot(Ta, Tb, R),
    Rx is R + A * B.