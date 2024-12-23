import gleam/list
import gleam/string

pub type Robot {
  Robot(direction: Direction, position: Position)
}

pub type Direction {
  North
  East
  South
  West
}

pub type Position {
  Position(x: Int, y: Int)
}

pub fn create(direction: Direction, position: Position) -> Robot {
  Robot(direction, position)
}

pub fn move(
  direction: Direction,
  position: Position,
  instructions: String,
) -> Robot {
  instructions
  |> string.split("")
  |> list.fold(create(direction, position), execute_command)
}

fn execute_command(robot: Robot, cmd: String) -> Robot {
  case cmd {
    "A" -> advance(robot)
    "L" -> turn_left(robot)
    "R" -> turn_right(robot)
    _ -> robot 
  }
}

fn advance(robot: Robot) -> Robot {
  let Position(x, y) = robot.position
  case robot.direction {
    North -> Robot(robot.direction, Position(x, y + 1))
    East -> Robot(robot.direction, Position(x + 1, y))
    South -> Robot(robot.direction, Position(x, y - 1))
    West -> Robot(robot.direction, Position(x - 1, y))
  }
}

pub fn turn_right(robot: Robot) -> Robot {
  let new_direction = case robot.direction {
    North -> East
    East -> South
    South -> West
    West -> North
  }
  Robot(new_direction, robot.position)
}

pub fn turn_left(robot: Robot) -> Robot {
  let new_direction = case robot.direction {
    North -> West
    West -> South
    South -> East
    East -> North
  }
  Robot(new_direction, robot.position)
}
