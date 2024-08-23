import UIKit

var greeting = "Hello, playground"

let name = "Kuro"

// name = "James" cannot assign because of Let is constant

// greeting can be changed, it is variable

greeting = "Hello \(name)"

let n1 = 6
let n2 = 18
let result = "The result is \(n1 + n2)" // \( ) is like fstring

//above ones are implicitly which means not clear but easy to understand / assumption


//Under ones are explicitly which means very clear

let play: String = "Hello, Playground"
let n3: Int = 19
let d1: Double = 22
var result1 = "something"

result1 = "The result is \(Double(n3) / d1)"  //Downcasting or Upcasting which means changing the type to be same with anther

let b1: Bool = true
if b1 {
    print("B1 is True")
} else {
    print("B1 is False")
}


for i in 0...9 {
    print(i)
}

let arr1: [String] = ["Fair", "Kuro", "Will"]

var smh: [String] = [] // to have something blank array
for name in arr1 {
    print("Hello \(name)")
}

//tuple
var t1: [(String,  Int)] = [("Fair",31), ("Kuro", 27), ("Will", 29)]

for person in t1 {
    let message = String(format: "%@ %d", person.0, person.1) //.0 means index of tuple
    // or let message = String(format: /(person.0) %d, person.1)
    print(message)
}

typealias Fair = String // to give data type a name
let message: Fair = "Hello"


var i = 0
while i < 3 {
    print("While loop\(i)")
    i += 1
}



class Student{
    var name: String
    var id: String
    var totalGpa: Double
    var totalCredit: Int
    
    init(name: String, id: String, totalGpa: Double, totalCredit: Int) {
        self.name = name
        self.id = id
        self.totalGpa = totalGpa
        self.totalCredit = totalCredit
    }
    
    func detailprint() {
        print("\(id) \(name) GPA: \(totalGpa) with \(totalCredit) credits")
    }
}

let s1 = Student(name: "Kuro", id: "u6612054", totalGpa: 3.62, totalCredit: 33)
print(s1.id)
s1.name = "WinYu"
print(s1.name) // changed name in s1
s1.detailprint()


// Optional Type for Type Safety
// Unique for swift

var number: Int? = nil //? means optional type (can be changed)
number = 10
number = nil

// var calculationResult = number + 2
// We need to unwrap to solve line 101 error
// There are two types of unwrap (soft unwrap and force unwrap)

// force unwrap for when you are 100% what data type will be, otherwise still be error
// var calculationResult = number! + 2

//to use force unwrap
if number != nil {
    var calculationResult = number! + 2
}

//optional binding /safely / soft unwrap
if let number = number {
    var calculatioResult = number + 2
}

func guardDemo() {
    number = 10
    guard let numberCheckedByGuard = number else {
        return
    }
    print (numberCheckedByGuard + 2)
}

guardDemo()

//to return data types
//for integer return
func calculate(n1: Int, n2: Int) -> Int{
    return n1 + n2
}

//for tuple return like multiple data type return
func calculation(n1: Int, n2: Int) -> (String, Int) {
    return ("result is ok", n1 + n2)
}
