import UIKit

/*:
 ## Swift
 * 함수형 프로그래밍 패러다임과 프로토콜 지향 프로그래밍 패러다임을 더한 언어
 * 컴파일 언어
 */


print("\n-------------- [Constants and Variables] --------------\n")
/*:
 * var : 변수
 * let : 상수
 */
var num1 = 0
num1 = 3
let num2 = 1
//num2 = 3 // 에러

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

// let dummyStr = "김승진"
// print(Int(dummyStr))


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
 ## Function
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
 ### Early Exit

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
 ### C 스타일의 for 문은 지원하지 않음

 ```
 for (int i = 0; i <= 5; i++) {
   // C 스타일의 for 문
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

/*:
### Set
- Unordered Collection
- Unique Value
- Set Literal = Array Literal
*/

let fruitsSet: Set<String> = ["Apple", "Orange", "Melon"]
let numbers: Set = [1, 2, 3, 3, 3]
let emptySet = Set<String>()

/*:
 Number of Elements
 */
fruitsSet.count

if !fruitsSet.isEmpty {
  print("\(fruitsSet.count) element(s)")
} else {
  print("empty set")
}

/*:
 Searching
 */
if fruitsSet.contains("Apple") {
  
}

let productSet: Set = ["iPhone", "iPad", "Mac Pro", "iPad Pro", "Macbook Pro"]
let filteredSet = productSet.filter { (element) -> Bool in
  return element.hasPrefix("i")
}

filteredSet

/*:
 Add a New Element
 */

//[1,2,3].append(1)
//[1,2,3].insert(2, at: 0)

var set: Set<String> = []
set.insert("Apple")
set

var result = set.insert("Orange")
result
set

result = set.insert("Orange")
result
set

/*:
 Remove an Element
 */
set = ["Apple", "Orange", "Melon"]

if let removed = set.remove("Apple") {
  print("\(removed) has been removed!")
}

set

set.removeAll(keepingCapacity: true)


/*:
 Compare two sets
 */
var favoriteFruits = Set(["Apple", "Orange", "Melon"])
//var tropicalFruits = Set(["Banana", "Papaya", "Kiwi", "Pineapple"])
var tropicalFruits = Set(["Orange", "Melon", "Apple"])

if favoriteFruits == tropicalFruits {
  print("favoriteFruits == tropicalFruits")
} else {
  print("favoriteFruits != tropicalFruits")
}

if favoriteFruits.elementsEqual(tropicalFruits) {
  print("favoriteFruits == tropicalFruits")
} else {
  print("favoriteFruits != tropicalFruits")
}




print("\n-------------- [Optional] --------------\n")


/*:
 ## Optional

 * Optional 은 값이 없을 수 있는(absent) 상황에 사용
 * 옵셔널 타입은 2가지 가능성을 지님
    * 값을 전혀 가지고 있지 않음 = nil
    * 값이 있으며, 그 값에 접근하기 위해 옵셔널을 벗겨(unwrap)낼 수 있음

 ![OptionalType](optional-type.png)
 */

/**********************************************************
- Objective-C 의 nil 과 Swift 의 nil의 차이점

       -> Swift 에서의 nil 은 Objective-C 에서의 nil 과 다르다.
            nil of Swift : 값이 없다  in 모든타입 (Reference or Value Type)
            nil of Objective-C : 값이 없다 in Reference Type


- Objective-C에서 nil과 null의 차이
   오브젝티브C에서 nil은 객체 참조에 사용되고 null은 기타 다른 포인터 자료형에 사용합니다.

    //nil 사용
    MyClass *obj = nil

    // null 사용
    int *ptr = NULL;
 **********************************************************/


/*:
 정의
 */
// 아무 값이 없는 nil
// nil을 사용하기 위해 옵셔널을 사용
var optionalType1: String?
var optionalType2: Int?

optionalType1 = nil
//var varType: String = nil // 에러 발생

print(optionalType1)
print(optionalType2)



/*:
옵셔널 바인딩
 -> 옵셔널(?)를 벗겨내고 값을 가져오고싶을때 사용한다!
 
 ![if](optional-binding-if.png)
 
 ![while](optional-binding-while.png)
 
 ![guard](optional-binding-guard.png)
*/

// !를 이용해서 강제 언래핑(강제로 값을 빼냄)을 이용할 수 있다.
var optionalAddress: String? = "동대문구 답십리"
print(optionalAddress!)

// 강제 언래핑은 되도록이면 지양한다.
// 언제 값이 변해 nil되면 Crash가 발생!
optionalAddress = nil
//print(optionalAddress!) // 에러

// 강제 언래핑방식말고, 옵셔널 바인딩을 사용하자!
var optionalName: String? = "김승진"

if let name = optionalName {
  print(name) // <- 이 부분이 실행
} else {
  print("nil일때 else문이 실행됨")
}

optionalName = nil

// name이 (옵셔널 = nil)이기 때문에 else문을 탄다
if let name = optionalName {
  print(name)
} else {
  print("nil일때 else문이 실행됨") // <- 이 부분이 실행
}


optionalName = "Jinnify"

func doSomething() {
  guard let name = optionalName else {
    print("nil일때 else문이 실행됨")
    return
  }
  
  print(name)
}

doSomething()

/*:
 ## guard let 과 if let의 차이점
 
 위의 예제를 보면,
 * if let의 바인딩된 변수(name)은 외부에서 사용하지 못하고 scope { } 범위 내에서만 사용 가능
 * guard let의 바인딩된 변수(name) 외부에서 사용 가능
*/



/*:
멀티 옵셔널 바인딩
 */

var opNum1: Int? = 123
var opNum2: Int? = 456

// 옵셔널 바인딩할것이 많으면 계속 중첩해서 진행되야함.
// 가독성이 떨어짐
if let num1 = opNum1 {
  if let num2 = opNum2 {
    print("\(num1) < \(num2)")
  }
}

// 위 아래 같은 방법

// ,let 을 이용해서 한줄로 사용 가능
// 보통 이런식으로 사용함
if let num1 = opNum1, let num2 = opNum2 {
 print("\(num1) < \(num2)")
}



print("\n-------------- [Class] --------------\n")
/*:
# Class
 * Value Type
![Class](class.png)
*/

/*
 <에러 발생>
   - 변수에 초기 값이 없음
   - 프로퍼티들이 모두 값이 설정 해줘야한다. 한개라도 없으면 에러가 생김
class SeungJin {
  let name: String
  let age : Int
  let height: Double
}
 */

// 1. 해결
// 프로퍼티에 초기값을 지정
class SeungJin1 {
  let name: String = "김승진"
  let age : Int = 30
  let height: Double = 180.0
}

// 2. 해결
// 생성자 생성
class SeungJin2 {
  let name: String
  let age : Int
  let height: Double

  init(name: String, age: Int, height: Double) {
    self.name = name
    self.age = age
    self.height = height
  }
}


class LifeCycleClass {
  init() {
   print("LifeCycleClass initialized")
  }
  
  deinit {
    print("LifeCycleClass deinitialized")
  }
}

print("\n-------------- [Struct] --------------\n")

/*:
# Struct
 * 클래스와 동일하게 프로퍼티, 메서드, 생성자, 프로토콜등을 사용할 수 있다.
 * Value Type
*/

struct SomeS {
  var width: Double = 0
  var height: Double = 0
  // var width: Double // 에러 초기값이 필요함


  /*
   생성자를 통해서 값을 받고 싶을때
   */
//  var width: Double
//  var height: Double
//
//  init(width: Double, height: Double) {
//    self.width = width
//    self.height = height
//  }

}

class SomeC {
  var width: Double = 0
  var height: Double = 0
  // var width: Double // 에러 초기값이 필요함

  /*
  생성자를 통해서 값을 받고 싶을때
  */
//  var width: Double
//  var height: Double
//
//  init(width: Double, height: Double) {
//    self.width = width
//    self.height = height
//  }
}

/*
 인스턴스 생성 및 접근 방법
*/
let someS = SomeS()
print(someS.width)

let someC = SomeC()
print(someC.width)


print("\n-------------- [Type Casting] --------------\n")

/*:
# Type Casting
---
 1) as  : 타입 변환이 확실하게 가능한 경우(업캐스팅, 자기 자신 등) 에만 사용 가능. 그 외에는 컴파일 에러
 2) as? : 강제 타입 변환 시도. 변환이 성공하면 Optional 값을 가지며, 실패 시에는 nil 반환
 3)as! : 강제 타입 변환 시도. 성공 시 언래핑 된 값을 가지며, 실패 시 런타임 에러 발생
---
*/

class Shape {
  var color = UIColor.black
  
  func draw() {
    print("draw shape")
  }
}

class Rectangle: Shape {
  var cornerRadius = 0.0
  
  override func draw() {
    print("draw rect")
  }
}

class Triangle: Shape {
  override func draw() {
    print("draw triangle")
  }
}

/*
<업 캐스팅>
- 상속 관계에서 수퍼 클래스로의 변환 및 자기 자신의 타입으로 변환하는 것은 반드시 수행 가능
- 이것을 업캐스팅이라 하며 as 키워드 사용 가능
 */


let rectangle = Rectangle() // 자식
let shape: Shape = Rectangle() as Shape // 업캐스팅

rectangle.color
rectangle.cornerRadius

shape.color
//shape.cornerRadius // 존재하지 않음


/*
<다운 캐스팅>
- 형제 클래스나 다른 서브 클래스 등 수퍼 클래스에서 파생된 각종 서브 클래스로의 타입 변환 의미
- 반드시 성공한다는 보장이 없으므로 as? 또는 as! 를 사용
 */


let shapes = [Triangle(), Rectangle(), Triangle()]
for shape in shapes {
  if let triangle = shape as? Triangle {
    triangle.draw()
  } else if let rectangle = shape as? Rectangle {
    rectangle.draw()
  }
}

print("\n-------------- [Access Control] --------------\n")
/*:
---
# Access Control
 
 * Swift 에서는 5가지의 다른 접근 레벨 제공
 * open (가장 개방적) > public > internal (기본 레벨) > fileprivate > private (가장 제한적)
 * Open / Public 차이점
    * Open은 다른 모듈에서 override를 할 수 있고, Public은 Override를 할 수없다.
 
 ![access](access-control.png)
---
*/






print("\n-------------- [Any, AnyObject] --------------\n")

/*:
---
# Any , AnyObject
 
 * Swift 는 Int, String 등의 Primitive타입 확정 이외 가변 타입도 함께 제공
 * Any(모든 타입), AnyObject(모든 레퍼런스 타입)
 * Any > AnyObject
---
*/


class SomeClass1 {}
class SomeClass2 {}

var anyArray: [Any]
var anyObjectArray: [AnyObject]

anyArray = [110, "str", true, 9.9, SomeClass1()]
anyObjectArray = [SomeClass1(), SomeClass2(), SomeClass1(), SomeClass2()]

// 가변 타입이기때문에 사용할땐 타입 캐스팅이 필요함!
var number1 = anyArray[0] as? Int
var strText = anyArray[1] as? String


print("\n---------- [ Extension ] ----------\n")
/*:
---
# Extension

 * 이름 그대로 class, struct, enum, protocol타입에 대해 확장해서 추가적으로 기능을 만들수 있다.
 * 수평적 (상속은 수직적)
---
*/
/*:
 ### Syntax
*/

//extension SomeType {
//
//}

/*:
 ### Example
*/
class ViewController: UIViewController {

  let number1 = 10
  let number2 = 20

  func add(param1: Int, param2: Int) {
    print(param1 + param2)
  }

}

let someVC = ViewController()
someVC.add(param1: someVC.number1, param2: someVC.number2)

// ViewController에서 기존에 존재하지 않았던 기능을 extension을 통해 수평적으로 추가
extension ViewController {

  func subtract(param1: Int, param2: Int) {
    print(param1 - param2)
  }
}

someVC.subtract(param1: 30, param2: 20)



print("\n---------- [ Closure ] ----------\n")

/*:
 **function** - named code block
 **closure** - unnamed code block (lambdas)
 */

/*:
### Basic closure
*/

//() -> ()
let simpleClosure = {
  print("This is SimpleClosure!!")
}
simpleClosure()

//(Int, Int) -> String
let addClosure = { (param1: Int, param2: Int) -> String in
  return "\(param1 + param2)"
}
addClosure(10, 20)

/*:
### Syntax Optimization
*/
func performClosure(param: (String) -> Int) {
  print(param("Swift"))
}

performClosure(param: { (str: String) -> Int in
  return str.count
})

performClosure(param: { (str: String) in
  return str.count
})

performClosure(param: { str in
  return str.count
})

performClosure(param: {
  return $0.count
})

performClosure(param: {
  $0.count
})

performClosure(param: ) {
  $0.count
}

performClosure() {
  $0.count
}

performClosure { $0.count }



/*:
 ## Capture
 * Value Type Capture
 * Reference Type Capture
*/


print("\n---------- [ Value Capture ] ----------\n")
//: ### Value Type Capture
var capNumA = 1
var capNumB = 3
var capNumC = 5
var resultNum = 0

print("Capture 전 초기값 :", capNumA, capNumB, capNumC)
print("capNumA, capNumB만 캡처")
let valueCapture = { [capNumA, capNumB] in
  resultNum = capNumA + capNumB + capNumC
  print("클로저 내부 값 :", capNumA, capNumB, capNumC, resultNum)
}

capNumA = 10
capNumB = 10
capNumC = 1
resultNum = capNumA + capNumB + capNumC
print("변경 값 :", capNumA, capNumB, capNumC)

// capNumA, capNumB를 캡처해놨기 때문에 이 둘은 변하지 않고,
// capNumC가 5에서 1로 변경된걸 볼 수 있다.
valueCapture()


print("\n---------- [ Reference Capture ] ----------\n")
//: ### Reference Type Capture

class RefClass {
  var number = 0
}

var xRef = RefClass()
var yRef = RefClass()
print("Capture 전 초기값 :", xRef.number, yRef.number)

let refCapture = { [xRef] in
  print("클로저 내부 값", xRef.number, yRef.number)
}

xRef.number = 5
yRef.number = 7
print("변경 값 :", xRef.number, yRef.number)

// xRef를 캡처했다고 해도 Reference의 특징처럼 메모 주소에 접근하기 때문에 값이 바뀐다.
refCapture()



print("\n---------- [ @noescaping, @escaping ] ----------\n")

/*:
 ## @escaping, @noescaping
 * Swift 3.0 이후 - @noescaping 이 기본
 
 * @noescaping -> 함수의 범위내에서만 클로저를 사용하는 경우
 * @escaping
    * 클로저가 함수로부터 escaping한다는 것은 해당 함수의 인자로 클로저가 전달되지만, 함수가 반환된 후 실행 되는 것을 의미.
    * 함수의 인자가 함수의 영역을 탈출하여 함수 밖에서 사용할 수 있는 개념은 기존에 우리가 알고 있던 변수의 scope 개념을 무시. 왜냐하면 함수에서 선언된 로컬 변수가 로컬 변수의 영역을 뛰어넘어 함수 밖 에서도 유효
    * 보통 completion handler에 사용됩니다.
    * 비동기 작업으로 함수가 종료되고 난 후 작업이 끝나고 호출할 필요가 있는 클로져를 사용해야 할 때 탈출 클로저(Escaping Closure)가 필요합니다.
*/

class Callee {
  func doSomething(callback: (String) -> Void) {
    callback("승진")
  }
}

class Caller {
  var callee: Callee = Callee()
  var name = "Jinnify"
  
  var closure: (() -> Void) = {}
  
  func doSomething1() {
    callee.doSomething { name in
      self.name = name
      print(name)
    }
  }
  
  func doSomething2(_ arg: () -> Void) {
    // 클로저가 함수로부터 escaping한다는 것은 해당 함수의 인자로 클로저가 전달되지만, 함수가 반환된 후 실행 되는 것을 의미.
    // self.closure = arg // @escaping이 필요
  }
  
  func doSomething3(_ arg: @escaping () -> Void) {
    // 클로저가 함수로부터 escaping한다는 것은 해당 함수의 인자로 클로저가 전달되지만, 함수가 반환된 후 실행 되는 것을 의미.
    self.closure = arg // @escaping이 필요
  }
}


let caller = Caller()
caller.doSomething1()
caller.doSomething3 {
  
}

print("\n-------------- [Handling Error] --------------\n")

/*:
 Swift에서의 에러 처리는 다른 언어의 exception 처리와 닮았습니다.
 ### 에러 처리 방법
 1. 에러를 발생시키는 함수 사용
 2. do-catch 구문 사용
*/

// enum을 통해 그룹화하여 에러를 제공하기 적합
enum VendingMachineError: Error {
     case invalidSelection
     case insufficientFunds(coinsNeeded: Int)
     case outOfStock
}

/*:
 에러를 발생시키는 함수 사용하기(Propagating Errors Using Throwing Fuctions)
*/

//throws이용
//func canThrowErrors() throws -> String {}
//func cannotThrowErrors() -> String {}

//예제

struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11)
    ]

    var coinsDeposited = 0

    func vend(itemNamed name: String) throws {
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }

        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }

        guard item.price <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }

        coinsDeposited -= item.price

        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem

        print("Dispensing \(name)")
    }
}

let vm = VendingMachine()

// vend(itemNamed:) 메소드는
// throws메서드로써 에러를 발생시키기 때문에 이 메소드를 호출하는 메소드는 반드시 do-catch, try 구문을 사용해 에러를 처리해야 한다.
do {
  try vm.vend(itemNamed: "오레오")
} catch {
  print("Error", error)
}



//: [Next](@next)

