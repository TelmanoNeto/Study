vogal('a'). vogal('e'). vogal('i'). vogal('o'). vogal('u').
consoante('b'). consoante('c'). consoante('d'). consoante('f'). consoante('g'). consoante('h'). consoante('j'). consoante('k'). consoante('l'). consoante('m').
consoante('n'). consoante('p'). consoante('q'). consoante('r'). consoante('s'). consoante('t'). consoante('v'). consoante('w'). consoante('x'). consoante('y'). consoante('z').

alfabetico(Char) :-
    vogal(Char) ; consoante(Char).
    
verifica_alfabetico([]).
verifica_alfabetico([H|T]) :-
    alfabetico(H), verifica_alfabetico(T).
    
primeiro_caractere([], _) :- fail.
primeiro_caractere([H|T], Primeiro) :-
    (alfabetico(H) -> Primeiro = H ; primeiro_caractere(T, Primeiro)).
    
ultimo_caractere(Lista, Ultimo) :-
    reverse(Lista, Reversed),
    primeiro_caractere(Reversed, Ultimo).
    
classificar(Nome) :-
    atom_chars(Nome, Chars),
    maplist(downcase_atom, Chars, LowerChars),
    (verifica_alfabetico(LowerChars)->
        (primeiro_caractere(LowerChars, Primeiro),
        ultimo_caractere(LowerChars, Ultimo),
        mensagem(Primeiro, Ultimo, Mensagem),
        format('~w, ~w.~n',[Nome, Mensagem]));
        format('~w contém símbolos não alfabéticos.~n', [Nome])).
        
mensagem(Primeiro, Ultimo, 'você é uma pessoa muito legal') :-
    vogal(Primeiro), vogal(Ultimo).
    
mensagem(Primeiro, Ultimo, 'você é genial e cativante') :-
    vogal(Primeiro), consoante(Ultimo).
    
mensagem(Primeiro, Ultimo, 'você é destoante e sem igual') :-
    consoante(Primeiro), vogal(Ultimo).
    
mensagem(Primeiro, Ultimo, 'você é uma pessoa muito interessante') :-
    consoante(Primeiro), consoante(Ultimo).
    
downcase_atom(Atom, Lower) :-
    atom_codes(Atom,[Code]),
    Code >= 65, Code =< 90,
    LowerCode is Code + 32,
    atom_codes(Lower, [LowerCode]).
downcase_atom(Atom, Atom).