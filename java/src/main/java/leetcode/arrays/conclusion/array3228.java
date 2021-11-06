package leetcode.arrays.conclusion;

import java.util.Arrays;

public class array3228 {
    public int heightChecker(int[] heights) {
        if (heights.length == 1) return 1;

        int res = 0;

        int[] orderedHeights = heights.clone();
        Arrays.sort(orderedHeights);
        for (int i = 0; i < orderedHeights.length; i++) {
            if (orderedHeights[i] != heights[i]) res += 1;
        }

        return res;
    }
}
