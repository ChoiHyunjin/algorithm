import TreeNode from '../../utils/treeNode'

function buildTree(preorder: number[], inorder: number[]): TreeNode | null {
  let root: TreeNode | null =
    preorder.length > 0 ? new TreeNode(preorder[0]) : null

  if (!root) {
    return null
  }
  const rootIndex = inorder.indexOf(root.val)
  root.left = buildTree(
    preorder.slice(1, rootIndex + 1),
    inorder.slice(0, rootIndex),
  )
  root.right = buildTree(
    preorder.slice(rootIndex + 1),
    inorder.slice(rootIndex + 1),
  )

  return root
}
