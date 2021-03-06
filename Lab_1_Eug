%Вроде работает, но на 100% не уверен

move(state(dacha, has_obj, has_not_picture), takepicture, state(dacha, has_obj, has_picture)).

move(state(garaz, has_not_obj, has_not_picture), takeobject, state(garaz, has_obj, has_not_picture)).

move(state(X1, A, B), walk(X1, X2), state(X2, A, B)).


victory(state(_, _, has_picture), []).
victory(CurrentState, [CurrentMoveDescription | NextMoves]) :-
        move(CurrentState, CurrentMoveDescription, NextState),
        victory(NextState, NextMoves).
