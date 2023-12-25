//
//  BFSTests.swift
//  leetcodeTests
//
//  Created by 登秝吳 on 25/12/2023.
//  Copyright © 2023 登秝吳. All rights reserved.
//

import XCTest

final class BFSTests: XCTestCase {
    
    let expectedOrder = [1, 2, 4, 3, 5, 6, 12]
    
    struct TreeNode {
        let value: Int
        var children: [TreeNode]
        
        init(value: Int, children: [TreeNode] = []) {
            self.value = value
            self.children = children
        }
        
        mutating func addChild(_ node: TreeNode) {
            self.children.append(node)
        }
    }
    
    func bfs(_ node: TreeNode) -> [Int] {
        var result = [Int]()
        var queue: [TreeNode] = [node]
        
        while !queue.isEmpty {
            let current = queue.removeFirst()
            result.append(current.value)
            
            for child in current.children {
                queue.append(child)
            }
        }
               
        return result
    }
    
    func testBFSWithRecursion() throws {
        let node4 = TreeNode(value: 4)
        let node5 = TreeNode(value: 5)
        let node6 = TreeNode(value: 6)
        let node12 = TreeNode(value: 12)
        
        let node2 = TreeNode(value: 2, children: [node5, node6])
        let node3 = TreeNode(value: 3, children: [node12])
        
        let rootNode1 = TreeNode(value: 1, children: [node2, node4, node3])
        
        XCTAssertEqual(expectedOrder, bfs(rootNode1))
    }
}
