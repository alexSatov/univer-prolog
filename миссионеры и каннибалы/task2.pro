boat(0, 1).
boat(0, 2).
boat(1, 0).
boat(2, 0).
boat(1, 1).


safe(M, K):- M == 0; M >= K.


solve(N, R1):-
    solve(N,N,l,0,0, N, [[N,N,l,0,0]], R),
    reverse(R, R1).

solve(_,_,_,MR,KR, N, R, R):- MR == N, KR == N, !.

solve(ML,KL,B,MR,KR, N, L, R):-
    cross(ML,KL,B,MR,KR, ML1,KL1,B1,MR1,KR1),
    \+ member([ML1,KL1,B1,MR1,KR1], L),
    solve(ML1,KL1,B1,MR1,KR1, N, [[ML1,KL1,B1,MR1,KR1]|L], R).


cross(ML,KL,l,MR,KR, ML1,KL1,r,MR1,KR1):-
    boat(M, K), ML >= M, KL >= K,
    ML1 is ML - M, KL1 is KL - K, safe(ML1, KL1),
    MR1 is MR + M, KR1 is KR + K, safe(MR1, KR1).

cross(ML,KL,r,MR,KR, ML1,KL1,l,MR1,KR1):-
    cross(MR,KR,l,ML,KL, MR1,KR1,r,ML1,KL1).


goal:-findall(T, solve(3, T), R), write(R).
:-initialization(goal).