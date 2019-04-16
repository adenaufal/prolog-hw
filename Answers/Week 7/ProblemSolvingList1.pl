accmaxlist([],A,A).
% We can set A to 0 for the initialization.

accmaxlist([H|T],A,Max):-
	H > A,
	accmaxlist(T,H,Max).
	
accmaxlist([H|T],A,Max):-
	H =< A,
	accmaxlist(T,A,Max).
	
maxlist(L,Max):- accmaxlist(L,0,Max).

maximumlist(L,Max):-
	L= [H|_],
	accmaxlist(L,H,Max).

sum_list([],0). % base case

sum_list([H|T],Sum):-
	sum_list(T,SumT),
	Sum is SumT+H.

product_list([],1).

product_list([H|T],Prod):-
	product_list(T,ProdT),
	Prod is ProdT*H.