% 8 queens problem

% solution of non-attacking queens
solution([]).
solution([(X,Y)|Others]) :- % 1st queen at (X,Y),

% other queens at Others
solution(Others), member(Y,[1,2,3,4,5,6,7,8]), not(attacks((X,Y), Others)).

% 1st queen does not attack others
attacks((X,Y),Others) :-
	member((X1,Y1),Others),
	(Y1 =:= Y; % same Y-coordinates
	Y1-Y =:= X1-X; % same diagonal
	Y1-Y =:= X-X1).

% a solution template
template([(1,Y1),(2,Y2),(3,Y3),(4,Y4),(5,Y5),(6,Y6),(7,Y7),(8,Y8)]).