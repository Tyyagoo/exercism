module main

import datatypes
import math { min }

enum BucketId {
	one
	two
}

struct Solution {
	moves        int
	goal_bucket  BucketId
	other_bucket int
}

pub fn measure(cap_one int, cap_two int, goal int, start_bucket BucketId) !Solution {
    main, other := if start_bucket == .one { cap_one, cap_two } else { cap_two, cap_one }
    other_bucket := if start_bucket == .one { BucketId.two } else { BucketId.one }

    mut queue := datatypes.Queue[[]int]{}
    queue.push([main, 0, 1])
    mut visited := datatypes.Set[string]{}
    visited.add('$main,0')
    visited.add('0,$other')

    for queue.len() > 0 {
        state := queue.pop()!
        x := state[0]
        y := state[1]
        moves := state[2]

        if x == goal {
            return Solution { moves: moves, goal_bucket: start_bucket, other_bucket: y }
        }

        if y == goal {
            return Solution { moves: moves, goal_bucket: other_bucket, other_bucket: x }
        }

        mut next_states := [
            [main, y], // Fill main bucket
            [x, other], // Fill other bucket
            [0, y], // Empty main bucket
            [x, 0], // Empty other bucket
            [x - min(x, other - y), y + min(x, other - y)], // Pour main into other
            [x + min(y, main - x), y - min(y, main - x)] // Pour other into main
        ]

        for next_state in next_states {
            key := '${next_state[0]},${next_state[1]}'
            if !visited.exists(key) {
                visited.add(key)
                queue.push([next_state[0], next_state[1], moves + 1])
            }
        }
    }

    return error('impossible')
}
