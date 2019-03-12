% Problem 3: The Long Travels
byCar(auckland,hamilton).
byCar(hamilton,raglan).
byCar(valmont,saarbruecken).
byCar(valmont,metz).

byTrain(metz,frankfurt).
byTrain(saarbruecken,frankfurt).
byTrain(metz,paris).
byTrain(saarbruecken,paris).

byPlane(frankfurt,bangkok).
byPlane(frankfurt,singapore).
byPlane(paris,losAngeles).
byPlane(bangkok,auckland).
byPlane(losAngeles,auckland).

% defining auxiliary predicate travel/2
travel(X,Y):- byCar(X,Y).
travel(X,Y):- byTrain(X,Y).
travel(X,Y):- byPlane(X,Y).

travelable(X,Y):- travel(X,Y). % base case
travelable(X,Y):- travel(X,Z),travelable(Z,Y). % recursive case

% defining auxiliary predicate travel1/3, with go/2 as a functor.

travel1(X,Y,go(X,Y)):- byCar(X,Y).
travel1(X,Y,go(X,Y)):- byTrain(X,Y).
travel1(X,Y,go(X,Y)):- byPlane(X,Y).

travelwhere(X,Y,go(X,Y)):- travel1(X,Y,go(X,Y)). % base case

% if we see the pattern, we need to define go/3 recursively as follows:
travelwhere(X,Y,go(X,A,B)):- travel1(X,A,go(X,A)), travelwhere(A,Y,B).

% defining auxiliary predicate travel2/3, with go/3 as a functor
travel2(X,Y,go(X,Y,car)):- byCar(X,Y).
travel2(X,Y,go(X,Y,train)):- byTrain(X,Y).
travel2(X,Y,go(X,Y,plane)):- byPlane(X,Y).

travelhow(X,Y,go(X,Y,Type)):- travel2(X,Y,go(X,Y,Type)). % base case.

% if we see the pattern, we need to define go/4 recursively as follows:
travelhow(X,Y,go(X,A,Type,B)):- travel2(X,A,go(X,A,Type)), travelhow(A,Y,B).