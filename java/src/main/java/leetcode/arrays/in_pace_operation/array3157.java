package leetcode.arrays.in_pace_operation;

public class array3157 {
    //    1 <= nums.length <= 104
//    -231 <= nums[i] <= 231 - 1
    public void moveZeroes(int[] nums) {
        if (nums.length == 1) return;
        int zeroIndex = -1;
        for (int i = 0; i < nums.length; i++) {
            if (nums[i] == 0) {
                if (zeroIndex < 0) zeroIndex = i;
            } else if (zeroIndex >= 0) {
                nums[zeroIndex] = nums[i];
                nums[i] = 0;
                zeroIndex++;
            }
        }
        return;
    }
}
