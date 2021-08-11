import deleteDuplicates, { isDuplicated, moveToNotDuplicatedNode } from "."

class Node{
    constructor(val){
        this.val = val
    }

    get next(){
        return this._next
    }
    set next(n){
        this._next = n
    }
}
describe('isDuplicated', ()=>{
    const node = new Node(1)
    let ptr = null
    node.next = new Node(2)
    ptr = node.next
    ptr.next = new Node(2)
    ptr = ptr.next
    ptr.next = new Node(3)
    ptr = ptr.next
    ptr.next = new Node(4)
    test('test 1', ()=>{
        expect(isDuplicated(node)).toBe(false)
    })
    test('test 2', ()=>{
        expect(isDuplicated(node.next)).toBe(true)
    })
    test('test 2', ()=>{
        expect(isDuplicated(ptr)).toBe(false)
    })
})
describe('moveToNotDuplicatedNode', ()=>{
    const node = new Node(1)
    let ptr = null
    node.next = new Node(2)
    ptr = node.next
    ptr.next = new Node(2)
    ptr = ptr.next
    ptr.next = new Node(3)
    ptr = ptr.next
    ptr.next = new Node(4)
    test('test 1', ()=>{
        const res = moveToNotDuplicatedNode(node)
        expect(res.val).toBe(2)
    })
    test('test 2', ()=>{
        const res = moveToNotDuplicatedNode(node.next)
        expect(res.val).toBe(3)
    })
    test('test 2 next', ()=>{
        const res = moveToNotDuplicatedNode(node.next)
        expect(res.next.val).toBe(4)
    })
    test('test 4', ()=>{
        const res = moveToNotDuplicatedNode(node.next.next.next)
        expect(res.val).toBe(4)
    })
    test('test 5', ()=>{
        const res = moveToNotDuplicatedNode(node.next.next.next.next)
        expect(res).toBe(undefined)
    })
})
describe('deleteDuplicates', ()=>{
    test('test 1', ()=>{
        const node = new Node(1)
        let ptr = null
        node.next = new Node(2)
        ptr = node.next
        ptr.next = new Node(3)
        ptr = ptr.next
        ptr.next = new Node(3)
        ptr = ptr.next
        ptr.next = new Node(4)
        ptr = ptr.next
        ptr.next = new Node(4)
        ptr = ptr.next
        ptr.next = new Node(5)
        const res = deleteDuplicates(node)
        console.log('res:',res)
        expect(res).toBe(false)
    })
    test('test 2', ()=>{
        const node = new Node(1)
        let ptr = null
        node.next = new Node(2)
        ptr = node.next
        ptr.next = new Node(2)
        const res = deleteDuplicates(node)
        console.log('res:',res)
        expect(res).toBe(false)
    })
    test('test 3', ()=>{
        const node = new Node(1)
        let ptr = null
        node.next = new Node(1)
        ptr = node.next
        node.next = new Node(2)
        ptr = node.next
        ptr.next = new Node(2)
        const res = deleteDuplicates(node)
        console.log('res:',res)
        expect(res).toBe(false)
    })
})