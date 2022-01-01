package leetcode.arrays.problems;

public class P11 {
  // wrong answer
  public int maxArea(int[] heights) {
    int max = 0;
    int hPtr = 0;
    int nextHPtr = 0;
    int tPtr = heights.length - 1;
    int nextTPtr = heights.length - 1;
    int temp = this.calculate(hPtr, tPtr, heights);
    max = Math.max(max, temp);
    while (hPtr < tPtr) {
       while (nextHPtr < tPtr && heights[hPtr] >= heights[nextHPtr]) {
         nextHPtr += 1;
       }
       while (nextTPtr > hPtr && heights[tPtr] >= heights[nextTPtr])
         nextTPtr -= 1;
       // if(nextHPtr >= tPtr && nextTPtr <= hPtr) break;
       int next1 = calculate(hPtr, nextTPtr, heights);
       int next2 = calculate(nextHPtr, tPtr, heights);
       if (next1 < next2) {
         hPtr = nextHPtr;
         if(nextTPtr <= hPtr) nextTPtr = tPtr;
         max = Math.max(max, next2);
       } else {
         tPtr = nextTPtr;
         if(nextHPtr >= tPtr) nextHPtr = hPtr;
         max = Math.max(max, next1);
       }
    }

    return max;
  }

  // 4ms
  public int maxArea2(int[] heights) {
    int hPtr = 0;
    int tPtr = heights.length - 1;
    int max = this.calculate(hPtr, tPtr, heights);
    while (hPtr < tPtr) {
      if (heights[hPtr] > heights[tPtr]) tPtr--;
      else hPtr++;
      max = Math.max(this.calculate(hPtr, tPtr, heights), max);
    }

    return max;
  }


  public int calculate(int start, int end, int[] heights) {
    int y1 = heights[start];
    int y2 = heights[end];
    int width = end > start ? end - start : start - end;
    int height = y1 > y2 ? y2 : y1;
    return width * height;
  }

}