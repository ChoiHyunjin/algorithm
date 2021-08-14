import { connect, Queue } from '.'

describe('queue', ()=>{
    const q = new Queue()
    test('enqueue', ()=>{
        q.enqueue('a')
        console.log(q)
        expect(q.getQueue()[0]).toBe('a')
    })
})
  
describe('connect', ()=>{
    test('1', ()=>{
        const root = makeNode(
            {
                val: 1,
                left: {
                  val: 2,
                  left: { val: 4, left: null, right: null, next: null },
                  right: { val: 5, left: null, right: null, next: null },
                  next: null
                },
                right: {
                  val: 3,
                  left: null,
                  right: { val: 7, left: null, right: null, next: null },
                  next: null
                },
                next: null
              })
        const res = connect(root)
    })
})

function makeNode(root){
    return new Node2(root.val, root.left ? makeNode(root.left): null,root.right ? makeNode(root.right): null, null )
}

function Node2(val, left, right, next) {
    this.val = val === undefined ? null : val;
    this.left = left === undefined ? null : left;
    this.right = right === undefined ? null : right;
    this.next = next === undefined ? null : next;
};