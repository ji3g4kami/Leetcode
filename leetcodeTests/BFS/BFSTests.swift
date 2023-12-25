//
//  BFSTests.swift
//  leetcodeTests
//
//  Created by 登秝吳 on 25/12/2023.
//  Copyright © 2023 登秝吳. All rights reserved.
//

import XCTest

final class BFSTests: XCTestCase {
    
    func resolveBFS(_ tree: SimpleTree) -> [Int] {
        var result = [Int]()
        var queueTree = [tree]
        
        while !queueTree.isEmpty {
            let current = queueTree.removeFirst()
            
            result.append(current.value)
            
            if let children = current.children {
                for tree in children {
                    queueTree.append(tree)
                }
            }
            
        }
        return result
    }

    func testBFS() throws {
        let simpleNode = SimpleTree(value: 2, children: [SimpleTree(value: 5), SimpleTree(value: 6)])
        let simpleRoot = SimpleTree(value: 1, children: [simpleNode, SimpleTree(value: 4), SimpleTree(value: 3, children: [SimpleTree(value: 12)])])
        
        XCTAssertEqual([1, 2, 4, 3, 5, 6, 12], resolveBFS(simpleRoot))
    }
}
