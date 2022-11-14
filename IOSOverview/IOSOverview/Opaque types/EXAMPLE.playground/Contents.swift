
func sum<T: AdditiveArithmetic> (a: T, b: T) -> T {
    return a + b
}

print(sum(a: 10, b: 20))

// Combine Example


var a = -15 % 4
print(a)

let threeMoreDoubleQuotationMarks = ##"""
Here are three more double quotes: """#
"""##

print(threeMoreDoubleQuotationMarks)

class A : Equatable {
    static func == (lhs: A, rhs: A) -> Bool {
        return lhs.a == rhs.a
    }

    var a = 10
}
var a1 = A()
var b = A()
b.a = 5
a1 == b

for i in 0...10 {
    if(i<5) {
        continue
    }
    print(i)
}


// Closure

let square = { (number: Int) -> (Int) in
    return number * number
}
square(2)


let names = ["a", "b", "d", "w", "c", "o"]
let reversedNames = names.sorted(by: { s1, s2 in s1 > s2 } )
print(reversedNames)


print("-----------------------")
struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}

print(Matrix(rows: 2, columns: 2))

let greet = { (name: String)  in
 print(name)
}
print(greet)

func greet(name: String) {
    print(name)
}

greet(name: "Roma")

let addition = { (a: Int, b: Int) -> Int  in

    return a + b
}

print(addition(10,20))

class TestA {
    var completion: ((Bool) -> Void)?
    func callCompletion() {
        completion?(true)
    }

    func setUpCloser(complition: @escaping (Bool)->Void) {
        self.completion = complition
    }
}

let classa = TestA()
classa.setUpCloser {
  print("fgndfg\($0)")
}
classa.callCompletion()

let numbers = [1, 2 , 3]
let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let strings = numbers.map {
    var number = $0
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output
}

var helo = "abc"
var abc2 = { [helo] in
    print(helo)
}
helo = "xyz"
print(abc2())

enum hello {
    case east
    case west
    case south
    case north
    case extra(abc: String)
    func bhargav() {
        print("hello")
    }
}

hello.east.bhargav()
hello.extra(abc: "xyz")


class RangeOfArray {
    let array: [Int]

    init(array: [Int]) {
        self.array = array
    }

    subscript(from: Int, to: Int) -> [Int] {
        get {
            return Array(array[from...to])
        }
    }
}
let rangeOfArray = RangeOfArray(array: [10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110])
print(rangeOfArray[0,4])
print("")
