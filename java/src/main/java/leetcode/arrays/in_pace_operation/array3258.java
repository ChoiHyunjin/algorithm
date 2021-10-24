package leetcode.arrays.in_pace_operation;

public class array3258 {
    public int removeDuplicates(int[] nums) {
        if (nums == null || nums.length == 0) return 0;
        int length = 1;
        for (int i = 1; i < nums.length; i++) {
            if(nums[length-1] != nums[i]){
                nums[length] = nums[i];
                length++;
            }
        }

        return length;
    }
}
