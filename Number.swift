class Number: Numeric {
  // this class inherits the protocol Numeric, which inherits AdditiveArithmetic 
  // and ExpressibleByIntegerLiteral. AdditiveArithmetic inherits Equatable.
  
  private let Digit = (0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
  private var posDigits: [Int]
  private var negDigits: [Int]
  var magnitudeBounds: (Int, Int) { (posDigits.count - 1, -(negDigits.count - 1)) }
  var sign: Bool
  
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
  
  static func + (lhs: Number, rhs: Number) -> Number {
    private var pos = []
    private var neg = []
    private var _lhs = lhs.negDigits
    _lhs.reverse()
    private var _rhs = rhs.negDigits
    _rhs.reverse()
    if _lhs.count != _rhs.count {
      if _lhs.count > _rhs.count {
        for _ in 1 ..< _rhs.count { neg.append(0) }
        var index = _rhs.count
        while index < _lhs.count {
          neg.append(_lhs[index])
        }
      } else {
        for _ in 1 ..< _lhs.count { neg.append(0) }
        var index = _lhs.count
        while index < _rhs.count {
          neg.append(_rhs[index])
        }
      }
    }
  }
  
  init(digits: [Int], decimalPlaces: [Int] = [0], sign: Bool = true) {
    posDigits = digits
    negDigits = decimalPlaces
    self.sign = sign
  }
}
