:- use_module(library(clpfd)).

maximum_value(Items, Capacity, Value) :-
    \+ (member(item(Weight, _), Items), Weight > Capacity),
    length(Items, N),
    length(Selected, N),
    Selected ins 0..1,

    maplist(value, Items, Values),
    maplist(weight, Items, Weights),

    scalar_product(Weights, Selected, #=<, Capacity),
    scalar_product(Values, Selected, #=, Value),
    
    labeling([max(Value)], Selected),
    !.
    
    
weight(item(Weight, _), Weight).

value(item(_, Value), Value).