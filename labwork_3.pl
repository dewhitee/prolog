/* Tree representation: 
 *                           /--------------------------- root ----------------------------\
 *                          /                              |                                \
 *              /----------a---------\               /-----b----\               /------------c-----------\
 *             /           |          \             /            \             /             |            \
 *        /--aa--\        ab      /---ac---\       ba        /---bb---\       ca     /------cb-----\       cc
 *       /       \        |      /    |     \               /    |     \            /     /   \     \
 *     aaa       aab     aba   aca   acb   acc            bba   bbb   bbc         cba  cbb   cbc   cbd
 */

tree(root(
    a(aa(aaa, aab), ab(aba), ac(aca, acb, acc)), 
    b(ba, bb(bba, bbb, bbc)), 
    c(ca, cb(cba, cbb, cbc, cbd), cc))).

find(X, Path) :-
    tree(Tree),
    checkChildren(X, [Tree], Path).

check(X, [Node | Kids], Path) :-
    checkHead(X, Node, Path);
    checkChildren(X, Kids, KidsPath),
    Path = [Node | KidsPath].

checkHead(X, Node, [Node]) :-
    is_substr(X, Node).

checkChildren(X, [Kid | _], Path) :-
    Kid =.. Vertices,
    check(X, Vertices, Path).

checkChildren(X, [_ | Tail], Path) :-
    checkChildren(X, Tail, Path).

is_substr(Substr, Str) :-
    sub_atom(Str, _, _, _, Substr).