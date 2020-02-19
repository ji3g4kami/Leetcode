//
//  ReverseStringTests.swift
//  leetcodeTests
//
//  Created by 登秝吳 on 2020/1/26.
//  Copyright © 2020 登秝吳. All rights reserved.
//

import XCTest

class ReverseStringTests: XCTestCase {
  
  func reverseString(_ s: inout [Character]) {
    var end = s.endIndex - 1
    var start = s.startIndex
    while start < end {
      s.swapAt(end, start)
      end -= 1
      start += 1
    }
  }
  
  func testReverseString() {
    var input: [Character] = Array("David")
    reverseString(&input)
    XCTAssertEqual(Array("divaD"), input)
  }
  
  
}
