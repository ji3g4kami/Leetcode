/*
 Given a binary tree, find its maximum depth.

 The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.
 */
import XCTest

class MaximunDepthOfBinaryTreeTests: XCTestCase {

  class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    
    init(_ val: Int) {
      self.val = val
    }
  }
  
  func createTree() -> TreeNode {
    let root = TreeNode(3)
    root.left = TreeNode(9)
    root.right = TreeNode(20)
    root.right?.left = TreeNode(15)
    root.right?.right = TreeNode(7)
    return root
  }
  
  func createTree2() -> TreeNode {
    let root = TreeNode(1)
    root.left = TreeNode(2)
    root.right = TreeNode(3)
    root.left?.left = TreeNode(4)
    root.left?.right = TreeNode(5)
    return root
  }
  
  func maxDepth(_ root: TreeNode?) -> Int {
    guard let root = root else {
      return 0
    }
    return 1 + max(maxDepth(root.left), maxDepth(root.right))
  }
  
  func testMaxDepth_example1() {
    let root = createTree()
    XCTAssertEqual(maxDepth(root), 3)
  }
  
  func testMaxDepth_example2() {
    let root = createTree2()
    XCTAssertEqual(maxDepth(root), 3)
  }
}
