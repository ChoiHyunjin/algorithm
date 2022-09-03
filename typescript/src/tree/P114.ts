import TreeNode from '../utils/TreeNode'

function flatten(root: TreeNode | null): void {
  flattenDFS(root)
}

function flattenDFS(root: TreeNode | null): TreeNode | null {
  if (!root) {
    return null
  }
  const left = root.left
  const right = root.right
  const leftLast = flattenDFS(left)
  const rightLast = flattenDFS(right) ?? root
  if (!leftLast) {
    return rightLast
  }
  root.right = left
  leftLast.right = right
  root.left = null
  return rightLast
}
