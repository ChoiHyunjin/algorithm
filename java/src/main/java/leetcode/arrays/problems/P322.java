package leetcode.arrays.problems;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.stream.Stream;

public class P322 {
  public int coinChange(int[] coins, int amount) {
    if (amount == 0) return 0;
    Arrays.sort(coins);
    ArrayList<Integer> res = new ArrayList<>();
    int result = Integer.MAX_VALUE;
    boolean flag = false;
    int tempAmount = amount;
    int start = coins.length - 1;
    do {
      if (res.size() > 0) {
        start = res.remove(res.size() - 1);
        tempAmount += coins[start];
        start--;
      }
      for (int i = start; i >= 0 && tempAmount > 0; ) {
        int coin = coins[i];
        if (coin <= tempAmount) {
          tempAmount -= coin;
          res.add(i);
        } else i--;
      }
      if (tempAmount == 0) {
        result = Math.min(result, res.size());
        flag = true;
      }
      ;
    } while (res.size() > 0);

    return flag ? result : -1;

  }
}
