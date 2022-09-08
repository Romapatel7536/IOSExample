
protocol Product {
  associatedtype Code
  var productCode : Code {get}
  func description() -> String
}

struct Laptop : Product {
  typealias Code = String
  var productCode: String

  func description() -> String {
    "This is Laptop"
  }
}

struct Keyboard : Product {
  typealias Code = Int
  var productCode: Int

  func description() -> String {
    "This is keyboard"
  }
}

struct Factory {
  func makeProducts() -> some Product {

    return Laptop(productCode: "Test")
  }
}

func SquareArrayElement<T: Numeric>(array: Array<T>) -> some Sequence {
  return array.lazy.map{$0*$0}
}

SquareArrayElement(array: [1,2,3]).forEach { element in
    print(element)
}

protocol Shape {
    func draw() -> String
}

struct Triangle: Shape {
    var size: Int
    func draw() -> String {
        var result: [String] = []
        for length in 1...size {
            result.append(String(repeating: "*", count: length))
        }
        return result.joined(separator: "\n")
    }
}
let smallTriangle = Triangle(size: 3)
print(smallTriangle.draw())

struct FlippedShape<T: Shape>: Shape {
    var shape: T
    func draw() -> String {
        let lines = shape.draw().split(separator: "\n")
        return lines.reversed().joined(separator: "\n")
    }
}
let flippedTriangle = FlippedShape(shape: smallTriangle)
print(flippedTriangle.draw())

struct JoinedShape<T: Shape, U: Shape>: Shape {
    var top: T
    var bottom: U
    func draw() -> String {
        return top.draw() + "\n" + bottom.draw()
    }
}
let joinedTriangles = JoinedShape(top: smallTriangle, bottom: flippedTriangle)
print(joinedTriangles.draw())

struct Square: Shape {
  var size: Int
  func draw() -> String {
    let line = String(repeating: "*", count: size)
    let result = Array<String>(repeating: line, count: size)
    return result.joined(separator: "\n")
  }
}

func makeTrapezoid() -> some Shape {
    let top = Triangle(size: 2)
    let middle = Square(size: 2)
    let bottom = FlippedShape(shape: top)
    let trapezoid = JoinedShape(
      top: top,
      bottom: JoinedShape(top: middle, bottom: bottom))
    return trapezoid
}

let trapezoid = makeTrapezoid()
print("----")
print(trapezoid.draw())

func sum(a: Int, b: Int) -> Int {
 return a + b
}

let a = sum(a: 10, b:20)
print(a)


func sumDouble(a: Double, b: Double) -> Double {
    return a + b
}

let double = sumDouble(a: 10.5, b: 2.5)
print(double)

func sumString(fname: String, sname: String) -> String {
    return fname + sname
}

let name = sumString(fname: "Hello", sname: "world")
print(name)

func sum1<Roma: AdditiveArithmetic>(a: Roma, b: Roma) -> Roma {
 return a + b
}

let intV = sum1(a: 10, b: 1)
print(intV)

let intd = sum1(a: 10.0, b: 1.01)
print(intd)

let siring = sum1(a: "10.0", b: "1.01")
print(siring)

extension String : AdditiveArithmetic {
    public static func - (lhs: String, rhs: String) -> String {
        return ""
    }

    public static var zero: String {
        return "zero"
    }
}
