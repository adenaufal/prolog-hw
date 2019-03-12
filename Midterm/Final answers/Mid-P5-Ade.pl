:- op(600,xf,genap).
genap(X):-
	0 is X mod 2.

:- op(600,xf,ganjil).
ganjil(X):-
	1 is X mod 2.