import Foundation

enum PhoneNumberError: Error {
  case invalidPhoneNumber
}

class PhoneNumber {
  var number: String

  init(_ str: String) {
    self.number = str
  }

  func clean() throws -> String {
    let pattern = #"^\+?1?\s*\(?([2-9][0-9]{2})\)?[.\s]*([2-9][0-9]{2})[.\s-]*([0-9]{4})\s*$"#
    let regex = try NSRegularExpression(pattern: pattern)
    let matches = regex.matches(in: self.number, range: NSRange(self.number.startIndex..., in: self.number))

    guard let match = matches.first else {
      throw PhoneNumberError.invalidPhoneNumber
    }

    let area = Range(match.range(at: 1), in: self.number).map { String(self.number[$0]) } ?? ""
    let ex1 = Range(match.range(at: 2), in: self.number).map { String(self.number[$0]) } ?? ""
    let ex2 = Range(match.range(at: 3), in: self.number).map { String(self.number[$0]) } ?? ""
    return "\(area)\(ex1)\(ex2)"
  }
}
