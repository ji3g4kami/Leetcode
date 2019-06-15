// https://leetcode.com/problems/valid-palindrome/

import XCTest
@testable import leetcode

class ValidPalindromeTests: XCTestCase {
    
    func testOnlyAlphanumeric() {
        let str = "-<$abc>+"
        let pattern = "[^A-Za-z0-9]+"
        let result = str.replacingOccurrences(of: pattern, with: "", options: [.regularExpression])
        XCTAssertEqual(result, "abc")
    }

    func testPalindromicSubstring() {
        let input1 = "race a car"
        XCTAssertFalse(isPalindrome(input1))
        
        let input2 = "A man, a plan, a canal: Panama"
        XCTAssert(isPalindrome(input2))
    }
    
    func isPalindrome(_ s: String) -> Bool {
        let pattern = "[^A-Za-z0-9]+"
        let modifiedString = s.lowercased().replacingOccurrences(of: pattern, with: "", options: [.regularExpression])
        let length = modifiedString.count
        let leftSubString = String(modifiedString.prefix(length/2))
        let rightSubString = String(modifiedString.suffix(length/2))
        return leftSubString == String(rightSubString.reversed())
    }

}
