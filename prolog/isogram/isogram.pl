isogram(Phrase) :-
    string_lower(Phrase, String),
    atom_chars(String, Chars),
    is_isogram(Chars).

is_isogram([]).
is_isogram([Head | Tail]) :-
    \+ char_type(Head, alpha); % early ret
    \+ member(Head, Tail), % not member
    is_isogram(Tail).
