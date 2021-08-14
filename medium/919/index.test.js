import { TreeNode, CBTInserter } from '.'

describe('CBTInserter', ()=>{
    const tree = new TreeNode(1)
    tree.left = new TreeNode(2)
    const node = new CBTInserter(tree)
    test('test1', ()=>{
        const res= node.insert(new TreeNode(3))
        expect(res.val).toBe(1)
    })
    test('test2', ()=>{
        const res = node.insert(new TreeNode(4))
        expect(res.val).toBe(2)
    })
    test('test3', ()=>{
        const res = node.get_root()
        expect(res.val).toBe(1)
    })
})

describe('TreeNode', ()=>{
    const tree = new TreeNode(1)
    tree.left = new TreeNode(2)
    test('test1', ()=>{

    })
})