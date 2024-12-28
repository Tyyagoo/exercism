zebra_owner(Owner) :-
    solution(Houses),
    member(house(Owner, _, zebra, _, _),Houses).

water_drinker(Drinker) :-
    solution(Houses),
    member(house(Drinker, _, _, water, _), Houses).

solution(Houses) :-
    permutation([
        house(norwegian, _, _, _, _),
        house(englishman, red, _, _, _),
        house(ukrainian, _, _, tea, _),
        house(japanese, _, _, _, chess),
        house(spaniard, _, dog, _, _)
    ], Houses),
    member(house(_, green, _, coffee, _), Houses),
    member(house(_, _, snail, _, dancing), Houses),
    member(house(_, yellow, _, _, painting), Houses),
    member(house(_, _, _, orange_juice, football), Houses),
    first(house(norwegian, _, _, _, _), Houses),
    middle(house(_, _, _, milk, _), Houses),
    right_of(house(_, green, _, _, _), house(_, ivory, _, _, _), Houses),
    next_to(house(_, _, _, _, reading), house(_, _, fox, _, _), Houses),
    next_to(house(_, _, _, _, painting), house(_, _, horse, _, _), Houses),
    next_to(house(norwegian, _, _, _, _), house(_, blue, _, _, _), Houses).

first(House, [House, _, _, _, _]).

middle(House, [_, _, House, _, _]).

right_of(House, Neighbor, Houses) :-
    nth0(NH, Houses, House),
    nth0(NN, Houses, Neighbor),
    Diff is NH - NN,
    Diff =:= 1.

next_to(House, Neighbor, Houses) :-
    nth0(NH, Houses, House),
    nth0(NN, Houses, Neighbor),
    Diff is abs(NH - NN),
    Diff =:= 1.