use std::collections::HashMap;
use std::thread;

pub fn frequency(input: &[&str], worker_count: usize) -> HashMap<char, usize> {
    let count = |input: &[&str]| {
        let mut result = HashMap::new();
        for line in input {
            for chr in line
                .chars()
                .filter(|c| c.is_alphabetic())
                .map(|c| c.to_ascii_lowercase())
            {
                *result.entry(chr).or_default() += 1;
            }
        }
        result
    };

    return match input.len() {
        0 => HashMap::new(),
        n if n < 500 => count(input),
        _ => thread::scope(|s| {
            let mut handles = Vec::with_capacity(worker_count);
            for chunks in input.chunks(input.len() / worker_count + 1) {
                handles.push(s.spawn(|| count(chunks)));
            }

            let mut result = handles.pop().unwrap().join().unwrap();
            for res in handles {
                res.join().unwrap().into_iter().for_each(|(k, v)| {
                    *result.entry(k).or_default() += v;
                })
            }

            result
        }),
    };
}
