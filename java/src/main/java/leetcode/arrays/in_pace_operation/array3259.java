package leetcode.arrays.in_pace_operation;

public class array3259 {
    public int[] replaceElements(int[] arr) {
        int max = arr[arr.length - 1];
        arr[arr.length - 1] = -1;
        for (int i = arr.length - 2; i >= 0; i--) {
            if (max < arr[i]) {
                int temp = arr[i];
                arr[i] = max;
                max = temp;
            }else {
                arr[i] = max;
            }
        }
        return arr;
    }
}
