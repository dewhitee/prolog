% state(_, _, _, has).

% Places:
% dachaGeneral
% garageOutCity
% officeCompany
% officeOfYellowPapper
%
% Camera:
% has, hasNot
%
% Actions:
% move(onLimuzin)
% state(where)
% grab(Camera)
% film(scene)
% victory(at dacha, at office, film)


% first version

% описание состояния
% state(гдеСьемачнаяГруппа, сниматьСцену, естьКамера).

% переход из локаций
% move(place1, place2).


% При выполнении
move(state(officeOfYellowPapper, noFilm, noCamera), go, state(garageOutCity, noFilm, noCamera)).
move(state(garageOutCity, noFilm, noCamera), grab, state(garageOutCity, noFilm, camera)).

move(state(garageOutCity, noFilm, noCamera), go, state(dachaGeneral, noFilm, camera)).
move(state(dachaGeneral, noFilm, camera), shootTheFilm, state(dachaGeneral, film, camera)).

move(state(garageOutCity, noFilm, noCamera), go, state(officeCompany, noFilm, camera)).
move(state(officeCompany, noFilm, camera), shootTheFilm, state(officeCompany, film, camera)).

victory(state(dachaGeneral, film, camera), []).
victory(state(officeCompany, film, camera), []).

victory(CurrentState, [CurrentMoveDescription | NextMoves]) :-
        move(CurrentState, CurrentMoveDescription, NextState),
        victory(NextState, NextMoves).
