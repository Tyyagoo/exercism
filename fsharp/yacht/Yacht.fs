module Yacht

type Category =
    | Ones
    | Twos
    | Threes
    | Fours
    | Fives
    | Sixes
    | FullHouse
    | FourOfAKind
    | LittleStraight
    | BigStraight
    | Choice
    | Yacht

type Die =
    | One
    | Two
    | Three
    | Four
    | Five
    | Six

let dieToNum =
    function
    | One -> 1
    | Two -> 2
    | Three -> 3
    | Four -> 4
    | Five -> 5
    | Six -> 6

let scoreNumber die dice =
    dice |> List.filter ((=) die) |> List.sumBy dieToNum

let score category dice =
    let sortedDice = List.sort dice
    let areAllSame = List.forall ((=) (List.head sortedDice)) sortedDice

    match category, sortedDice with
    | Ones, _ -> scoreNumber One dice
    | Twos, _ -> scoreNumber Two dice
    | Threes, _ -> scoreNumber Three dice
    | Fours, _ -> scoreNumber Four dice
    | Fives, _ -> scoreNumber Five dice
    | Sixes, _ -> scoreNumber Six dice
    | FullHouse, [ x; y; a; b; c ] when x = y && a = b && b = c && x <> a -> dieToNum x * 2 + dieToNum a * 3
    | FullHouse, [ a; b; c; x; y ] when a = b && b = c && x = y && a <> x -> dieToNum a * 3 + dieToNum x * 2
    | FullHouse, _ -> 0
    | FourOfAKind, [ a; b; c; d; _ ] when a = b && b = c && c = d -> dieToNum a * 4
    | FourOfAKind, [ _; a; b; c; d ] when a = b && b = c && c = d -> dieToNum a * 4
    | FourOfAKind, _ -> 0
    | LittleStraight, [ One; Two; Three; Four; Five ] -> 30
    | LittleStraight, _ -> 0
    | BigStraight, [ Two; Three; Four; Five; Six ] -> 30
    | BigStraight, _ -> 0
    | Choice, _ -> dice |> List.sumBy dieToNum
    | Yacht, _ when areAllSame -> 50
    | Yacht, _ -> 0
