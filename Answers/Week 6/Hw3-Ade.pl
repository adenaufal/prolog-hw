% Problem 1: Pasaran Days
% The pasaran days are: pahing, pon, wage, kliwon, legi, respectively.
day(Start,1,Start). % the base case.
% we have five recursive case as follows:

day(Start,Day,pon):- Day > 1, Day1 is Day - 1, day(Start,Day1,pahing).
day(Start,Day,wage):- Day > 1, Day1 is Day - 1, day(Start,Day1,pon).
day(Start,Day,kliwon):- Day > 1, Day1 is Day - 1, day(Start,Day1,wage).
day(Start,Day,legi):- Day > 1, Day1 is Day - 1, day(Start,Day1,kliwon).
day(Start,Day,pahing):- Day > 1, Day1 is Day - 1, day(Start,Day1,legi).

% Problem 2: Triangles

% Part 1: inverted triangle
% star(N) returns a string of N stars

star(1):- write('*'). % base case
star(N):- N > 1, write('*'), N1 is N - 1, star(N1). % recursive case

/* inverttri(N) yields an inverted triangle of height N
as in the test cases. The predicate returns N lines of
strings, the string on line i contains i characters of stars. */

inverttri(N):-
	N > 0,
	star(N), nl, % writing N stars
	N1 is N - 1,
	inverttri(N1). % calling inverttri(N-1)

% Part 2

/* startri(N) yields a triangle of height N as in the the test cases.
The predicate returns N lines of strings, the string on line i contains i
characters of stars. */

startri(1):- star(1). % base case
startri(N):-
	N > 1,
	N1 is N - 1,
	startri(N1),nl, % calling startri(N-1)
	star(N). % writing N stars

% Part 3

/* tristar(N) yields a triangle of height N as in the test case.
The predicate returns N lines of strings, the string on line i
contains i characters of stars, preceded by N - i blank spaces. */

% space(N) returns a string of N blank spaces

space(0):- write(''). % space(0) returns no space
space(N):- N > 0, write(' '), N1 is N - 1, space(N1).

/* tristar(N) returns N lines of stars, a line i for 1 =< i =< N
contains i stars, each line i has N - i leading blank spaces, it is easier to work with a predicate tristar(N,TotalStars),
since the total number of spaces and the total number of stars in each line
is always equal maximum number of stars */

tristar(N,MaxStars):-
	N > 0,
	Space is N - 1, Star is MaxStars - Space,
	space(Space),star(Star), nl,
	tristar(Space,MaxStars).
	tristar(N):- tristar(N,N).