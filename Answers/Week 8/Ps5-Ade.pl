% no 1
grade(end):- write('You choose to end the program, thank you!'), !.
grade(G):- G > 100, write('Input must be a number between 0 - 100 (inclusive) or a string "end without quotes.'), nl, igc, !.
grade(G):- G > 80, G =< 100, write('The index is A'), nl, igc, !.
grade(G):- G > 70, G =< 80, write('The index is AB'), nl, igc, !.
grade(G):- G > 65, G =< 70, write('The index is B'), nl, igc, !.
grade(G):- G > 60, G =< 65, write('The index is BC'), nl, igc, !.
grade(G):- G > 50, G =< 60, write('The index is C'), nl, igc, !.
grade(G):- G > 40, G =< 50, write('The index is D'), nl, igc, !.
grade(G):- G >= 0, G =< 40, write('The index is E'), nl, igc, !.
grade(G):- G < 0, write('Input must be a number between 0 - 100 (inclusive) or a string "end" without quotes.'), nl, igc, !.

igc:-
	repeat,
	write('Write a number between 0 -100 (inclusive) or a string "end" without quotes: '),
	read(G),
	grade(G).

% no 2
monotone1(A):-
	[H|T] = A, (T = [];
	T \= [],
	[H1|_] = T, H =< H1, monotone1(T)),!.

monotone2(A):-
	[H|T] = A, (T = [];
	T \= [],
	[H1|_] = T, H >= H1, monotone2(T)).

monotone(A):- (monotone1(A); monotone2(A)).

% no 4
diff_between( A, B, C):- 
    C is A - B.

pairs( G3, [A | B], C):-   % G3 is a goal expecting of 3 arguments
    append( D, [_], [A | B]),
    maplist( call(G3), B, D, C).

consec_diffs( L, Diffs):-
    pairs( diff_between, L, Diffs).

arithmetic( A ):-
    consec_diffs( A, [B | C]),
    maplist( =:=(B), C).

% no 5
maxodd([H|T],M):-
	maxodd(T,H,M).
	maxodd([],C,C).
maxodd([H|T],C,M):-
	C2 is max(C,H),
	maxodd(T,C2,M).