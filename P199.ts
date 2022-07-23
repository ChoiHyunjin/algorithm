import TreeNode from "./utils/TreeNode";

function rightSideView(root: TreeNode | null): number[] {
    let res = []

    function dfs(node: TreeNode | null, depth: number){
        if(!node){
            return
        }

        if(res[depth] === undefined){
            res[depth] = node.val
        }
        dfs(node.right, depth+1)
        dfs(node.left, depth+1)
    }

    dfs(root, 0)

    return res
};