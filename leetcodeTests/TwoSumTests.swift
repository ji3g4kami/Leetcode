/*
 Given an array of integers, return indices of the two numbers such that they add up to a specific target.

 You may assume that each input would have exactly one solution, and you may not use the same element twice.

 Example:

 Given nums = [2, 7, 11, 15], target = 9,

 Because nums[0] + nums[1] = 2 + 7 = 9,
 return [0, 1].
 */


import XCTest

class TwoSumTests: XCTestCase {
  
  func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var dict = [Int: Int]()
    
    // For every number n,
    for (currentIndex, n) in nums.enumerated() {
      // Find the complement to n that would sum up to the target.
      let complement = target - n
      
      // Check if the complement is in the dictionary.
      if let complementIndex = dict[complement] {
        return [complementIndex, currentIndex]
      }
      
      dict[n] = currentIndex
    }
    return []
  }
  
  func testExample() {
    let nums = [2, 7, 11, 15]
    
    let target = 9
    
    XCTAssertEqual(twoSum(nums, target), [0, 1])
  }

  func testExample2() {
    let nums = [3, 2, 4]
    
    let target = 6
    
    XCTAssertEqual(twoSum(nums, target), [1, 2])
  }
}
