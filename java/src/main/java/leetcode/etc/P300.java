package leetcode.etc;

public class P300 {

  static public int lengthOfLIS(int[] nums) {
    int[] list = new int[nums.length];

    int max = 1;
    for (int i = 0; i < nums.length; i++) {
      list[i] = 1;
      for (int j = i - 1; j >= 0; j--) {
        if (nums[i] > nums[j]) {
          if (nums[i] == nums[j]) {
            list[i] = list[j];
            break;
          } else if (nums[i] - 1 == nums[j]) {
            list[i] = list[j] + 1;
            break;
          } else {
            list[i] = Math.max(list[j] + 1, list[i]);
          }
        }
      }
      max = Math.max(max, list[i]);
    }
    return max;
  }

  public static void main(String[] args) {
    System.out.println(P300.lengthOfLIS(new int[]{1, 3, 6, 7, 9, 4, 10, 5, 6}));
//    System.out.println(P300.lengthOfLIS(new int[]{4,5,4,3,8,9}));
//    System.out.println(P300.lengthOfLIS(new int[]{4,10,4,3,8,9}));
//    System.out.println(P300.lengthOfLIS(new int[]{10, 9, 2, 5, 3, 7, 101, 18}));
//    System.out.println(P300.lengthOfLIS(new int[]{0, 1, 0, 3, 2, 3}));
  }
}
