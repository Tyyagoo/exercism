pub fn check(candidate: &str) -> bool {
    let mut bitset: u32 = 0;
    for chr in candidate.to_lowercase().chars() {
        if chr.is_ascii_lowercase() {
            let pos = 1u32 << (chr as u32 - 'a' as u32);
            if bitset & pos != 0 { return false; }
            bitset |= pos;
        }
    }
    true
}