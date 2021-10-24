package leetcode.arrays.in_pace_operation;

public class array3260 {
    //    [3,1,2,4]
//    [3,2,4,1]
    public int[] sortArrayByParity(int[] nums) {
        if (nums.length == 1) return nums;

        int headPointer = getHeadPointer(nums, 0);
        int tailPointer = getTailPointer(nums, nums.length-1);

        while (headPointer < tailPointer) {
            int temp = nums[headPointer];
            nums[headPointer] = nums[tailPointer];
            nums[tailPointer] = temp;

            headPointer = getHeadPointer(nums, headPointer);
            tailPointer = getTailPointer(nums, tailPointer);
        }

        return nums;
    }

    private int getTailPointer(int[] nums, int start) {
        int ptr = start;
        while (ptr >= 0 && nums[ptr] % 2 == 1) {
            ptr--;
        }
        return ptr;
    }

    private int getHeadPointer(int[] nums, int start) {
        int ptr = start;
        while (ptr < nums.length && nums[ptr] % 2 == 0) {
            ptr++;
        }
        return ptr;
    }
}
