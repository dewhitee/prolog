solution([]).
solution([X/Y | Others]) :-
    solution(Others),
    member(Y, [1,2,3,4,5,6,7,8]),
    noattack(X/Y, Others).

noattack(_, []).
noattack(X/Y, [X1/Y1 | Others]) :-
    Y =\= Y1,
    Y1 - Y =\= X1 - X,
    Y1 - Y =\= X - X1,
    noattack(X/Y, Others).

% ----------------------------------------------------------------
solution(Queens) :-
    permutation([1,2,3,4,5,6,7,8]), Queens),
    safe(Queens).

permutation([], []).
permutation([Head | Tail], PermList) :-
    permutation(Tail, PermTail),
    del(Head, PermList, PermTail).

del(Item, [Item | List], List).
del(Item, [First | List], [First | List1]) :-
    del(Item, List, List1).