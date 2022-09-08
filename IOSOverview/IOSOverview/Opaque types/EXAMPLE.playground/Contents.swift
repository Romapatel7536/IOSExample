
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
