direct(jakarta,yogyakarta).
direct(jakarta,surabaya).
direct(jakarta,bali).
direct(bandung,yogyakarta).
direct(bandung,surabaya).
direct(bandung,bali).
direct(surabaya,makassar).
direct(makassar,manado).

flight1(X,Y):- direct(X,Y).
flight1(X,Y):- direct(X,Z), flight1(Z,Y).

numeral(succ(X)):- numeral(X).
numeral(0).

flight2(X,Y):- direct(X,Y).
flight2(X,Y):- flight2(Z,Y), direct(X,Z).

flight3(X,Y):- direct(X,Y).
flight3(X,Y):- direct(Z,Y), flight3(X,Z).

flight4(X,Y):- direct(X,Y).
flight4(X,Y):- flight4(X,Z), direct(Z,Y).


