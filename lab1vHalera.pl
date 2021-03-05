% state(_, _, _, has).

% Places:
% dachaGeneral
% garageOutCity
% OfficeOfYellowPapper
%
% Actions:
% move(onLimuzin)
% state(where)
% grab(fotoCamera)
% takeFoto
% victory
%

move(state(at_middle, on_box, at_middle, has_not), grab, state(at_middle, on_box, at_middle, has)).

move(state(X, on_floor, X, Y), climb, state(X, on_box, X, Y)).

move(state(X1, on_floor, X1, Y), push(X1, X2), state(X2, on_floor, X2, Y)).

move(state(X1, on_floor, XC, Y), walk(X1, X2), state(X2, on_floor, XC, Y)).

victory(state(_, _, _, has), []).
victory(CurrentState, [CurrentMoveDescription | NextMoves]) :-
        move(CurrentState, CurrentMoveDescription, NextState),
        victory(NextState, NextMoves).
