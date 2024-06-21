import Foundation

//Variables are always initialized before use, arrays and integers are checked for overflow, memory is automatically managed, and potential data races can be spotted at compile-time

//Var - muttable
var fruit = "apple"

fruit = "orange"

print("friut \(fruit)")

//Let - immutable example
// let vegetable = "carrot"

// vegetable = "broccoli"

// print("vegetable \(vegetable)"

let vegetable = "carrot"

 print("vegetable \(vegetable)")


//Condtioning and looping quick through(only changes)

//For

let localarray = [1,3,2,3,4]

for i in localarray {
    print("i: \(i)")
}

//Using stride to skip by one
for j in stride(from: 0, to: localarray.count, by: 2)  {
    print("j: \(localarray[j])")
}

//do while
var newarray: [Int] = []
var element: Int = 0
repeat {
    newarray.append(localarray[element])
    element += 1
}while(element < 3)

//Functions and Closures(only changes)

//Example of arguments way, inout  and  _

func argumentchecker (argum a:Int, water b: inout Int, _ c:Int){
    let ans = a + b * c
    print(ans)
    b = ans //return via inout
    
}

var result: Int = 2
argumentchecker(argum: 4, water: &result, 3)
print("calling of argumentchecker: \(result)")

//varadic

func variadicChecker(numbers: Int...) -> Int{
    var total: Int = 0
    for number in numbers {
        total += number
    }
    print("total \(total)")
    return total
}

print("varaidic \(variadicChecker(numbers: 1,3,23,34,34,34,4,34,34,34,3434,34,34,34,3))")

//Closure same as fucntions only thing it stores the function

let argumentClosure: (Int, inout Int) -> Void = { a,b in
    let ans = a + b
    print(ans)
    b = ans
}

argumentClosure(1,  &result)
print("calling of argumentClosure: \(result)")

//Classes and struct quick through(only changes)



//struct
struct Item {
    var code: Int
    var description: String
}

let item1 = Item(code: 2, description: "test")
var item2 = item1

item2.code = 3
item2.description = "Pen"
print("item1: \(item1)")
print("item2: \(item2)")

//class
class ItemClass{
    var code: Int
    var description: String
    init(
        code:Int,
        description:String
    ){
        self.code = code
        self.description = description
    }
}

let item3 = ItemClass(code: 4, description: "Apple")
print("item3 before : \(item3.code), \(item3.description)")
var item4 = item3

item4.code = 5
item4.description = "Orange"
print("item3: \(item3.code), \(item3.description)")
print("item4: \(item4.code), \(item4.description)")
