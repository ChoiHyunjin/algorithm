package leetcode.etc;

import java.util.ArrayList;

import java.util.List;
import java.util.Objects;

public class P139 {
  public boolean wordBreak(String s, List<String> wordDict) {
    List<String> checkedWordDict = wordDict.stream()
        .filter((String str) -> s.contains(str))
        .toList();
    boolean[] arr = new boolean[s.length() + 1];
    for (int i = 0; i < arr.length; i++) {
      arr[i] = false;
    }

    arr[0] = true;
    int i = 1;
    // dp[i] = (dp[i-word1.length()] && same(s, word1, index)) ||
    // (dp[i-word2.length()] && same(s, word2, index)) || ...
    while (i <= s.length()) {
      for (String word : wordDict) {
        if (i >= word.length()) {
          arr[i] = arr[i - word.length()] && this.same(s, i, word);
          if (arr[i]) {
            break;
          }
        }
      }
      i++;
    }
    return arr[s.length()];
  }

  private boolean same(String s, int end, String word) {
    return s.substring(end - word.length(), end).equals(word);
  }

  public String[] getRemain(String s, String word) {
    int index = s.indexOf(word);
    return index < 0 ? null : new String[] { s.substring(0, index), s.substring(index + word.length()) };
  }

  public static void main(String[] args) {
    P139 obj = new P139();

    List strings = new ArrayList<String>();
    for (String word : new String[] { "leet", "code" }) {
      strings.add(word);
    }
    System.out.println(obj.wordBreak("leetcode", strings));

    strings = new ArrayList<String>();
    for (String word : new String[] { "apple", "pen" }) {
      strings.add(word);
    }
    System.out.println(obj.wordBreak("applepenapple", strings));

    strings = new ArrayList<String>();
    for (String word : new String[] { "cats", "dog", "sand", "and", "cat" }) {
      strings.add(word);
    }
    System.out.println(obj.wordBreak("catsandog", strings));

    strings = new ArrayList<String>();
    for (String word : new String[] { "a", "b", "bbbb" }) {
      strings.add(word);
    }
    System.out.println(obj.wordBreak("bb", strings));

    strings = new ArrayList<String>();
    for (String word : new String[] { "a", "bb", "bbbb" }) {
      strings.add(word);
    }
    System.out.println(obj.wordBreak("bbbbb", strings));

    strings = new ArrayList<String>();
    for (String word : new String[] { "a", "bbb", "bbbb" }) {
      strings.add(word);
    }
    System.out.println(obj.wordBreak("bbbbbbb", strings));

    strings = new ArrayList<String>();
    for (String word : new String[] { "cc", "ac" }) {
      strings.add(word);
    }
    System.out.println(obj.wordBreak("ccaccc", strings));

  }
}
