package leetcode.arrays.problems;

public class P206 {
  public ListNode reverseList(ListNode head) {
    if (head == null) return null;

    ListNode[] res = reverse(head);
    res[1].next = null;

    return res[0];
  }

  public ListNode[] reverse(ListNode head) {
    if (head.next != null) {
      ListNode[] prev = reverse(head.next);
      prev[1].next = head;
      prev[1] = head;
      return prev;
    } else {
      return new ListNode[]{head, head};
    }
  }
}
