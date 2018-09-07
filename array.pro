len([],0).
len([X|H],N):-len(H,N1),N is N1 + 1.