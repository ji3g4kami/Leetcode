//
//  FourSumTests.swift
//  leetcodeTests
//
//  Created by 登秝吳 on 2020/2/19.
//  Copyright © 2020 登秝吳. All rights reserved.
//

import XCTest

class FourSumTests: XCTestCase {
  
  func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
    let sorted = nums.sorted()
    var results = [[Int]]()
    
    if nums.count < 4 {
      return results
    }
    
    for i in 0...sorted.count-4 {
      // cutting branch
      if i > 0 && sorted[i] == sorted[i-1] { continue }
      for j in i+1...sorted.count-3 {
        // cutting branch
        if j > i+1 && sorted[j] == sorted[j-1] { continue }
        var left = j + 1
        var right = sorted.count-1
        
        while left < right {
          let sum = sorted[i] + sorted[j] + sorted[left] + sorted[right]
          if sum == target {
            results.append([sorted[i], sorted[j], sorted[left], sorted[right]])
            right -= 1
            left += 1
            while sorted[right] == sorted[right+1] && left < right {
              right -= 1
            }
            while sorted[left] == sorted[left-1] && left < right {
              left += 1
            }
          } else if sum > target {
            right -= 1
          } else {
            left += 1
          }
        }
      }
    }
    return results
  }
  
  func testExample() {
    let nums = [1, 0, -1, 0, -2, 2]
    let target = 0
    
    XCTAssertEqual(fourSum(nums, target).count,
                    [
                      [-1,  0, 0, 1],
                      [-2, -1, 1, 2],
                      [-2,  0, 0, 2]
      ].count)
  }
}
