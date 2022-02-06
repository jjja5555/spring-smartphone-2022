import Cocoa

var greeting = "Hello, playground"
greeting = "hhhh"
print(greeting)

// Basic data types
let intVal: Int = 5
let doubleVal: Double = 5.5
let stringVal: String = "I am iron man"
let boolVal : Bool = true

//Multiple variables at same time + optional
var x,y,z : Int?


var optionalInt: Int?

//Fun stuff

let 😀 = "⌚️"
print(😀)
let name = "Xiao Huang"
print("Hello " + name)
print("Hello \(name)")

print("Int min value = \(UInt.max)")
print("Int max value = \(Int.max)")
//var doubleMaxInt: Double = 9223372036854775807
//print(doubleMaxInt*2)

let binaryVal = 0b111
print(binaryVal)

let hex = 0x1D
print(hex)

let tupleVal =  (404,"Not Found")
print(tupleVal)

//Optionals

var str : String?


//one way
//str = "Ashishi"
if str != nil{
    print(str!)
}else{
    str = "default"
    print(str!)
}


// If let statement
if let name = str {
    
    print(name)
}

func sampleFunctionForGuard(str : String?){
    guard let name = str else {return}
    
    print(name)
}

