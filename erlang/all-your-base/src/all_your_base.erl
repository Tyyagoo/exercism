-module(all_your_base).
-export([rebase/3]).

rebase(_, N, _) when N < 2 ->
    {error, "input base must be >= 2"};
rebase(_, _, N) when N < 2 ->
    {error, "output base must be >= 2"};
rebase(Digits, InputBase, OutputBase) ->
    case to_decimal(Digits, InputBase, 0) of
        {ok, Dec} -> {ok, to_digits(Dec, OutputBase, [])};
        {error, Reason} -> {error, Reason}
    end.

to_decimal([], Base, Acc) ->
    {ok, Acc};
to_decimal([Head | Tail], Base, _) when Head >= Base orelse Head < 0 ->
    {error, "all digits must satisfy 0 <= d < input base"};
to_decimal([Head | Tail], Base, Acc) ->
    to_decimal(Tail, Base, Acc * Base + Head).

to_digits(0, _, []) ->
    [0];
to_digits(0, _, Acc) ->
    Acc;
to_digits(Number, Base, Acc) ->
    to_digits(Number div Base, Base, [Number rem Base | Acc]).