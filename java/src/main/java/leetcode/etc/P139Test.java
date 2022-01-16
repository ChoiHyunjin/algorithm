package leetcode.etc;

import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.ArrayList;
import java.util.List;

import org.junit.jupiter.api.Test;

class P139Test {
    P139 obj = new P139();

    @Test
    public void test() {
        List strings = new ArrayList<String>();
        for (String word : new String[] { "leet", "code" }) {
            strings.add(word);
        }
        assertTrue(this.obj.wordBreak("leetcode", strings));
    }
}