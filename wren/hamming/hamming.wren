class Hamming {
  static compute(first, second) {
    var len = first.count
    if (len != second.count) Fiber.abort("strands must be of equal length")
    if (len == 0) return 0

    var diff = 0
    for (i in 0..len-1) {
      if (first[i] != second[i]) diff = diff + 1
    }
    
    return diff
  }
}
