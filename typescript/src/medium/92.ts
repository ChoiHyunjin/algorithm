import ListNode from './tree/ListNode'

function reverseBetween(
  head: ListNode | null,
  left: number,
  right: number,
): ListNode | null {
  let ptr: ListNode | undefined | null = head
  for (let i = 1; i < left; i += 1) {
    ptr = ptr?.next
  }

  function tweak(
    head: ListNode | null | undefined,
    count: number,
  ): ListNode | undefined | null {
    if (!head) {
      return
    }

    let temp: ListNode | undefined | null
    if (count > 0) {
      temp = tweak(head?.next, count - 1)
    }

    if (!temp) {
      return head
    }
  }

  tweak(ptr, right - left + 1)

  return head
}
