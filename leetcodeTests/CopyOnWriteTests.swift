
import XCTest

struct MemoryAddress<T>: CustomStringConvertible {
    let intValue: Int
    var description: String {
        let length = 2 + 2 * MemoryLayout<UnsafeRawPointer>.size
        return String(format: "%0\(length)p", intValue)
    }
    // for structures
    init(of structPointer: UnsafePointer<T>) {
        intValue = Int(bitPattern: structPointer)
    }
}

final class Person {
  var name: String
  
  init(name: String) {
    self.name = name
  }
}

struct PersonCOW {
  private var person: Person
  
  var name: String {
    get { person.name }
    set {
      if isKnownUniquelyReferenced(&person) {
        person.name = newValue
      } else {
        person = Person(name: newValue)
        print("make a copy")
      }
    }
  }
  
  init(name: String) {
    self.person = Person(name: name)
  }
}

class CopyOnWriteTests: XCTestCase {
  func testArray_CopyOnWrite() {
    var originalArray = ["a", "b", "c"]
    let copiedArray = originalArray
    
    originalArray.append("d")
    print("originalArray: ", originalArray)
    print("Memory Address of oringalArray: ", MemoryAddress(of: originalArray))
    
    print("copiedArray: ", copiedArray)
    print("Memory Address of copiedArray: ", MemoryAddress(of: copiedArray))
  }
  
  func testPersonCOW() {
    var person1 = PersonCOW(name: "John")
    var person2 = person1
    
    let names = ["Brian", "Stewie", "Peter", "Quagmire"]
    for name in names {
        person1.name = name
    }
    
    print(person1.name)
    print(person2.name)
  }
    

}
