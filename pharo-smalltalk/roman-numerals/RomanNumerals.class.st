Class {
    #name : #RomanNumerals,
    #superclass : #Object,
    #classVars : [
        'numerals'
    ],
    #category : #'Exercise@RomanNumerals'
}

{ #category : #'class initialization' }
RomanNumerals class >> initialize [
    numerals := #(
        #(1000 'M') #(900 'CM') #(500 'D') #(400 'CD') #(100 'C') #(90 'XC')
        #(50 'L') #(40 'XL') #(10 'X') #(9 'IX') #(5 'V') #(4 'IV') #(1 'I')
    )
]

{ #category : #exercism }
RomanNumerals >> romanNumber: aNumber [
    | n str |
    n := aNumber.
    str := WriteStream on: String new.
    
    numerals do: [ :p |
        [ n >= (p first) ] whileTrue: [
                n := n - (p first).
                str nextPutAll: (p second) ] ].
    ^str contents.
]
