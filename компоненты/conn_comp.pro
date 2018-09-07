:-dynamic(node/1).
:-dynamic(edge/2).


adj(X, Y):- edge(X, Y); edge(Y, X).

count_of_connected_components(N):- connected_components_with_isolated(Cs), length(Cs, N).

connected_components_with_isolated(Cs):- 
    connected_components(C1), 
    get_isolated_nodes(C2), 
    append(C1, C2, Cs).

get_isolated_nodes(Ns):- findall([X], isolated_node(X), Ns).

isolated_node(X):- node(X), \+ adj(X, _).

connected_components(Cs):-
    findall([X,Y], edge(X,Y), P),
    connect(P, Cs).

connect(Ls, Cs):-
    select(A, Ls, Rs),
    select(B, Rs, Ts),
    A\=B, intersect(A, B), union(A, B, U),
    !, connect([U|Ts], Cs).

connect(Cs, Cs).



intersect(L1, L2):- member(E, L1), member(E, L2).

union([], L, L):- !.
union([H|T], L, R):- member(H, L), !, union(T, L, R).
union([H|T], L, [H|R]):- union(T, L, R).



:-initialization(load_from_file).

goal:- count_of_connected_components(N), write(N).

load_from_file:- open('graph.txt', read, F), load_graph(F), close(F).
load_graph(F):- at_end_of_stream(F) -> goal; read(F, X), process(X), load_graph(F).
 
process(node(X)):- assertz(node(X)).
process(edge(X,Y)) :- assertz(edge(X,Y)).
process(_):- write('Bad Predicate'), fail, !.

