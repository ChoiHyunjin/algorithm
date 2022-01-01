package leetcode.arrays.problems;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class P73 {
  public void setZeroes(int[][] matrix) {
    // 1. 0 확인
    Set<Integer>[] arr = search(matrix);
    // 3. 좌표 배열에서 꺼내서 0 처리
    int width = matrix[0].length;
    int height = matrix.length;
    for (int ptr : arr[0]) {
      for (int i = 0; i < height; i++) {
        matrix[i][ptr] = 0;
      }
    }
    for (int ptr : arr[1]) {
      for (int i = 0; i < width; i++) {
        matrix[ptr][i] = 0;
      }
    }
  }

  Set<Integer>[] search(int[][] matrix) {
    // 2. 좌표 배열에 넣기
//    ArrayList<int[]> res = new ArrayList<>();
    Set row = new HashSet<Integer>();
    Set column = new HashSet<Integer>();
    for (int j = 0; j < matrix.length; j++) {
      for (int i = 0; i < matrix[0].length; i++) {
        if (matrix[j][i] == 0) {
          row.add(i);
          column.add(j);
        }
      }
    }
    return new Set[]{row, column};
  }


  public static void main(String[] args) {
    P73 res = new P73();
    res.setZeroes(new int[][]{{1, 1, 1}, {1, 0, 1}, {1, 1, 1}});
  }
}
