package playground;

import java.io.*;
import java.util.*;
import java.util.function.*;
import java.util.stream.*;

import static java.util.stream.Collectors.*;
import static java.util.Comparator.*;


class Playground {
  public static void main(String[] args) {
    try {
      FileReader fr = new FileReader("./playground/Playground.java");
      BufferedReader br = new BufferedReader(fr);

      String line = "";
      for(int i=1;(line = br.readLine())!=null;i++) {
        //  ";"를 포함한 라인을 출력한다.
        if(line.indexOf(";")!=-1)
          System.out.println(i+":"+line);
      }
// /Users/choihyunjin/Documents/workspaces/leetcode/java
// ../../cke/../
      br.close();
    } catch(IOException e) {}
  } // main
}