ppt(A,B,C):-
	D is C*C - A*A - B*B,
	D = 0.

ppt_gcd(A,B,C,N):-
	length(_,N),
	between(1,N,A),
	between(1,N,B),
	between(1,N,C),
	C^2 =:= A^2 + B^2.
	
/*

:- use_module(library(clpfd)).

pytri(Zs,Perimeter) :-
   Zs = [A,B,C],
   maplist(#<(1),Zs),
   sum(Zs,#=,Perimeter),
   chain(Zs,#<),
   A^2 + B^2 #= C^2.

*/

pyth(X,Y,Z,W) :- W1 is W-1,
    inrange(X,1,W1), inrange(Y,1,W1), inrange(Z,1,W1),
    S1 is X* X + Y* Y, S2 is  Z*Z, S1 == S2.

% inrange(A,B,C) B <= A <= C
inrange( V, V, _ ).
inrange( V, L, H ) :- L < H, L2 is L + 1, inrange( V, L2, H ).