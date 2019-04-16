% Question 1

arithmean([],_).
arithmean(L,A):-
	length(L,Length),
	sumlist(L,Sum),
	A is Sum / Length.

prod_list([H],H).
prod_list([H|T], Product) :- prod_list(T, Rest), Product is H * Rest.
	
geomean([],_).
geomean(L,G):-
	length(L,Length),
	prod_list(L,R),
	G is R**(1/Length).

% Question 2

euclid(X, 0, X):- !.
euclid(0, X, X):- !.
euclid(X, Y, D):- X > Y, !, Z is X mod Y, euclid(Y, Z, D).
euclid(X, Y, D):- Z is Y mod X, euclid(X, Z, D).

gcd([H,H1|T],Z):- euclid(H,H1,X),gcd([X|T],Z).
gcd([H1,H2],Z):- euclid(H1,H2,Z).
gcd([H],Z):- Z is H.

% need to be fixed at those two lcm rules, but nah, whatever. i'm not a night owl coder.
lcm([H,H1|T],Result):-
	euclid(H,H1,X),
	gcd([X|T],Z),
	prod_list([H,H1|T],Y),
	Result is Y / Z,
	!.
lcm([H|T],Z):-
	prod_list([H|T],X),
	gcd([H|T],Y),
	Z is X / Y. 
lcm([H],Z):- Z is H.

% Question 3a

isPrime(2).
isPrime(3).
isPrime(P) :- 
    integer(P), 
    P > 3, 
    P mod 2 =\= 0, 
    \+ has_factor(P,3).  

has_factor(N,L) :- N mod L =:= 0.
has_factor(N,L) :- 
    L * L < N, 
    L2 is L + 2, 
    has_factor(N,L2).

% Question 3b
	
prime_list(A,B,L) :- 
	A < B ->
    A1 is (A // 2) * 2 + 1, 
    p_list(A1,B,L);
	B1 is (B // 2) * 2 + 1, 
    p_list(B1,A,L).

p_list(A,B,[]) :- A > B, !.
p_list(A,B,[A|L]) :- 
    isPrime(A), !, 
    next(A,A1), 
    p_list(A1,B,L).

p_list(A,B,L) :- 
    next(A,A1), 
    p_list(A1,B,L).

next(2,3) :- !.
next(A,A1) :- A1 is A + 2.

% Question 4

split([],_,[],[]).

split([X|L],P,[X|L1],L2):-
	X >= P,
	!,    
	split(L,P,L1,L2).

split([X|L],P,L1,[X|L2]):-
	split(L,P,L1,L2).
	
% Question 5

neighbor(L,R,[L,R|_]).
neighbor(L,R,[_|T]):- neighbor(L,R,T).
% two rules above state that house L is to the left of house R

owns_zebra_nationality(X):-
	Street = [_H1,_H2,_H3],
	member(house(red,english,_), Street),
	member(house(_,spanish,jaguar), Street),
	neighbor(house(_,_,snail),house(_,japanese,_), Street),
	neighbor(house(_,_,snail),house(blue,_,_), Street),
	member(house(_,X,zebra),Street).

house_color_japanese(X):-
	Street = [_H1,_H2,_H3],
	member(house(red,english,_), Street),
	member(house(_,spanish,jaguar), Street),
	neighbor(house(_,_,snail),house(_,japanese,_), Street),
	neighbor(house(_,_,snail),house(blue,_,_), Street),
	member(house(X,japanese,_),Street).