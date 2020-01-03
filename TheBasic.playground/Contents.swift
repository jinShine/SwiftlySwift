import UIKit
import os

var str = "Hello, playground"

enum Language: Int {
  case kotlin = 0,
  swift
}

let ddt = Language(rawValue: 0)



print("\n-------------- [Constants and Variables] --------------\n")

var num1 = 0
let num2 = 1

print("\n-------------- [로그 출력] --------------\n")

// 로그 출력
print("숫자", num1)
print("숫자 \(num2)")

print("\n-------------- [Semicolon ;] --------------\n")

// ; 사용해도 되지만 안쓰는게 좋다.
print("숫자", num1);
print("숫자", num1); print("숫자 \(num2)")


print("\n-------------- [Type Annotation & Inference] --------------\n")

//Character, String, Int, Double, Float, Bool

let year1: Int = 2020
let year2 = 2020 // 추론을 함. Int가 Default기 때문에
//year
print(type(of: year2))

let year3: String = "2020"
let year4 = "2020" // 추론을 함. String가 Default기 때문에
print(type(of: year4))

let year5: Character = "2"

let isActive1: Bool = false // Bool이 Default
let isActive2 = true

let weight1: Double = 200.0
let weight2 = 200.0 // 안적어줘도 됨. Double가 Default기 때문에
// 하지만 Float타입이 필요하면 명시해줘야된다.
print(type(of: weight2))


print("\n-------------- [Type Conversion] --------------\n")
// Type()

let age: Int = 100
print(age)
let strAge = String(age)
print(strAge)
let doubleAge = Double(strAge)
print(doubleAge!)


print("\n-------------- [Operation] --------------\n")

var a = 123
var b = 456

print(-a)

//a++ , ++a
print(a += 1)
print(a = a + 1)

print(a *= 1)

print(a + b)

print(a > 0 ? "양수" : "음수")


print("\n-------------- [Comparison Operators] --------------\n")

// Equal to operator
a == b

// Not equal to operator
a != b

// Greater than operator
a > b

// Greater than or equal to operator
a >= b

// Less than operator
a < b

// Less than or equal to operator
a <= b


print("\n-------------- [Range Operators] --------------\n")

//0~10까지
0...10

//0~9까지
0..<10

//0~9까지
for i in (0..<10) {
  print(i)
}

print("\n-------------- [Function] --------------\n")

/*:
 ## Function Syntax
 ![Function Syntax](func.png)
 */

func funcName(param1: Int, param2: String) -> String {
  return String(param1) + param2
}

funcName(param1: 20, param2: "20") // "2020"

func greetAgain(person: String) -> String {
  return "Hello again, " + person + "!"
}

greetAgain(person: "Seungjin")

/*:
 ---
 ## Argument Label

 ### Argument Label Declaration Syntax

 ![Argument Label](arg-label.png)

 ### Calling Function with Argument Label
 ![Calling Function with Argument Label](arg-call.png)
 */
/*:
 ## Parameter
 * 매개변수 = 인자 = Parameter
 * 인수를 담는 변수의 한 종류로서 해당 함수 내부 스코프에만 영향
 * 대부분 call by value 가 기본
 * call by reference 는 호출할 때 사용한 전달인자에까지 영향
 */


func testFunc1(_ param: Int) {
  print(param)
}

func testFunc2(param: Int) {
  print(param)
}

testFunc1(10)
testFunc2(param: 20)

func testFunc3() {
  print("ㅎㅇ")
}

// 리턴값이 Void면 생략해서 많이 사용한다.
// Void == ()
/*

 func testFunc3() -> Void {
 print("ㅎㅇ")
 }

 func testFunc3() -> () {
 print("ㅎㅇ")
 }

 */

testFunc3()


print("\n-------------- [if] --------------\n")

/***************************************************
 if <#condition#> {
 <#code#>
 }

 if <#condition#> {
 <#statements#>
 } else {
 <#statements#>
 }
 ***************************************************/

// 다른 언어처럼 ()를 붙히지 않음

if age >= 30 {
  print("true")
} else {
  print("false")
}

print("\n-------------- [switch] --------------\n")

/***************************************************
 switch <#value#> {
 case <#value 1#>:
 <#respond to value 1#>
 case <#value 2#>,
 <#value 3#>:
 <#respond to value 2 or 3#>
 default:
 <#otherwise, do something else#>
 }

 - switch 문은 가능한 모든 사례를 반드시 다루어야 함 (Switch must be exhaustive)
 ***************************************************/

let alphabet = "a"

switch alphabet {
case "a":
  print("a")
case "z":
  print("z")
default:
  break
}

// 범위 연산자로도 가능

let height: Int = 180

switch height {
case 0...50:
  print("0 ~ 50")
case 51...100:
  print("51 ~ 100")
case 101...150:
  print("101 ~ 150")
default:
  print("151이상")
}

// 다중 조건도 가능

