grade_convert1(G):- G > 80, write('A').
grade_convert1(G):- G > 70, write('AB').
grade_convert1(G):- G > 65, write('B').
grade_convert1(G):- G > 60, write('BC').
grade_convert1(G):- G > 50, write('C').
grade_convert1(G):- G > 40, write('D').
grade_convert1(G):- G >= 0, write('E').

grade_convert3(G):- G > 80, write('A'), !.
grade_convert3(G):- G > 70, G =< 80, write('AB'), !.
grade_convert3(G):- G > 65, G =< 70, write('B'), !.
grade_convert3(G):- G > 60, G =< 65, write('BC'), !.
grade_convert3(G):- G > 50, G =< 60, write('C'), !.
grade_convert3(G):- G > 40, G =< 50, write('D'), !.
grade_convert3(G):- G >= 0, G =< 40, write('E'), !.

max(X,Y,X):- X >= Y.
max(X,Y,Y):- X < Y.

membership(X,[X|_]).
membership(X,[_|T]):- membership(X,T).

membership1(X,[X|_]):- !.
membership1(X,[_|T]):- membership(X,T).

add_term(X,L,L):- member(X,L),!.
add_term(X,L,[X|L]).

add_term1(X,L,L):- member(X,L).
add_term1(X,L,[X|L]).

% the base case
set1([],[]).
% the case if the head is the member of the tail
set1([H|T],Out):- member(H,T), set1(T,Out).
% the case if the head is not the member of the tail
set1([H|T],[H|Out]):- not(member(H,T)), set1(T,Out).

% the base case
set2([],[]).
% the case if the head is not the member of the tail
set2([H|T],Out):- member(H,T),!,set2(T,Out).
% the case if the head is the member of the tail
set2([H|T],[H|Out]):- set2(T,Out).