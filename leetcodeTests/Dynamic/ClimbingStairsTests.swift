/*
You are climbing a stair case. It takes n steps to reach to the top.

Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?
 */

import XCTest

class ClimbingStairsTests: XCTestCase {

  func climbStairs(_ n: Int) -> Int {
    if n < 4 { return n }
    
    var dict = [
      1:1,
      2:2,
      3:3
    ]
    
    for i in 4...n {
      dict[i] = dict[i-2]! + dict[i-1]!
    }
    
    return dict[n]!
  }
  
  func testExample() {
    XCTAssertEqual(climbStairs(2), 2)
    XCTAssertEqual(climbStairs(3), 3)
    XCTAssertEqual(climbStairs(4), 5)
    XCTAssertEqual(climbStairs(5), 8)
  }
}
