/**
 * Definition for singly-linked list.
 * function ListNode(val, next) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.next = (next===undefined ? null : next)
 * }
 */
/**
 * @param {ListNode} head
 * @return {ListNode}
 */
 var deleteDuplicates = function(head) {
     // 0. 0개면 [] 리턴
    if(head == null) return null
    let res = null
    let ptr = head
    let tail = ptr
    while(ptr?.next){
        if(!isDuplicated(ptr)){
            // 1. 헤드 찾기
            if(res == null){
                res = ptr
                tail = ptr
            }else{
                tail.next = ptr
                tail = tail.next
            }
        }
        ptr = moveToNotDuplicatedNode(ptr)
    }
    if(ptr){
        if(res == null){
            res = ptr
            res.next = null
        }else{
            tail.next = ptr
            tail = tail.next
        }
    }
    tail.next = null

     // 3.3 헤드 리턴
     return res
};

export function moveToNotDuplicatedNode(node) {
    const head = node
    let ptr = node
    while (isDuplicated(ptr)) {
        ptr = ptr.next;
    }
    return ptr.next;
}

export function isDuplicated(n1){
    const n2 = n1?.next
    return n1.val === n2?.val
}

export default deleteDuplicates