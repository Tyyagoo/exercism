module TwoBucket exposing (BucketNumber(..), measure)

import Basics exposing (min)

type BucketNumber
    = One
    | Two


type alias State =
    { moves : Int, bucketOne : Int, bucketTwo : Int }

initialState : State
initialState = { moves = 0, bucketOne = 0, bucketTwo = 0}

measure : Int -> Int -> Int -> BucketNumber -> Maybe State
measure bucketOneSize bucketTwoSize goal startBucket =
    let
        b1 = (One, bucketOneSize)
        b2 = (Two, bucketTwoSize)
    in
        case startBucket of
            One ->
                doMeasure (fill initialState One bucketOneSize) b1 b2 goal
            Two ->
                doMeasure (fill initialState Two bucketTwoSize) b2 b1 goal

doMeasure : State -> (BucketNumber, Int) -> (BucketNumber, Int) -> Int -> Maybe State
doMeasure state (main, mainCap) (sub, subCap) goal =
    if state.bucketOne == goal || state.bucketTwo == goal then
        Just state
    
    else if state.moves > 20 then
        Nothing

    else
        let
            newState =
                if subCap == goal then
                    fill state sub subCap
                else if (getValue state sub) == subCap then
                    empty state sub
                else if (getValue state main) == 0 then
                    fill state main mainCap
                else
                    pour state sub subCap
        in
            doMeasure newState (main, mainCap) (sub, subCap) goal

getValue : State -> BucketNumber -> Int
getValue state bucket =
    case bucket of
        One ->
            state.bucketOne
        Two ->
            state.bucketTwo

fill : State -> BucketNumber -> Int -> State
fill state bucket cap =
    case bucket of
        One ->
            { state | moves = state.moves + 1, bucketOne = cap}
        Two ->
            { state | moves = state.moves + 1, bucketTwo = cap}

empty : State -> BucketNumber -> State
empty state bucket =
    case bucket of
        One ->
            { state | moves = state.moves + 1, bucketOne = 0}
        Two ->
            { state | moves = state.moves + 1, bucketTwo = 0}

pour : State -> BucketNumber -> Int -> State
pour { moves, bucketOne, bucketTwo } into cap =
    case into of
        One ->
            let
                pourAmount = min bucketTwo (cap - bucketOne)
            in
                { moves = moves + 1, bucketOne = bucketOne + pourAmount, bucketTwo = bucketTwo - pourAmount }
        Two ->
            let
                pourAmount = min bucketOne (cap - bucketTwo)
            in
                { moves = moves + 1, bucketOne = bucketOne - pourAmount, bucketTwo = bucketTwo + pourAmount }