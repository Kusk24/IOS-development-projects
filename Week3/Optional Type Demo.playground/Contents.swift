import UIKit

var greeting = "Hello, playground"

var explicitText: String = "Hello" // explicitly
var implicitText = "Hello" // implicitly

var value: String? = "Fair"
// There is no defult value in swift
// in order to have nil(null) we need to set ? optional beside data type
print(value)

print(value!) //force unwrap or explicitly unwrap
//cannot unwrap nil

//First way of soft unwrap
var name: String?
print(name ?? "No  Value") //because there is no value in name so it prints "No Value"


var totalScore: Int? = 100
//if totalScore != nil {
//   totalScore! += 100
//   print(totalScore)
//}

if var x = totalScore, let name = name { //x checks totalScore nil or not, if not it is assigned
    x += 100
    print("Name: " + name)
    print("Score: \(x)") // if one of the value is nil: this "if" function will not be excuted
}

var _ = 50 // underscore _ is when value is not necessary

if let _ = name {
    print("The name is not nil")
} else {
    print("The name is nil")
}


