package leetcode.arrays.conclusion;

public class array3231 {
    private int first = Integer.MIN_VALUE, second = Integer.MIN_VALUE, third = Integer.MIN_VALUE;
    private boolean isFirstChanged = false;
    private boolean isSecondChanged = false;
    private boolean isThirdChanged = false;

    public int thirdMax(int[] nums) {
//[1,-2147483648,2]
//        1. 루프 시작
        for (int number : nums) {
//        2. first와 비교 시작
            if (!isFirstChanged) {
                isFirstChanged = true;
                first = number;
            } else if (number == first) {
//        2-1. first와 같으면 무시
            } else if (number > first) {
//        2-2. first보다 클 경우 밀어내기
                int temp = first;
                first = number;
                pushToSecond(temp);
//        3. second와 비교 시작 (2 반복)
            } else if (!isSecondChanged) {
                isSecondChanged = true;
                second = number;
            } else if (number == second) {

            } else if (number > second) {
                pushToSecond(number);
//        4. third와 비교 시작 (3 반복)
            } else if (!isThirdChanged) {
                isThirdChanged = true;
                third = number;
            } else if (number == third) {

            } else if (number > third) {
                pushToThird(number);
            }
        }

        if (isThirdChanged) return third;
        else return first;
    }

    private void pushToSecond(int value) {
        if (value > second) {
            if (isSecondChanged) {
                pushToThird(second);
            } else {
                isSecondChanged = true;
            }
            second = value;
        }
    }

    private void pushToThird(int value) {
        if (value > third) {
            isThirdChanged = true;
            third = value;
        }
    }
}

public class array3231_2 {
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