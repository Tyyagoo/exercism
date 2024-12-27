zip = (arr) ->
  len = arr.length - 1
  (arr.slice(i, i + 2) for i in [0...len])

sum = (arr) ->
  arr.reduce ((acc, x) -> acc + x), 0

generateRow = (previousRow) ->
  middle = zip(previousRow).map(sum)
  [1].concat(middle, [1])

class PascalsTriangle
  rows: (num) ->
    acc = if num > 0 then [[1]] else []

    for i in [1...num] by 1
      acc.push(generateRow(acc[acc.length - 1]))

    acc

module.exports = PascalsTriangle
