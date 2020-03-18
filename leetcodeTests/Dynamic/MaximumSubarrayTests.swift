/*
 Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.
 */
import XCTest

class MaximumSubarrayTests: XCTestCase {

  func maxSubArray(_ nums: [Int]) -> Int {
    var answer = nums[0]
    var best = nums[0]
    
    for i in 1..<nums.count {
      answer = max(nums[i], answer + nums[i])
      best = max(answer, best)
    }
   
    return best
  }
  
  func testExample() {
    let nums = [-2, 1, -3, 4, -1, 2, 1, -5, 4]
    XCTAssertEqual(maxSubArray(nums), 6)
  }

}
