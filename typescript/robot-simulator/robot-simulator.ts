export class InvalidInputError extends Error {
  constructor(message: string) {
    super()
    this.message = message || 'Invalid Input'
  }
}

type Direction = 'north' | 'east' | 'south' | 'west'
type Coordinates = [number, number]

const DIRECTION: Record<Direction, Coordinates> = {
  north: [0, 1],
  east: [1, 0],
  south: [0, -1],
  west: [-1, 0],
}

export class Robot {
  pos: Coordinates = [0, 0]
  dir: Direction = 'north'
  
  get bearing(): Direction {
    return this.dir
  }

  get coordinates(): Coordinates {
    return this.pos
  }

  place({x, y, direction = 'north'}: { x: number; y: number; direction: string }) {
    if (!['north', 'east', 'south', 'west'].includes(direction)) {
      throw new InvalidInputError('')
    }
    
    this.pos = [x, y]
    this.dir = direction as Direction
  }

  evaluate(instructions: string) {
    const dirs = Object.keys(DIRECTION)
    for (const cmd of instructions) {
      if (cmd == 'A') {
        const [mx, my] = DIRECTION[this.bearing]
        const [x, y] = this.pos
        this.pos = [x + mx, y + my]
        continue
      }

      const rotate = cmd == 'R' ? 1 : -1
      this.dir = dirs[(dirs.indexOf(this.dir) + rotate + 4) % 4] as Direction
    }
  }
}
