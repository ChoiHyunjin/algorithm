package leetcode.arrays.in_pace_operation;

public class array3575 {
    public int removeElement(int[] nums, int val) {
        if (nums.length == 0) return 0;
        else if (nums.length == 1) {
            return nums[0] == val ? 0 : 1;
        }

        int headerPtr = getHeaderPtr(nums, 0, val);
        int tailPtr = getTailPtr(nums, nums.length - 1, val);

        while (headerPtr < tailPtr) {
            int temp = nums[headerPtr];
            nums[headerPtr] = nums[tailPtr];
            nums[tailPtr] = temp;

            headerPtr = getHeaderPtr(nums, headerPtr, val);
            tailPtr = getTailPtr(nums, tailPtr, val);

        }

        return headerPtr;
    }

    private int getHeaderPtr(int[] nums, int start, int val) {
        int ptr = start;
        while (ptr < nums.length && nums[ptr] != val) {
            ptr++;
        }
        return ptr;
    }

    private int getTailPtr(int[] nums, int start, int val) {
        int ptr = start;
        while (ptr >= 0 && nums[ptr] == val) {
            ptr--;
        }
        return ptr;
    }
}
