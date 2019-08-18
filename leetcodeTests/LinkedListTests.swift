//
//  LinkedListTests.swift
//  leetcodeTests
//
//  Created by 登秝吳 on 2019/8/17.
//  Copyright © 2019 登秝吳. All rights reserved.
//

import XCTest
@testable import leetcode

class LinkedListTests: XCTestCase {
    
    var list: LinkedList<Int>!

    override func setUp() {
        super.setUp()
        list = LinkedList<Int>()
    }

    override func tearDown() {
        list = nil
        super.tearDown()
    }

    // MARK: - Given
    func given123list() {
        list.append(1)
        list.append(2)
        list.append(3)
    }
    
    func givenEmptyList() {
        list = LinkedList<Int>()
    }
    
    func testList_nodeAtIndex_returnCorrectNode() {
        // given
        given123list()
        
        // when
        let node = list.node(at: 0)
        
        // then
        XCTAssertEqual(1, node?.value)
    }
    
    func testList_nodeOutOfRange_returnNil() {
        // given
        given123list()
        
        // when
        let node = list.node(at: 3)
        
        // then
        XCTAssertNil(node)
    }
    
    func testList_nodeEmpty_returnNil() {
        // given
        givenEmptyList()
        
        // when
        let node = list.node(at: 1)
        
        // then
        XCTAssertNil(node)
    }
    
    func testList_insertValueAfter_returnNode() {
        // given
        given123list()
        
        // when
        let middleNode = list.node(at: 1)!
        list.insert(-1, after: middleNode)
        
        // then
        XCTAssertEqual(list.description, "1 -> 2 -> -1 -> 3")
    }
    
    func testList_pop_returnValue() {
        // given
        given123list()
        
        // when
        let headValue = list.pop()
        
        // then
        XCTAssertEqual(headValue, 1)
        XCTAssertEqual(list.description, "2 -> 3")
    }
    
    func testEmptyList_pop_returnNil() {
        // given
        givenEmptyList()
        
        // when
        let head = list.pop()
        
        // then
        XCTAssertNil(head)
    }
    
    func testList_removeLast_returnValue() {
        // given
        given123list()
        
        // when
        let last = list.removeLast()
        
        // then
        XCTAssertEqual(last, 3)
        XCTAssertEqual("1 -> 2", list.description)
    }
    
    func testEmptyList_removeLast_returnNil() {
        // given
        givenEmptyList()
        
        // when
        let last = list.removeLast()
        
        // then
        XCTAssertNil(last)
    }

    
    func testList_removeAtIndex_returnValue() {
        // given
        given123list()
        
        // when
        let middle = list.remove(at: 1)
        
        // then
        XCTAssertEqual(middle, 2)
        XCTAssertEqual("1 -> 3", list.description)
    }
    
    func testList_removeOutOfRange_returnValue() {
        // given
        given123list()
        
        // when
        let value = list.remove(at: 4)
        
        // then
        XCTAssertNil(value)
        XCTAssertEqual("1 -> 2 -> 3", list.description)
    }
    
    func testList_remove_returnNil() {
        // given
        givenEmptyList()
        
        // when
        let value = list.remove(at: 3)
        
        // then
        XCTAssertNil(value)
    }
    
}
