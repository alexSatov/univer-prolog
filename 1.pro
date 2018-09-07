male(vladimir).
male(alexey).
male(alexander).
male(artyom).
male(victor).
male(li).
male(dima).

female(victoria).
female(lera).
female(anna).
female(olga).

parent(olga,victor,li).
parent(olga,victor,alexey).
parent(lera,dima,artyom).
parent(lera,dima,alexander).
parent(vladimir,anna).

brother(B1,B2):-male(B1),male(B2),parent(M,F,B1),parent(M,F,B2),B1\=B2.

child(X):-female(X)->parent(X,_,A);parent(