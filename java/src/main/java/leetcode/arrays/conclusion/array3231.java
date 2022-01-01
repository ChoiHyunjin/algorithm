package leetcode.arrays.conclusion;

public class array3231 {
    private LinkedList2 head = null;
    int length = 3;

    public int thirdMax(int[] nums) {
        for (int number : nums) {
            if (head == null) {
                head = new LinkedList2(number, 0, length);
            } else head.push(number);
        }

        if (head.next != null && head.next.next != null) return head.next.next.value;
        else return head.value;
    }
}

class LinkedList2 {
    int value;
    LinkedList2 next = null;
    int index;
    int length;

    LinkedList2(int value, int index, int length) {
        this.value = value;
        this.index = index;
        this.length = length;
    }

    void push(int number) {
        if (value == number) {
        } else if (value < number) {
            if (length > index + 1) {
                if (next == null) {
                    next = new LinkedList2(value, this.index + 1, length);
                }
                next.push(value);
            }
            this.value = number;
        } else {
            if (length > index + 1) {
                if (next == null) {
                    next = new LinkedList2(number, this.index + 1, length);
                } else next.push(number);
            }
        }
    }
}