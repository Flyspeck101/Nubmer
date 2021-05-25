class Number: Numeric {
  // this class inherits the protocol Numeric, which inherits AdditiveArithmetic 
  // and ExpressibleByIntegerLiteral. AdditiveArithmetic inherits Equatable.
  
  private let Digit = (0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
  private var posDigits: [Int]
  private var negDigits: [Int]
  var magnitudeBounds: (Int, Int) { (posDigits.count - 1, -(negDigits.count - 1)) }
  
  // Equatable
  static func == (lhs: Number, rhs: Number) -> Bool {
    if lhs.magnitudeBounds == rhs.magnitudeBounds {
      private var index = 0
      for digit in lhs.posDigits {
        if rhs.posDigits[index] != digit {
          return false
        }
      }
      index = 0 
      for digit in lhs.negDigits {
        if rhs.negDigits[index] != digit {
          return false
        }
      }
      return true
    }
    return false
  }
  
  // AdditiveArithmetic
  static var zero = Number(digits: [0])
  
  
  
  init(digits: [Int], decimalPlaces: [Int] = [0]) {
    posDigits = digits
    negDigits = decimalPlaces
  }
}
