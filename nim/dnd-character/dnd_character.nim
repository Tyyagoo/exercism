import math
import random
import sequtils
import algorithm
import std/[sugar]
  
type
  Character* = object
    strength*: int
    dexterity*: int
    constitution*: int
    intelligence*: int
    wisdom*: int
    charisma*: int
    hitpoints*: int

proc ability*: int =
  var rolls = map(toSeq(0..3), x => rand(5) + 1)
  rolls.sort()
  sum(rolls[1..3])

proc modifier*(n: int): int =
  int(floor((n - 10) / 2))

proc initCharacter*: Character =
  var constitution = ability()
  Character(
    strength: ability(),
    dexterity: ability(),
    constitution: constitution,
    intelligence: ability(),
    wisdom: ability(),
    charisma: ability(),
    hitpoints: 10 + modifier(constitution)
  )
