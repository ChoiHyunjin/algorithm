package leetcode.arrays.problems;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class P15 {
  public static void main(String[] args) {
    System.out.println(P15.threeSum(new int[]{-2, 0, 1, 1, 2}));
    System.out.println(P15.threeSum(new int[]{0, 0, 0}));
    System.out.println(P15.threeSum(new int[]{0}));
    System.out.println(P15.threeSum(new int[]{}));
    System.out.println(P15.threeSum(new int[]{-1, 0, 1, -1, 2, -4}));
  }

  static public List<List<Integer>> threeSum(int[] nums) {
    List res = new ArrayList<ArrayList<Integer>>();
    if (nums.length >= 3) {
      Arrays.sort(nums);
      for (int i = 0; i < nums.length - 2; i++) {
        int first = nums[i];
        if (i == 0 || nums[i] != nums[i - 1]) {
          List array = new ArrayList<Integer>();
          array.add(first);
          for (int j = nums.length - 1; j > i + 1 && array.size() == 1; j--) {
            int second = nums[j];
            if (j == nums.length - 1 || second != nums[j + 1]) {
              int sum = first + second;
              if (sum > 0) {
                for (int k = i + 1; k < j && array.size() == 1; k++) {
                  int third = nums[k];
                  if (sum + third == 0) {
                    array.add(second);
                    array.add(third);
                  } else if (sum + third > 0) break;
                }
              } else {
                for (int k = j - 1; k > i && array.size() == 1; k--) {
                  int third = nums[k];
                  if (sum + third == 0) {
                    array.add(second);
                    array.add(third);
                  } else if (sum + third < 0) break;
                }
              }
            }
            if (array.size() == 3) {
              res.add(array);
              array = new ArrayList();
              array.add(first);
            }
          }
        }
      }
    }
    return res;
  }
}
