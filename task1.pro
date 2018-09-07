join([], []).
join(X, [X]):- \+ is_list(X).
join([H|T],R):-join(H,R1), join(T,R2), append(R1,R2,R).