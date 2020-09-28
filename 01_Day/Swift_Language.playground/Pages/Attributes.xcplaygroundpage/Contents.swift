//: [Previous](@previous)

import Foundation

/*:
 ## propertyWrapper
 
 * Swift 5.1부터 사용 가능
 */

@propertyWrapper
struct WhitespaceTrimmable {
  
  private(set) var value: String = ""
  
  var wrappedValue: String {
    get { value }
    set { value = newValue.trimmingCharacters(in: .whitespacesAndNewlines) }
  }
  
  init(wrappedValue: String) {
    self.wrappedValue = wrappedValue
  }
}

struct Service {
  @WhitespaceTrimmable var title: String
  
  init(title: String) {
    self.title = title
  }
}

let service = Service(title: "안녕!!!!!!!!!     ")
print(service.title)

//: [Next](@next)