switch alphabet {
case "a", "b", "c", "d", "e", "f":
  print("이중에서 하나")
case "g", "h", "i", "j", "k", "l":
  print("걸리겠지 ?")
default:
  print("아니면 여기")
}


print("\n-------------- [guard] --------------\n")

/*:
 ## Early Exit

 * guard statement
 * guard 구문은 if구문과 유사하게 Bool 타입의 값으로 동작하는 기능.
 * if문과는 다르게 guard문은 else가 항상 따라와야됨.
 * guard 뒤에 실행 결과가 true일 때 코드가 계속 실행되고, false라면 else의 블록 내부 코드를 실행하게 된다.
 * if 구문을 쓰면 예외사항을 else 블록으로 처리해야 하지만 예외사항만을 처리하고 싶다면 guard 구문을 쓰는 것이 훨씬 간편하다.
 */

/***************************************************
 if <#condition#> {
 <#code#>
 }

 guard <#condition#> else {
 <#code#>
 }
 ***************************************************/

let version = 100
func update(by version: Int) {
  guard version == 100 else {
    print("업데이트 필요 없음")
    return
  }

  print("업데이트 필요")
}

update(by: version)


print("\n-------------- [loops] --------------\n")

/*:
 # C 스타일의 for 문은 지원하지 않음

 ```
 for (int i = 0; i <= 5; i++) {
 C 스타일의 for 문
 }
 ```
 */


for index in 1...4 {
  print("\(index) times 5 is \(index * 5)")
}

let list = ["Swift", "Programming", "Language"]
for str in list {
  print(str)
}

for chr in "Hello" {
  print(chr, terminator: " ")
}


print("\n-------------- [Tuples] --------------\n")

/*
 이름 없는 튜플
 */
let threeTuple: (Int, Int, Int) = (1, 2, 5)
type(of: threeTuple)

// 접근 방법
threeTuple.0
threeTuple.1
threeTuple.2

// 다른 타입도 가능
let fiveTuple: (Int, String, Double, Float, Character) = (10, "10", 10.0, 10.0, "1")
print(fiveTuple)

fiveTuple.0
fiveTuple.1
fiveTuple.2
fiveTuple.3
fiveTuple.4


/*
 이름 있는 튜플
 */

let twoTuple: (value1: Int, value2: Int) = (1, 2)
twoTuple.value1
twoTuple.value2


print("\n-------------- [enumeration] --------------\n")

enum Language1 {
  case swift, kotlin, java, python, javascript
}

enum Language2 {
  case swift
  case kotlin
  case java
  case python
  case javascript
}

//접근 방법
Language1.swift
Language1.python


//switch와 주로 사용
let python = Language1.javascript

switch python {
case .javascript: print("찾았다")
default: break
}

/*:
 ### Associated Values
 */
enum Barcode {
  case upc(Int, Int, Int, Int)
  case qrCode(String)
}

let productUPC = Barcode.upc(8, 85909, 51226, 3)
let productQR = Barcode.qrCode("AIUPOIJQLXLKHF")

// 연관값으로 값이 넘어옴
switch productQR {
case .upc(let numberSystem, let manufacturer, let product, let check):
  print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case .qrCode(let productCode):
  print("QR code: \(productCode)")
}


/*:
 ### Raw Values
 * enum에 타입을 지정할 수 있음
 * raw value 는 해당 Enumeration 내에서 반드시 고유한 값이어야 함.
 */

// enum에 타입을 지정할 수 있음
// Strings, Characters, or any of the Integer or Floating-point number types
enum AppleMobile: String {
  case iPhone8 = "8"
  case iPhoneX = "10"
  case iPhone11Pro = "11"
}

enum Weekday: Int {
  case sunday, monday, tuesday, wednesday, thursday, friday, saturday
}

enum WeekdayName: String {
  case sunday="1", monday, tuesday, wednesday, thursday, friday, saturday
}


// 접근 방법
print(AppleMobile.iPhone8.rawValue)
print(AppleMobile.iPhoneX.rawValue)


/*
 (rawValue: 값)으로 enum값에 값이 있는지 체크할 수 있다.
 즉, 값이 있는지 없는지 체크하는 로직 구성 가능
 */

let day = Weekday(rawValue: 3)

switch day {
case .sunday: print("일요일")
case .monday: print("월요일")
case .tuesday: print("화요일")
case .wednesday: print("수요일")
case .thursday: print("목요일")
case .friday: print("금요일")
case .saturday: print("토요일")
default: print("None")
}





print("\n-------------- [Collection] --------------\n")

/*:
 ### 스위프트에서 Collection은 Value Type
  * Array - ordered collections of values.
  * Set - unordered collections of unique values.
  * Dictionary - unordered collections of key-value associations.

 ### Mutability

 * let => Immutable Collection
 * var => Mutable Collection
 */

print("\n-------------- [Array] --------------\n")
/*:
 ### Array

 * Ordered Collection
 * Zero-based Integer Index
 */

/*:
 초기화 - 방법이 다양함
 */
