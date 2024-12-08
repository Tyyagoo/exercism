class Diamond {
  static ord(c) {
    return c.codePoints[0]
  } 

  static chr(i) {
    return String.fromCodePoint(i)
  }
  
  static size(letter) {
    return (ord(letter) - 65) * 2 + 1
  }

  static innerGap(byte) {
    return (byte == 65) ? 0 : (byte - 65) * 2 - 1
  }
  
  static rows(letter) {
    var len = size(letter)
    var diamond = []

    for (i in 65..ord(letter)) {
      diamond.add(row(i, len))
    }

    if (letter != "A") {
      for (i in (ord(letter) - 1)..65) {
        diamond.add(row(i, len))
      }
    }

    return diamond
  }

 static row(byte, len) {
   var gap = innerGap(byte)
   var side = " " * ((len - gap - 1) / 2).floor
   var middle = " " * gap
   return side + chr(byte) + middle + (byte != 65 ? chr(byte) : "") + side
 }
}