@testable import leetcode
import XCTest

class HashTableTests: XCTestCase {
  
  func testExample() {
    var hashTable = HashTable<String, String>(capacity: 5)
    
    hashTable["firstName"] = "Steve"
    
    XCTAssertEqual(hashTable["firstName"], "Steve")
    XCTAssertNil(hashTable["lastName"])
    
    hashTable["firstName"] = nil
    XCTAssertNil(hashTable["lastName"])
  }
}
