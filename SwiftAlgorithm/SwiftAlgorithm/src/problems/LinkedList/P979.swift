//
//  P979.swift
//  SwiftAlgorithm
//
//  Created by Tophy on 5/19/24.
//

import Foundation

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */

fileprivate class TreeNode {
  public var val: Int
  public var left: TreeNode?
  public var right: TreeNode?
  public init() { self.val = 0; self.left = nil; self.right = nil; }
  public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
  public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
    self.val = val
    self.left = left
    self.right = right
  }
}

fileprivate class Solution {
  func distributeCoins(_ root: TreeNode?) -> Int {
    guard let root = root else {
      return 0
    }
    var res = 0
    
    func dfs(_ node: TreeNode) -> ([Int], Int) {
      var childHistories = [Int]()
      var coins = 0
      if let child = node.left {
        let historiesTemp = dfs(child)
        childHistories += historiesTemp.0
        coins += historiesTemp.1
      }
      if let child = node.right {
        let historiesTemp = dfs(child)
        childHistories += historiesTemp.0
        coins += historiesTemp.1
      }
      
      if node.val == 0 {
        childHistories.append(0)
      } else if node.val > 1 {
        while node.val > 1 && !childHistories.isEmpty {
          res += childHistories.removeFirst()
          node.val -= 1
        }
      }
      
      if node.val > 1 {
        coins += node.val - 1
      }
      
      while coins > 0 && !childHistories.isEmpty {
        res += childHistories.removeFirst()
        coins -= 1
      }
      res += coins
      
      for i in 0..<childHistories.count {
        childHistories[i] += 1
      }
      
      return (childHistories, coins)
    }
    dfs(root)
    
    return res
  }
}
