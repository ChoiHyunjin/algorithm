/**
 * Definition for singly-linked list.
 * class ListNode {
 *     val: number
 *     next: ListNode | null
 *     constructor(val?: number, next?: ListNode | null) {
 *         this.val = (val===undefined ? 0 : val)
 *         this.next = (next===undefined ? null : next)
 *     }
 * }
 */

import ListNode from '../../utils/ListNode'

function oddEvenList(head: ListNode | null): ListNode | null {
  if (!head || !head.next) {
    return head
  }
  let odd: {
    head: ListNode
    tail: ListNode
  } = { head: head, tail: head }
  let even: {
    head: ListNode
    tail: ListNode
  } = { head: head.next, tail: head.next }

  let pointer = even.head.next
  let isEven = false
  while (pointer) {
    if (isEven) {
      even.tail.next = pointer
      even.tail = pointer
    } else {
      odd.tail.next = pointer
      odd.tail = pointer
    }
    pointer = pointer.next

    isEven = !isEven
  }
  pointer = odd.head
  while (pointer) {
    console.log(pointer.val)
    pointer = pointer.next
  }

  odd.tail.next = even.head
  even.tail.next = null
  return odd.head
}
