node(a).
node(b).
node(c).
node(d).
node(e).
node(f).
node(g).

edge(a, b, 1).
edge(a, c, 2).
edge(b, d, 1).
edge(c, e, 2).
edge(d, g, 1).
edge(e, f, 2).
edge(g, f, 1).

adj(X,Y,C):-edge(X,Y,C);edge(Y,X,C).

path(X,Y,Path,S):-node(X),node(Y),path1(X,[Y],Path,S).

path1(X,[X|Y],[X|Y],_).
path1(X,[Y|Ys],Path,S):-
    adj(A,Y,C), \+ member(A,Ys), B is S + C, path1(X,[A,Y|Ys],Path,B).
