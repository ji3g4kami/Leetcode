/*
Given two binary trees, write a function to check if they are the same or not.

Two binary trees are considered the same if they are structurally identical and the nodes have the same value.
*/
import XCTest

class SameTreeTests: XCTestCase {
  
  class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    
    init(_ val: Int) {
      self.val = val
    }
  }
  
  func creatTree1_1() -> TreeNode {
    let root = TreeNode(1)
    root.left = TreeNode(2)
    root.right = TreeNode(3)
    return root
  }
  
  func creatTree2_1() -> TreeNode {
    let root = TreeNode(1)
    root.left = TreeNode(2)
    return root
  }
  
  func createTree2_2() -> TreeNode {
    let root = TreeNode(1)
    root.right = TreeNode(2)
    return root
  }
  
  func createTree3_1() -> TreeNode {
    let root = TreeNode(1)
    root.left = TreeNode(2)
    root.right = TreeNode(1)
    return root
  }
  
  func createTree3_2() -> TreeNode {
    let root = TreeNode(1)
    root.left = TreeNode(1)
    root.right = TreeNode(2)
    return root
  }
  
  func serialization(tree: TreeNode) -> [Int?] {
    var answer = [Int?]()
    
    func visit(_ node: TreeNode) {
      answer.append(node.val)
      if let left = node.left {
        visit(left)
      } else {
        answer.append(nil)
      }
      if let right = node.right {
        visit(right)
      } else {
        answer.append(nil)
      }
    }
    
    visit(tree)
    return answer
  }
  
  func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
    if p == nil && q == nil { return true }
    guard let p = p, let q = q else {
      return false
    }
    let pArray = serialization(tree: p)
    let qArray = serialization(tree: q)
    return pArray == qArray
  }
  
  func testSerialization() {
    let tree2_1 = creatTree2_1()
    XCTAssertEqual(serialization(tree: tree2_1), [1, 2, nil, nil, nil])
    
    let tree2_2 = createTree2_2()
    XCTAssertEqual(serialization(tree: tree2_2), [1, nil, 2, nil, nil])
  }
  
  func testIsSameTree_allNil() {
    XCTAssertTrue(isSameTree(nil, nil))
  }

  func testIsSameTree_example1() {
    let tree1_1 = creatTree1_1()
    let tree1_2 = creatTree1_1()
    XCTAssertTrue(isSameTree(tree1_1, tree1_2))
  }
  
  func testIsSameTree_example2() {
    let tree2_1 = creatTree2_1()
    let tree2_2 = createTree2_2()
    XCTAssertFalse(isSameTree(tree2_1, tree2_2))
  }
  
  func testIsSameTree_example3() {
    let tree3_1 = createTree3_1()
    let tree3_2 = createTree3_2()
    XCTAssertFalse(isSameTree(tree3_1, tree3_2))
  }
    
}
