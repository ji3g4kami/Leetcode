import XCTest

class LongestPalindromeTests: XCTestCase {

  func longestPalindrome(_ s: String) -> String {
    // If empty or equal to one, we return
    if s.count <= 1 { return s }
    
    var answer = ""
    let charArray = Array<Character>(s)
    
    for index in 0..<charArray.count {
      let oddString = expandFromMiddle_odd(charArray, index: index)
      answer = maxLengthString(s1: answer, s2: oddString)
    }
    
    for index in 0..<charArray.count-1 {
      let evenString = expandFromMiddle_even(charArray, left: index, right: index+1)
      answer = maxLengthString(s1: answer, s2: evenString)
    }
    
    return answer
  }
  
  func expandFromMiddle_odd(_ s: [Character], index : Int) -> String {
    if s.count <= 1 { return "\(s)" }
    
    var leftIndex = index, rightIndex = index

    while (leftIndex > 0 && rightIndex < s.count - 1) {
      if (s[leftIndex - 1] == s[rightIndex + 1]) && (rightIndex != s.count - 1) {
        leftIndex -= 1
        rightIndex += 1
      } else {
        break
      }
    }
    
    return String(s[leftIndex...rightIndex])
  }
  
  func expandFromMiddle_even(_ s: [Character], left: Int, right: Int) -> String {
    guard s[left] == s[right] else {
      return String(s[left])
    }
    
    var leftIndex = left, rightIndex = right

    while (leftIndex > 0 && rightIndex < s.count - 1) {
      if (s[leftIndex - 1] == s[rightIndex + 1]) && (rightIndex != s.count - 1) {
        leftIndex -= 1
        rightIndex += 1
      } else {
        break
      }
    }
    
    return String(s[leftIndex...rightIndex])
  }
  
  func maxLengthString(s1: String, s2: String) -> String {
    return (s1.count >= s2.count) ? s1 : s2
  }
  
  func testExpandFromMiddle_odd() {
    let charArray: [Character] = ["a", "b", "a", "c"]
    
    XCTAssertEqual(expandFromMiddle_odd(charArray, index: 1), "aba")
    
    XCTAssertEqual(expandFromMiddle_odd(charArray, index: 0), "a")
    
    XCTAssertEqual(expandFromMiddle_odd(charArray, index: 3), "c")
  }
  
  func testExpandFromMiddle_even() {
    let charArray: [Character] = ["a", "b", "b", "a", "d"]

    XCTAssertEqual(expandFromMiddle_even(charArray, left: 1, right: 2), "abba")
    
    XCTAssertEqual(expandFromMiddle_even(charArray, left: 3, right: 4), "a")
  }
  
  func testExample1() {
    let string = "babad"
    let longest = "bab"

    XCTAssertEqual(longestPalindrome(string), longest)
  }
  
  func testExample2() {
    let string = "cbbd"
    let longest = "bb"
    
    XCTAssertEqual(longestPalindrome(string), longest)
  }
  
  func testExample3() {
    let string = "aaabaaaa"
    XCTAssertEqual(longestPalindrome(string), "aaabaaa")
  }

}
