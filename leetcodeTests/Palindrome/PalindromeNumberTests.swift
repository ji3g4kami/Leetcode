// https://leetcode.com/problems/palindrome-number/

import XCTest

class PalindromeNumberTests: XCTestCase {

    func testPalindromeNumber() {
        let input1: Int =  121
        XCTAssert(isPalindrome(input1))
        
        let input2: Int =  -121
        XCTAssertFalse(isPalindrome(input2))
        
        let input3: Int =  10
        XCTAssertFalse(isPalindrome(input3))
        
        let input4: Int =  1234
        XCTAssertFalse(isPalindrome(input4))
        
        let input5: Int =  0
        XCTAssert(isPalindrome(input5))
    }
    
    func isPalindrome(_ x: Int) -> Bool {
        if x >= 0 && x < 10 { return true }
        if x < 0 || x % 10 == 0 { return false }
        var number = x
        var reversedInt: Int = 0
        
        while number != 0 {
            let last = number % 10
            number = number / 10
            reversedInt = reversedInt * 10 + last
        }
        
        return reversedInt == x
    }

}
