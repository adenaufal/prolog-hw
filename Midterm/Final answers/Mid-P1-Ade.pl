% parent(X,Y) denotes that X is one of Y’s parent

parent(anya,clara).
parent(anya,edward).
parent(anya,fiona).
parent(benjamin,clara).
parent(benjamin,edward).
parent(benjamin,fiona).

parent(clara,hannah).
parent(clara,ira).
parent(clara,lucas).
parent(david,hannah).
parent(david,ira).
parent(david,lucas).

parent(fiona,mike).
parent(fiona,nancy).
parent(george,mike).
parent(george,nancy).

parent(ira,peter).
parent(ira,quincy).
parent(james,peter).
parent(james,quincy).

parent(kiana,raymond).
parent(kiana,sarah).
parent(kiana,tina).
parent(lucas,raymond).
parent(lucas,sarah).
parent(lucas,tina).

parent(nancy,umberto).
parent(nancy,victoria).
parent(oscar,umberto).
parent(oscar,victoria).

/* person(Person,Gender,Birthyear) explains that the person Person is
of gender Gender and born at Birthyear */

person(anya,female,1938).
person(benjamin,male,1929).
person(clara,female,1959).
person(david,male,1950).
person(edward,male,1963).
person(fiona,female,1965).
person(george,male,1955).
person(hannah,female,1980).
person(ira,female,1982).
person(james,male,1979).
person(kiana,female,1990).
person(lucas,male,1989).
person(mike,male,1991).
person(nancy,female,1994).
person(oscar,male,1992).
person(peter,male,2005).
person(quincy,female,2008).
person(raymond,male,2013).
person(sarah,female,2015).
person(tina,female,2018).
person(umberto,male,2016).
person(victoria,female,2019).

/* Additional rules for main cases. */

sibling(X,Y):- parent(Z,X),parent(Z,Y).
grandparent(X,Y):- parent(X,Z),parent(Z,Y).
married(X,Y):- parent(X,Z),parent(Y,Z).

/* Main rules. */

/* Bulik in Javanese family tree, is known as younger aunt.
If your parent has younger sister in their family tree,
then you can call them as 'bulik'. */

bulik(Y,X):- % by blood
	person(Y,female,A),
	sibling(Y,P),
	parent(P,X),
	person(P,_,B),
	A>B.

bulik(Y,X):- % by marriage
	person(Y,female,_),
	married(Y,Z),
	sibling(Z,P),
	parent(P,X),
	person(Z,_,A),
	person(P,_,B),
	A>B.
	
/* Pakde in Javanese family tree, is known as older uncle.
If your parent has older brother in their family tree,
then you can call them as 'pakde'. */

pakde(Y,X):- % by blood
	person(Y,male,A),
	sibling(Y,P),
	parent(P,X),
	person(P,_,B),
	A<B.

pakde(Y,X):- % by marriage
	person(Y,male,_),
	married(Y,Z),
	sibling(Z,P),
	parent(P,X),
	person(Z,_,A),
	person(P,_,B),
	A<B.

/* Paklik in Javanese family tree, is known as younger uncle.
If your parent has younger brother in their family tree,
then you can call them as 'paklik'. */

paklik(Y,X):- % by blood
	person(Y,male,A),
	sibling(Y,P),
	parent(P,X),
	person(P,_,B),
	A>B.

paklik(Y,X):- % by marriage
	person(Y,male,_),
	married(Y,Z),
	sibling(Z,P),
	parent(P,X),
	person(Z,_,A),
	person(P,_,B),
	A>B.

/* Bude in Javanese family tree, is known as older aunt.
If your parent has older sister in their family tree,
then you can call them as 'bude'. */

bude(Y,X):- % by blood
	person(Y,female,A),
	sibling(Y,P),
	parent(P,X),
	person(P,_,B),
	A<B.

bude(Y,X):- % by marriage
	person(Y,female,_),
	married(Y,Z),
	sibling(Z,P),
	parent(P,X),
	person(Z,_,A),
	person(P,_,B),
	A<B.