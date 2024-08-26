/**
 * Definition for a binary tree node.
 * class TreeNode {
 *     val: number
 *     left: TreeNode | null
 *     right: TreeNode | null
 *     constructor(val?: number, left?: TreeNode | null, right?: TreeNode | null) {
 *         this.val = (val===undefined ? 0 : val)
 *         this.left = (left===undefined ? null : left)
 *         this.right = (right===undefined ? null : right)
 *     }
 * }
 */

import TreeNode from '../leetcode/utils/TreeNode'

function lowestCommonAncestor(
  root: TreeNode | null,
  p: TreeNode | null,
  q: TreeNode | null,
): TreeNode | null {
  let res: TreeNode | null = null
  const dfs = (node: TreeNode | null): TreeNode | null => {
    if (!node || res) {
      return null
    }

    const left = dfs(node.left)
    const right = dfs(node.right)
    if (res) {
      return null
    }
    if (left && right) {
      res = node
      return null
    } else if (node.val === p?.val || node.val === q?.val) {
      if (left || right) {
        res = node
        return null
      }
      return node
    }
    return left ?? right
  }

  dfs(root)

  return res
}
