package leetcode.arrays.problems;

public class P322 {
  public int coinChange(int[] coins, int amount) {
    if (amount == 0) return 0;
    Arrays.sort(coins);
    ArrayList<Integer> res = new ArrayList<>();

    int tempAmount = amount;
    int start = coins.length - 1;
    do {
      if(res.size()>0) {
        start = res.remove(res.size() - 1);
        tempAmount += coins[start];
        start--;
      }
      for (int i = start; i >= 0 && tempAmount>0; ) {
        int coin = coins[i];
        if(coin <= tempAmount){
          tempAmount -= coin;
          res.add(i);
        }else i--;
      }
    } while (res.size() > 0 && tempAmount != 0);

    return res.size() == 0 ? -1 : res.size();
  }
}
