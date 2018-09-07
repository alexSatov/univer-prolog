:-dynamic(node/1).
:-dynamic(edge/2).

adj(X,Y):-edge(X,Y);edge(Y,X).

path(X,Y,Path):-node(X),node(Y),path1(X,[Y],Path).

path1(X,[X|Y],[X|Y]).
path1(X,[Y|Ys],Path):-adj(A,Y), \+ member(A,Ys), path1(X,[A,Y|Ys],Path).

covers(Path):- \+ (node(X), \+ member(X,Path)).
hamilt(Path):-path(_,_,Path), covers(Path).

goal:-hamilt(Path)->write(Path);write('No path exists!').

:-initialization(load_from_file).


load_from_file:-open('graph.txt', read, F), load_graph(F), close(F).
load_graph(F):-at_end_of_stream(F)->goal;read(F,X),process(X),load_graph(F).

%process(T):-assertz(T).
process(node(X)):-assertz(node(X)).
process(edge(X,Y)):-assertz(edge(X,Y)).
process(_):-write('Bad predicat!'), fail,!.