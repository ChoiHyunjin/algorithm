import TreeNode from '../../utils/treeNode'

function flatten(root: TreeNode | null): void {
  flattenDFS(root)
}

function flattenDFS(root: TreeNode | null): TreeNode | null {
  if (!root) {
    return null
  }
  const left = root.left
  const right = root.right
  const leftLast = !left ? left : flattenDFS(left)
  const rightLast = (!right ? right : flattenDFS(right)) ?? root
  if (!leftLast) {
    return rightLast
  }
  root.right = left
  leftLast.right = right
  root.left = null
  return rightLast
}
