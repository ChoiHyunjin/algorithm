package leetcode.arrays.problems;

class ListNode {
  int val;
  ListNode next;

  ListNode(int x) {
    val = x;
    next = null;
  }
}

public class P141 {
  public boolean hasCycle(ListNode head) {
    if (head == null || head.next == null) return false;
    else if (head.val == Integer.MAX_VALUE) return true;
    else {
      head.val = Integer.MAX_VALUE;
      return hasCycle(head.next);
    }
  }

}
