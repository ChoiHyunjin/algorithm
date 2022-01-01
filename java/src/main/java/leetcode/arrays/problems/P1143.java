package leetcode.arrays.problems;


// a,b,c,d,e,a  d,a,c,e
public class P1143 {
  public int longestCommonSubsequence(String text1, String text2) {
    int[][] map = new int[text1.length()][text2.length()];
    int res = 0;

    for (int i = 0; i < text1.length(); i++) {
      for (int j = 0; j < text2.length(); j++) {
        if (text2.charAt(j) == text1.charAt(i)) {
          map[i][j] = checkValue(map, i, j) + 1;
          res = Math.max(map[i][j], res);
        }
      }
    }
    return res;
  }

  int checkValue(int[][] map, int y, int x) {
    int res = 0;
    int[][] points = new int[2][2];
    int count = 0;
    for (int i = y - 1; i >= 0 && count < 2; i--) {
      for (int j = x - 1; j >= 0 && count < 2; j--) {
        if (map[i][j] > 0) {
          points[count++] = new int[]{i, j};
        }
      }
    }
    if (count == 1) res = map[points[0][0]][points[0][1]];
    else if (count == 2) {
      int startY = Math.min(points[0][0], points[1][0]);
      int startX = Math.min(points[0][1], points[1][1]);
      for (int i = y - 1; i >= startY; i--) {
        for (int j = x - 1; j >= startX; j--) {
          if (map[i][j] > 0) {
//          startY = i;
            startX = j;
            res = Math.max(map[i][j], res);
          }
        }
      }
    }
    return res;
  }

  public static void main(String[] args) {
    P1143 c = new P1143();
    int res = c.longestCommonSubsequence("abcde", "ace");
  }
}
