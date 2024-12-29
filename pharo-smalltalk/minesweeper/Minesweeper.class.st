Class {
    #name : #Minesweeper,
    #superclass : #Object,
    #category : #'Exercise@Minesweeper'
}

{ #category : #exercism }
Minesweeper >> annotateMinefield: aField [
    | result |
    result := Array new: aField size.
    aField withIndexDo: [ :row :i |
        | annotated |
        annotated := ''.
        row withIndexDo: [ :cell :j |
            | bombs |
            bombs := 0.
        
            (cell isSpaceSeparator) ifTrue: [
                bombs := self countBombs: aField at: i at: j.
            ].

            (bombs > 0) ifTrue: [
                annotated := annotated, bombs asString.
            ] ifFalse: [
                annotated := annotated, cell asString.
            ]].
        result at: i put: annotated.
    ].
    ^ result
]

Minesweeper >> countBombs: aField at: i at: j [
    | dir count |
    dir := #((-1 -1) (-1 0) (-1 1) (0 -1) (0 1) (1 -1) (1 0) (1 1)).
    count := 0.

    dir do: [ :d |
        | ni nj |
        ni := i + (d first).
        nj := j + (d second).
        (self isValidCellIn: aField at: ni at: nj) ifTrue: [
            (((aField at: ni) at: nj) = $*) ifTrue: [
                count := count + 1.
            ]].
    ].
    ^ count
]

Minesweeper >> isValidCellIn: aField at: i at: j [
    ^ (i > 0 and: [ i <= aField size ])
        and: [ (j > 0 and: [ j <= (aField at: 1) size ]) ]
]
