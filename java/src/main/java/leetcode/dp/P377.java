package leetcode.dp;

public class P377 {
    public int combinationSum4(int[] nums, int target) {
        int[] dp = new int[target + 1];
        dp[0] = 1;
        int i = 1;
        while (i <= target) {
            for (int num : nums) {
                if (i - num >= 0) {
                    dp[i] += dp[i - num];
                }
            }
            i++;
        }

        return dp[target];
    }
}
