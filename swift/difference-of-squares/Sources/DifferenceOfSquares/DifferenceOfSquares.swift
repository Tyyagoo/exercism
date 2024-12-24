import Foundation

class Squares {
  var squareOfSum : Int
  var sumOfSquares : Int
  var differenceOfSquares : Int
  
  init(_ n: Int) {
    self.squareOfSum = Int(pow(Double((n * (n + 1)) / 2), 2))
    self.sumOfSquares = (n * (n + 1) * (2 * n + 1)) / 6
    self.differenceOfSquares = self.squareOfSum - self.sumOfSquares
  }
}
