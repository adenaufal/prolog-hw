male(farid).
male(toha).
male(ade).
male(didin).
male(yusuf).
male(naufal).
male(ardi).
male(mbahkakung).
male(briyan).
male(ilham).
male(kahir).
male(suhaimin).

female(eka).
female(surtinah).
female(nur).
female(camelia).
female(tifarie).
female(zainab).
female(sarah).
female(rista).
female(mbahputri).
female(sartini).

parent(mbahkakung,farid).
parent(mbahkakung,nur).
parent(mbahkakung,toha).
parent(mbahkakung,sartini).
parent(mbahputri,farid).
parent(mbahputri,nur).
parent(mbahputri,toha).
parent(mbahputri,sartini).
parent(farid,ade).
parent(farid,camelia).
parent(farid,tifarie).
parent(nur,zainab).
parent(nur,didin).
parent(nur,sarah).
parent(nur,yusuf).
parent(toha,naufal).
parent(toha,rista).
parent(toha,ardi).
parent(sartini,briyan).
parent(sartini,ilham).

birth(farid,1965).
birth(nur,1969).
birth(toha,1950).
birth(sartini,1955).

married(kahir,nur).
married(surtinah,toha).
married(eka,farid).
married(suhaimin,sartini).

spouse(X,Y):- parent(X,Z),parent(Y,Z).
sibling(X,Y):- parent(Z,X),parent(Z,Y).
grandparent(X,Y):- parent(X,Z),parent(Z,Y).

/* Bulik in Javanese family tree, is known as younger aunt. If your parent has younger sister in their family tree, then you can call them as 'bulik'. */

bulik(Y,X):- % maternal
	female(Y),
	sibling(Y,P),
	parent(P,X),
	birth(Y,A),
	birth(P,B),
	A>B.

bulik(Y,X):- % marriage
	female(Y),
	married(Y,Z),
	sibling(Z,P),
	parent(P,X),
	birth(Z,A),
	birth(P,B),
	A>B.
	
/* Pakde in Javanese family tree, is known as older uncle. If your parent has older brother in their family tree, then you can call them as 'pakde'. */

pakde(Y,X):- % maternal
	male(Y),
	sibling(Y,P),
	parent(P,X),
	birth(Y,A),
	birth(P,B),
	A<B.

pakde(Y,X):- % marriage
	male(Y),
	married(Y,Z),
	sibling(Z,P),
	parent(P,X),
	birth(Z,A),
	birth(P,B),
	A<B.

/* Paklik in Javanese family tree, is known as younger uncle. If your parent has younger brother in their family tree, then you can call them as 'paklik'. */	

paklik(Y,X):- % maternal
	male(Y),
	sibling(Y,P),
	parent(P,X),
	birth(Y,A),
	birth(P,B),
	A>B.

paklik(Y,X):- % marriage
	male(Y),
	married(Y,Z),
	sibling(Z,P),
	parent(P,X),
	birth(Z,A),
	birth(P,B),
	A>B.

/* Bude in Javanese family tree, is known as older aunt. If your parent has older sister in their family tree, then you can call them as 'bude'. */
	
bude(Y,X):- % maternal
	female(Y),
	sibling(Y,P),
	parent(P,X),
	birth(Y,A),
	birth(P,B),
	A<B.
	
bude(Y,X):- % marriage
	female(Y),
	married(Y,Z),
	sibling(Z,P),
	parent(P,X),
	birth(Z,A),
	birth(P,B),
	A<B.