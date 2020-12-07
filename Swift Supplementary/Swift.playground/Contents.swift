import UIKit



// 로그 출력을 위한 함수 (Free Function)

print(3.14)

var num = 1
print(num)

print("숫자", num)

print("숫자 \(num)")


print("\n-------------- [Constants and Variables] --------------\n")



let jin = { (name: String, age: Int) in
  print("이름은 \(name)이고, 나이는 \(age)입니다.")
}

func personInfo(to: (String, Int) -> Void) {
  to("김승진", 30)
}


personInfo(to: jin)

func reduce(_ values: [Int], resultTotal: (Int, Int) -> Int) -> Int {
  var current = values[0]
  
  for value in values[1...] {
    current = resultTotal(current, value)
  }
  
  return current
}

let sum = reduce([1,2,3,4,5]) { (total, value) -> Int in
  return total + value
}
print(sum)
