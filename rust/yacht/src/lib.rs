use Category::*;

#[derive(Debug, Clone, Copy)]
pub enum Category {
    Ones = 1,
    Twos = 2,
    Threes = 3,
    Fours = 4,
    Fives = 5,
    Sixes = 6,
    FullHouse,
    FourOfAKind,
    LittleStraight,
    BigStraight,
    Choice,
    Yacht,
}

type Dice = [u8; 5];

pub fn score(mut dice: Dice, category: Category) -> u8 {
    dice.sort_unstable();
    match (category, dice) {
        (Ones | Twos | Threes | Fours | Fives | Sixes, _) => dice.iter().filter(|x| **x == category as u8).sum(),
        (FullHouse, [a, b, c, d, e]) if a == b && a == c && d == e && a != d => a * 3 + d * 2,
        (FullHouse, [a, b, c, d, e]) if a == b && (a == c || c == d) && c == e && a != e => a + b + c + d + e,
        (FourOfAKind, [a, b, c, d, _] | [_, a, b, c, d]) if a == b && a == c && a == d => a * 4,
        (LittleStraight, [1, 2, 3, 4, 5]) => 30,
        (BigStraight, [2, 3, 4, 5, 6]) => 30,
        (Choice, _) => dice.iter().sum(),
        (Yacht, [a, b, c, d, e]) if a == b && a == c && a == d && a == e => 50,
        _ => 0,
    }
}
