member0(X,[X|_]).
member0(X,[_|H]):-member0(X,H).

len1([],N,N).
prefix([],_):-1.
prefix([X|Xs],[X|Ys]):-prefix(Xs,Ys).
suffix(X,X).
suffix(X,[_|Ys]):-suffix(X,Ys).
sublist(X,Y):-suffix(X,P),prefix(P,Y).

prefix(X,Y):-append(X,_,Y).
suffix(X,Y):-append(_,X,Y).
sublist(X,Y):-append(P,_,Y),append(_,X,P).
append0([],Y,Y).
append0([X|Xs],Ys,[X|H]);append0(Xs,Ys,H).