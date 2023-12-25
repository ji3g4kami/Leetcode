//
//  DFSTests.swift
//  leetcodeTests
//
//  Created by 登秝吳 on 25/12/2023.
//  Copyright © 2023 登秝吳. All rights reserved.
//

import XCTest

final class DFSTests: XCTestCase {
    
    let expectedOrder = [1, 2, 5, 6, 4, 3, 12]

//    func resolveDFS(tree: SimpleTree) -> [Int] {
//        var result = [Int]()
//        
//        var stackTree = [tree]
//        
//        while !stackTree.isEmpty {
//            let current = stackTree.removeLast()
//            
////            print("result appended: \(current.value)")
//            result.append(current.value)
////            print("result: \(result)")
//            
//            if let children = current.children {
//                for tree in children {
//                    stackTree.append(tree)
////                    print("stackTree appened: \(tree)")
//                }
//            }
//        }
//        
//        return result
//    }
//    
//    func testIterativeDFS() throws {
//        let simpleNode = SimpleTree(value: 2, children: [SimpleTree(value: 5), SimpleTree(value: 6)])
//        let simpleRoot = SimpleTree(value: 1, children: [simpleNode, SimpleTree(value: 4), SimpleTree(value: 3, children: [SimpleTree(value: 12)])])
//        
//        XCTAssertEqual(resolveDFS(tree: simpleRoot), [1, 3, 12, 4, 2, 6, 5], "DFS did not match the expected order.")
//    }
    
    func testDFSIteritavely() {
        
    }

    func dfs(_ node: TreeNode?, _ visit: (TreeNode) -> Void) {
        guard let node = node else { return }
//        print("")
//        print("visit \(node.value)")
        visit(node)
        node.children.forEach { dfs($0, visit) }
    }
    
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
    
    
    func dfs(node: TreeNode) -> [Int] {
        var result = [Int]()
        result.append(node.value)
        
        node.children.forEach { result.append(contentsOf: dfs(node: $0)) }
        
        return result
    }

    func testDFSWithRecursion() throws {
        let node4 = TreeNode(value: 4)
        let node5 = TreeNode(value: 5)
        let node6 = TreeNode(value: 6)
        let node12 = TreeNode(value: 12)
        
        let node2 = TreeNode(value: 2, children: [node5, node6])
        let node3 = TreeNode(value: 3, children: [node12])
        
        let rootNode1 = TreeNode(value: 1, children: [node2, node4, node3])
        
        XCTAssertEqual(expectedOrder, dfs(node: rootNode1))
    }
}
