/*:
 # OOP 4대 특징
 * Abstraction
 * Encapsulation
 * Inheritance
 * Polymorphism
 */


/*:
## 1. Abstraction
*/

import UIKit

protocol HumanType {
  var name: String { get }
  var age: Int { get }
  var gender: String { get }
  var height: Double { get }

  func sleep()
  func eat()
  func walk()
}

protocol OwnerType {
  var name: String { get }

  func promote()
  func hire()
  func fire()
}

protocol ChefType {
  var position: String { get }

  func cook()
  func decorate()
  func buyFoodIngredients()
}

protocol CustomerType {
  var money: Int { get }

  func order()
  func eat()
  func rateRestaurant()
}

/*:
## 2. Encapsulation
*/

class Person {
  private var location = "서울"

  private func doSomething1() {
    print("잠시 휴게소에 들려서 딴짓")
  }
  private func doSomething2() {
    print("한숨 자다 가기")
  }

  func currentLocation() {
    print("====")
    print("현재 위치 :", location)
    print("====")
  }

  func goToBusan() {
    print("서울을 출발합니다.")
    doSomething1()
    doSomething2()
    print("부산에 도착했습니다.")
    location = "부산"
  }
}

let A = Person()
A.currentLocation()
A.goToBusan()
A.currentLocation()


/*:
## 3. Inheritance
*/


class Animal {
  var brain = true
  var legs: Int
  init(legs: Int = 0) {
    self.legs = legs
  }
}


class Human: Animal {
  override init(legs: Int = 2) {
    super.init(legs: legs)
  }
}


class Pet: Animal {
  var fleas: Int
  init(fleas: Int = 0) {
    self.fleas = fleas
    super.init(legs: 4)
  }
}


class Dog: Pet {
  override init(fleas: Int = 8) {
    super.init(fleas: fleas)
  }
}


class Cat: Pet {
  override init(fleas: Int = 4) {
    super.init(fleas: fleas)
  }
}


print("\n---------- [ Animal ] ----------\n")
let animal = Animal()
print("animal brain :", animal.brain)
print("animal legs :", animal.legs)

print("\n---------- [ Human ] ----------\n")
let human = Human()
print("human brain :", human.brain)
print("human legs :", human.legs)

print("\n---------- [ Pet ] ----------\n")
let pet = Pet()
print("pet brain :", pet.brain)
print("pet legs :", pet.legs)
print("pet fleas :", pet.fleas)

print("\n---------- [ Dog ] ----------\n")
let dog = Dog()
print("dog brain :", dog.brain)
print("dog legs :", dog.legs)
print("dog fleas :", dog.fleas)

print("\n---------- [ Cat ] ----------\n")
let cat = Cat()
print("cat brain :", cat.brain)
print("cat legs :", cat.legs)
print("cat fleas :", cat.fleas)


/*:
 ## 4. Polymorphism

 * Overloading
 * Overriding
 */


/*:
 Overloading

 1. 다른 파라미터 이름
 2. 다른 파라미터 타입
 3. 다른 파라미터 개수
 */
print("\n---------- [ Overloading ] ----------\n")

func printParameter() {
  print("No param")
}

//func printParameter() -> String {   // Error
//  print("No param")
//}

func printParameter(param: Int) {
  print("Input :", param)
}

func printParameter(_ param: Int) {
  print("Input :", param)
}

print("=====")
printParameter()
printParameter(param: 1)
printParameter(1)


// ---------

func printParameter(param: String) {
  print("Input :", param)
}

func printParameter(_ param: String) {
  print("Input :", param)
}

func printParameter(name param: String) {
  print("Input :", param)
}

//func printParameter(param name: String) {   // Error
//  print("Input :", name)
//}


print("=====")
printParameter(param: "hello")
printParameter("hello")
printParameter(name: "Hello")


/////////

func printParameter(param: String, param1: String) {
  print("Input :", param, param1)
}

func printParameter(_ param: String, _ param1: String) {
  print("Input :", param, param1)
}

func printParameter(_ param: String, param1: String) {
  print("Input :", param, param1)
}

func printParameter(param: String, _ param1: String) {
  print("Input :", param, param1)
}


print("=====")
printParameter(param: "hello", param1: "world")
printParameter("hello", "world")
printParameter("hello", param1: "world")
printParameter(param: "hello", "world")



/*:
Overriding
*/

class Puppy {
  func bark() { print("멍멍") }
}
class Poodle: Puppy {
  override func bark() { print("왈왈") }
}
class Husky: Puppy {
  override func bark() { print("으르르") }
}
class Bulldog: Puppy {
  override func bark() {
    super.bark()
    print("bowwow")
  }
}


print("\n---------- [ Overriding ] ----------\n")

// Dog 타입의 객체에 bark 메서드를 실행하라는 메시지 전달
// override 된 경우 해당 메서드를 찾아서 실행

var puppy: Puppy = Puppy()
puppy.bark()

puppy = Poodle()
puppy.bark()

puppy = Husky()
puppy.bark()

puppy = Bulldog()
puppy.bark()




//: [Next](@next)
