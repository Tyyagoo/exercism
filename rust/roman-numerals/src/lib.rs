use std::fmt::{Display, Formatter, Result};

pub struct Roman(String);

const NUMERALS: [(&str, u32); 13] = [
    ("M", 1000), ("CM", 900), ("D", 500), ("CD", 400), ("C", 100), ("XC", 90),
    ("L", 50), ("XL", 40), ("X", 10), ("IX", 9), ("V", 5), ("IV", 4), ("I", 1)
];

impl Display for Roman {
    fn fmt(&self, _f: &mut Formatter<'_>) -> Result {
        write!(_f, "{}", self.0)
    }
}

impl From<u32> for Roman {
    fn from(mut num: u32) -> Self {
        let mut s = String::with_capacity(7 * 3);

        for &(numeral, value) in NUMERALS.iter() {
            while num >= value {
                s.push_str(numeral);
                num -= value;
            }
        }

        Roman(s)
    }
}
