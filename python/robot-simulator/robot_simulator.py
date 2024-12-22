DIRECTIONS = [(1, 0), (0, 1), (-1, 0), (0, -1)]
EAST, NORTH, WEST, SOUTH = DIRECTIONS

class Robot:
    def __init__(self, direction=NORTH, x_pos=0, y_pos=0):
        self.direction = direction
        self.coordinates = (x_pos, y_pos)

    def move(self, commands):
        for cmd in commands:
            match cmd:
                case 'R': self.turn_right()
                case 'L': self.turn_left()
                case 'A': self.advance()

    def turn_right(self):
        self.direction = DIRECTIONS[(DIRECTIONS.index(self.direction) - 1) % 4]

    def turn_left(self):
        self.direction = DIRECTIONS[(DIRECTIONS.index(self.direction) + 1) % 4]

    def advance(self):
        x, y = self.coordinates
        px, py = self.direction
        self.coordinates = (x + px, y + py)
        