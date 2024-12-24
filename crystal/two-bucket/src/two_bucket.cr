module TwoBucket
  enum Bucket
    One
    Two
  end

  struct Result
    property moves, other_bucket, goal_bucket

    def initialize(@moves : UInt32, @other_bucket : UInt32, @goal_bucket : Bucket)
    end
  end

  def self.measure(bucket_one : UInt32, bucket_two : UInt32, goal : UInt32, start_bucket : Bucket)
    main, other = start_bucket == Bucket::One ? {bucket_one, bucket_two} : {bucket_two, bucket_one}

    # {bucket_one, bucket_two, moves}
    queue = [] of {UInt32, UInt32, UInt32, Array(String)}
    queue << {main, 0_u32, 1_u32, ["Fill #{start_bucket}"]}

    visited = Set({UInt32, UInt32}).new
    visited << {main, 0_u32}
    visited << {0_u32, other} # Just prevent this state

    other_bucket = start_bucket == Bucket::One ? Bucket::Two : Bucket::One

    while queue.size > 0
      x, y, moves, history = queue.shift
      puts history if x == goal || y == goal
      return Result.new(moves, y, start_bucket) if x == goal
      return Result.new(moves, x, other_bucket) if y == goal

      add_state = ->(next_states : Array({UInt32, UInt32, String}), state : {UInt32, UInt32, String}) do
        next_states << state unless visited.includes?({state[0], state[1]})
      end

      next_states = [] of {UInt32, UInt32, String}
      add_state.call(next_states, {main, y, "Fill #{start_bucket}"})
      add_state.call(next_states, {x, other, "Fill #{other_bucket}"})
      add_state.call(next_states, {0_u32, y, "Empty #{start_bucket}"})
      add_state.call(next_states, {x, 0_u32, "Empty #{other_bucket}"})
      add_state.call(next_states, {x - [x, other - y].min, y + [x, other - y].min, "Pour #{start_bucket}"})
      add_state.call(next_states, {x + [y, main - x].min, y - [y, main - x].min, "Pour #{other_bucket}"})

      next_states.each do |nx, ny, action|
        unless visited.includes?({nx, ny})
          visited << {nx, ny}
          queue << {nx, ny, moves + 1, history + [action]}
        end
      end
    end

    raise ArgumentError.new("No solution found :(")
  end
end
