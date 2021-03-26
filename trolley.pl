% rails
% pantograph
% mast
% exhaust
% 

rails(skoda_tram).
rails(tatra).

pantograph(skoda_tram).

mast(tatra).
mast(solaris_trollino).
mast(skoda_trolley).

exhaust(skoda_trolley).
exhaust(solaris_urbino).
exhaust(mercedes).
exhaust(icarus).

tram(X) :-
    rails(X),
    pantograph(X);
    rails(X),
    mast(X).

hybrid(X) :-
    exhaust(X),
    trolleybus(X).

trolleybus(X) :-
    mast(X), % X will not be just a variable from this line. If we use just X variable
    % then enumeration will be cutted on the tbus and will not be enumerating others
    % So we need to concretinize X before putting it into tbus.
    not_rail(X).

% Classificator
not_rail(X) :-
    rails(X), !, fail; % CUT (new predicate) - is not NOT operator. It tells that inner
    % (current) enumeration is the last enumeration. If we know that it has rails - then it is fail.
    % If is not rails - then we are going to the mast through the ; (OR) statement
    % CUT - affects enumeration
    true. 

bus(X) :- 
    exhaust(X), 
    not_rail(X),
    not_trolley(X).

% Classificator
not_trolley(X) :- 
    trolleybus(X), !, fail; 
    true.

% Task 3 - write this program for Hybrids
%hybrid(X) :-
%    exhaust(X),
%    mast(X),
    
% Task 4 - bus