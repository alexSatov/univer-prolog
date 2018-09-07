len0(X,N):-len1(X,N,0).
len1([],N,N).
len1([_|H],N,Acc):-Acc1 is Acc + 1, len1(H,N,Acc1).