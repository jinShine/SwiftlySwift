import UIKit



// 로그 출력을 위한 함수 (Free Function)

print(3.14)

var num = 1
print(num)

print("숫자", num)

print("숫자 \(num)")


print("\n-------------- [Constants and Variables] --------------\n")


var storeValue: String = "123" {
  willSet {
    print(storeValue)
  }
  didSet {
    print(storeValue)
  }
}

storeValue = "333"


final class TestClass {
  static let sss: String = "1"
  static let dd : String = "2"
}

TestClass.sss
TestClass.dd

protocol Computer: Comparable {
  var price: Double { get set }
  var weight: Int { get set }
  var cpu: String { get set }
  var memory: Int { get set }
  var storage: Int { get set }
}

protocol Laptop: Computer {
  var screenSize: Int { get set }
}

//
//class AppleMac: Laptop {
//  var screenSize: Int = 0
//
//  var price: Double = 0.0
//
//  var weight: Int = 0
//
//  var cpu: String = ""
//
//  var memory: Int = 0
//
//  var storage: Int = 0
//}

var tes: String? = ""

if tes!.isEmpty {
  print(123)
} else {
  print(555)
}

let keys: [String: String] = ["1" : "1"]

keys["2", default: "55"]


struct TestInit {
  
  var name: String
  var password: String
  
  init?(name: String, password: String) {
    guard name.count >= 8 && password.count >= 8 else {
      return nil
    }
    
    self.name = name
    self.password = password
  }
}

let per = TestInit(name: "rlatmd", password: "whis")


class Com {
  var cpu: String = "i9"
}

class Mac: Com {
  var id: String = "Apple Mac"
}

class Window: Com {
  var id: String = "Window PC"
}

let mac = Mac()
let win = Window()

let coms = [win, mac]

coms.forEach {
  if let com = $0 as? Mac {
    print("MAC", com.id)
  } else {
    print("Window")
  }
}