let strArray1: Array<String> = ["apple", "orange", "melon"]
let strArray2: [String] = ["apple", "orange", "melon"]
let strArray3 = ["apple", "orange", "melon"]


/*:
 Mutability
 */

// Mutable
var mutableArr: [Int] = [1, 2]
mutableArr.append(3)

// Immutable
let immutablrArr: [Int] = [1, 2]
//immutablrArr.append(3)


/*:
count
*/
var fruits = ["Apple", "Orange", "Banana"]
let countOfFruits = fruits.count

/*:
isEmpty
*/
if !fruits.isEmpty {
  print("\(countOfFruits) element(s)")
} else {
  print("empty array")
}


/*:
 Retrieve an Element
*/
/*
 * [Int]
 * [Array.Index]
 * [a...b]
 * [a..<b]
 */

//           0        1         2
fruits = ["Apple", "Orange", "Banana"]

fruits[0] == fruits[fruits.startIndex]
fruits[2] == fruits[fruits.endIndex - 1]


/*:
 Searching
 */

let alphabetArr = ["A", "B", "C", "D", "E"]

//contains
if alphabetArr.contains("A") {
  print("true")
} else {
  print("false")
}

//contains(where: <#T##(String) throws -> Bool#>)
alphabetArr.contains { alphabet -> Bool in
  // code..
  return alphabet == "A"
}

/*:
 * first~ : 처음부터 순차 검색
 * last~  : 마지막부터 순차 검색
 */

// value 찾기
var foundStr1 = alphabetArr.first { alphabet -> Bool in
  return true
}

var foundStr2 = alphabetArr.last { alphabet -> Bool in
  return alphabet == "B"
}

// index 찾기
alphabetArr.firstIndex(of: "B") // 1
alphabetArr.lastIndex(of: "D") // 3



/*:
Add
*/

//append
var arr3 = ["A", "B", "C"]
arr3.append("D")
print(arr3)

// +
arr3 += ["E"]
print(arr3)

// insert
arr3.insert("Z", at: 2)
arr3.insert("U", at: 5)
print(arr3)


var arr4 = ["F", "G", "H"]
let mergeArr = arr3 + arr4
print(mergeArr)


/*:
Change
*/

arr4[0] = "R"
arr4[arr4.endIndex - 2] = "U"
print(arr4)


/*:
Remove
*/

//arr4.removeAll()
//arr4.removeFirst(<#T##k: Int##Int#>)
//arr4.removeLast(<#T##k: Int##Int#>)
arr4.removeLast()


/*:
Soring
 * sorted vs sort
*/

var numArr1 = [5, 3, 7, 9, 2, 6, 1, 4, 8]

// sort 리턴이 void
numArr1.sort()
print(numArr1)

// sorted은 리턴값이 배열
let sortedArr = numArr1.sorted()
print(sortedArr)

// > 오른차순
// < 내림차순
numArr1.sorted(by: >)
numArr1.sorted(by: <)


/*:
 Enumerating an Array
*/

let array = ["Apple", "Orange", "Melon"]

// reverse

for value in array.reversed() {
  if let index = array.firstIndex(of: value) {
    print("\(index) - \(value)")
  }
}

// enumerated

for tuple in array.enumerated() {
  print("#\(tuple.offset) - \(tuple.element)")
}

for (index, word) in array.enumerated() {
  print("#\(index) - \(word)")
}



print("\n-------------- [Dictionary] --------------\n")

/*:
 ### Dictionary

* Element = Unique Key + Value
* Unordered Collection
*/

/*:
초기화 - 방법이 다양함
*/
var dic1: Dictionary<String, String> = ["1" : "A", "2" : "B"]
var dic2: [String : String] = ["1" : "A", "2" : "B"]
var dic3 = ["1" : "A", "2" : "B"]


/*:
count
*/
var words = ["A": "Apple", "B": "Banana", "C": "City"]
let countOfWords = words.count

/*:
isEmpty
*/
if !words.isEmpty {
  print("\(countOfWords) element(s)")
} else {
  print("empty dictionary")
}

/*:
 Retrieve an Element
*/

// 키로 접근
words["A"]
words["C"]

// 전체 keys
words.keys
// 전체 values
words.values

if let aValue = words["A"] {
  print(aValue)
} else {
  print("Not found")
}

/*:
 Searching
*/

if words.contains(where: { (key, value) -> Bool in
  return key == "A"
  }){
  print("contains A key.")
}

if words.contains(where: { (dict) -> Bool in
  return dict.value.lowercased() == "City".lowercased()
}) {
  print("contains City value.")
}

let bWord1 = words.first { (key, value) -> Bool in
  return key == "B"
}


/*:
Change
*/

var persons = ["name" : "SeungJin", "age" : "29", "address" : "seoul"]
persons["name"] = "Jinnify"
print(persons)

persons.updateValue("30", forKey: "age")
print(persons)

/*:
Remove
*/

//persons.removeAll()
persons.removeValue(forKey: "address")



print("\n-------------- [Set] --------------\n")




