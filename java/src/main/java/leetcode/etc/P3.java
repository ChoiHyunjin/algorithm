package leetcode.etc;

import java.util.Arrays;

public class P3 {
  int lengthOfLongestSubstring(String s) {
    if (s.length() == 0) return 0;
    else if (s.length() == 1) return 1;

    int[] flags = new int[256];
    int max = 0;
    int ptr = 0;
    Arrays.fill(flags, -1);

    for (int i = 0; i < s.length(); i++) {
      char ch = s.charAt(i);
      if (flags[ch] >= 0) {
        max = max == 0 ? i : Math.max(i - ptr, max);
        ptr = Math.max(flags[ch]+1, ptr);
      }
      flags[ch] = i;
    }

    return Math.max(max, s.length() - ptr);
  }

  public static void main(String[] args) {
    P3 obj = new P3();
    System.out.println(obj.lengthOfLongestSubstring("ohomm"));
    System.out.println(obj.lengthOfLongestSubstring("dvdf"));
    System.out.println(obj.lengthOfLongestSubstring("abcb"));
    System.out.println(obj.lengthOfLongestSubstring("abba"));
    System.out.println(obj.lengthOfLongestSubstring("abcabcbb"));
    System.out.println(obj.lengthOfLongestSubstring("bb"));
    System.out.println(obj.lengthOfLongestSubstring("pwwkew"));
    System.out.println(obj.lengthOfLongestSubstring("aab"));
    System.out.println(obj.lengthOfLongestSubstring("au"));
  }
}
