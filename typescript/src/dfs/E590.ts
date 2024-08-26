/**
 * Definition for node.
 * class _Node {
 *     val: number
 *     children: _Node[]
 *     constructor(val?: number) {
 *         this.val = (val===undefined ? 0 : val)
 *         this.children = []
 *     }
 * }
 */

function postorder(root: Node590 | null): number[] {
  const res: number[] = []
  const dfs = (node: Node590) => {
    node.children.forEach((child) => dfs(child))
    res.push(node.val)
  }
  root && dfs(root)
  return res
}

class Node590 {
  val: number
  children: Node590[]
  constructor(val?: number) {
    this.val = val === undefined ? 0 : val
    this.children = []
  }
}
