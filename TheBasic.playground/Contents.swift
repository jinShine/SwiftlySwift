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


