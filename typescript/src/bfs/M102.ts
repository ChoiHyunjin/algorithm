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

function levelOrder(root: TreeNode | null): number[][] {
  if (!root) {
    return []
  }
  let queue: TreeNode[] = []
  let tempQueue: TreeNode[] = [root]
  const res: number[][] = []

  while (tempQueue.length > 0) {
    queue = tempQueue
    tempQueue = []
    res.push([])
    while (queue.length > 0) {
      const node = queue.shift()
      if (!node) {
        break
      }
      res.at(-1)?.push(node.val)
      node.left && tempQueue.push(node.left)
      node.right && tempQueue.push(node.right)
    }
  }

  return res
}
