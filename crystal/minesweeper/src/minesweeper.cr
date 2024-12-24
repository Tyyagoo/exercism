class Minesweeper
  @board : Array(String)
  @rows : Int32
  @cols : Int32

  def initialize(board)
    @board = board
    @rows = board.size
    @cols = board.empty? ? 0 : board[0].size
  end

  def annotate
    directions = [
      {-1, 0}, {1, 0}, {0, -1}, {0, 1},
      {-1, -1}, {-1, 1}, {1, -1}, {1, 1}
    ]

    result = [] of String

    @board.each_with_index do |row, i|
      new_line = ""
      row.each_char_with_index do |char, j|
        if char == '*'
          new_line += "*"
          next
        end
        mines = 0
        directions.each do |(x, y)|
          next if i + x < 0 || i + x >= @rows || j + y < 0 || j + y >= @cols
          cell = @board[i + x][j + y]
          mines += 1 if cell == '*'
        end
        new_line += mines == 0 ? " " : mines.to_s
      end
      result << new_line
    end

    result
  end
end
