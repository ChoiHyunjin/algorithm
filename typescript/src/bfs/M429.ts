/**
 * Definition for _Node.
 * class _Node {
 *     val: number
 *     children: _Node[]
 *
 *     constructor(v: number) {
 *         this.val = v;
 *         this.children = [];
 *     }
 * }
 */

function levelOrder(root: _Node | null): number[][] {
  if (!root) {
    return []
  }
  let queue: _Node[] = []
  let tempQueue: _Node[] = [root]
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
      tempQueue.push(...node.children)
    }
  }
  return res
}

class _Node {
  val: number
  children: _Node[]
  constructor(v: number) {
    this.val = v
    this.children = []
  }
}
