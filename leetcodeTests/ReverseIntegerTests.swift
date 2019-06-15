// https://leetcode.com/problems/reverse-integer/



import XCTest

class ReverseIntegerTests: XCTestCase {

    func testReverseInteger() {
        let input1: Int =  123
        XCTAssertEqual(reverse(input1), 321)
        
        let input2: Int =  -123
        XCTAssertEqual(reverse(input2), -321)
        
        let input3: Int =  120
        XCTAssertEqual(reverse(input3), 21)
        
        // Assume we are dealing with an environment which could only store integers within the 32-bit signed integer range: [−2^31,  2^31 − 1]. For the purpose of this problem, assume that your function returns 0 when the reversed integer overflows.
        let input4: Int = 1534236469
        XCTAssertEqual(reverse(input4), 0)
    }
    
    
    func reverse(_ x: Int) -> Int {
        let modifiedInt: Int = Int(String(String(x).replacingOccurrences(of: "-", with: "").reversed()))!
        if modifiedInt > 2147483647 {
            return 0
        }
        if x < 0 {
            return modifiedInt * -1
        }
        return modifiedInt
    }
    
    func testBetterReverseInteger() {
        let input1: Int =  123
        XCTAssertEqual(betterReverse(input1), 321)
        
        let input2: Int =  -123
        XCTAssertEqual(betterReverse(input2), -321)
        
        let input3: Int =  120
        XCTAssertEqual(betterReverse(input3), 21)
        
        // Assume we are dealing with an environment which could only store integers within the 32-bit signed integer range: [−2^31,  2^31 − 1]. For the purpose of this problem, assume that your function returns 0 when the reversed integer overflows.
        let input4: Int = 1534236469
        XCTAssertEqual(betterReverse(input4), 0)
    }
    
    func betterReverse(_ x: Int) -> Int {
        var x = x
        var output: Int = 0
        
        while x != 0 {
            let pop = x % 10
            x = x / 10
            output = output * 10 + pop
            if (output > Int32.max || output < Int32.min) { return 0 }
        }
        return output
    }

}
