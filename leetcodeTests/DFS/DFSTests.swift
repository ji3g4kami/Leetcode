//
//  DFSTests.swift
//  leetcodeTests
//
//  Created by 登秝吳 on 25/12/2023.
//  Copyright © 2023 登秝吳. All rights reserved.
//

import XCTest

final class DFSTests: XCTestCase {

    func resolveDFS(tree: SimpleTree) -> [Int] {
        var result = [Int]()
        
        var stackTree = [tree]
        
        while !stackTree.isEmpty {
            let current = stackTree.removeLast()
            
//            print("result appended: \(current.value)")
            result.append(current.value)
//            print("result: \(result)")
            
            if let children = current.children {
                for tree in children {
                    stackTree.append(tree)
//                    print("stackTree appened: \(tree)")
                }
            }
        }
        
        return result
    }
    
    func testIterativeDFS() throws {
        let simpleNode = SimpleTree(value: 2, children: [SimpleTree(value: 5), SimpleTree(value: 6)])
        let simpleRoot = SimpleTree(value: 1, children: [simpleNode, SimpleTree(value: 4), SimpleTree(value: 3, children: [SimpleTree(value: 12)])])
        
        XCTAssertEqual(resolveDFS(tree: simpleRoot), [1, 3, 12, 4, 2, 6, 5], "DFS did not match the expected order.")
    }

    class TreeNode {
        var value: Int
        var children: [TreeNode]

        init(_ value: Int) {
            self.value = value
            self.children = []
        }
        
        func addChild(_ child: TreeNode) {
            children.append(child)
        }
    }

    func dfs(_ node: TreeNode?, _ visit: (TreeNode) -> Void) {
        guard let node = node else { return }
//        print("")
//        print("visit \(node.value)")
        visit(node)
        node.children.forEach { dfs($0, visit) }
    }
    
    
    func testRecursiveDFS() {
        // Create nodes
        let node1 = TreeNode(1)
        let node2 = TreeNode(2)
        let node3 = TreeNode(3)
        let node4 = TreeNode(4)
        let node5 = TreeNode(5)
        let node6 = TreeNode(6)
        let node12 = TreeNode(12)
        
        // Build the tree structure
        node1.addChild(node2)
        node1.addChild(node4)
        node1.addChild(node3)
        node2.addChild(node5)
        node2.addChild(node6)
        node3.addChild(node12)
        
        // Expected DFS order
        let expectedOrder = [1, 2, 5, 6, 4, 3, 12]
        
        // Perform DFS
        var result = [Int]()
        dfs(node1) {
            print("")
            print("result append: \($0.value)")
            result.append($0.value)
            print("result: \(result)")
        }
        
        // Assertion
        XCTAssertEqual(result, expectedOrder, "DFS did not match the expected order.")
    }
    
    func dfs(_ node: TreeNode?) -> [Int] {
        guard let node = node else { return [] }
        var result = [node.value] // Start with the current node
        node.children.forEach { result.append(contentsOf: dfs($0)) } // Recursively visit children
        return result
    }
    
    func testDFSReturnsCorrectOrder() {
        // Build the tree
        let node1 = TreeNode(1)
        let node2 = TreeNode(2)
        let node3 = TreeNode(3)
        let node4 = TreeNode(4)
        let node5 = TreeNode(5)
        let node6 = TreeNode(6)
        let node12 = TreeNode(12)
        
        // Build the tree structure
        node1.addChild(node2)
        node1.addChild(node4)
        node1.addChild(node3)
        node2.addChild(node5)
        node2.addChild(node6)
        node3.addChild(node12)
        
        // Expected order
        let expectedOrder = [1, 2, 5, 6, 4, 3, 12]
        
        // Perform DFS and get the result
        let resultOrder = dfs(node1)
        
        // Assert that the result matches the expected order
        XCTAssertEqual(resultOrder, expectedOrder, "The DFS traversal did not match the expected order.")
    }
    
}
