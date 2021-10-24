package leetcode.arrays.conclusion;

public class array3228 {
    public int heightChecker(int[] heights) {
        if (heights.length == 1) return 1;

        int res = 0;

        int[] orderedHeights = heights.clone();
        sort(orderedHeights);

        return res;
    }

    private int[] sort(int[] array) {
        mergeSort(array, 0, array.length);
        return array;
    }

    private void mergeSort(int[] array, int start, int length) {
        int half = length / 2;
        if (half > 1) {
            mergeSort(array, start, half);
            mergeSort(array, start + half, half);
        }

        int first = start;
        int second = start + half;
        int temp = array[first];

        int[] arr = new int[length];
        for (int i = 0; i < length; i++) {
            if (second >= start+length || array[first] < array[second]) {
                arr[i] = array[first];
                first++;
            } else {
                arr[i] = array[second];
                second++;
            }
        }
    }
}
