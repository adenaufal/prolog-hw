triangle(X,Y,Z):- X > 0, Y > 0, Z > 0, (X+Y)>Z, (Y+Z)>X, (X+Z)>Y.

tribo(0, 0) :- !.
tribo(1, 1) :- !.
tribo(2, 2) :- !.
tribo(N, T) :-
        N > 2,
        N1 is N-1,
        N2 is N-2,
		N3 is N-3,
        tribo(N1, T1),
        tribo(N2, T2),
		tribo(N3, T3),
        T is T1+(2*T2)+(3*T3).