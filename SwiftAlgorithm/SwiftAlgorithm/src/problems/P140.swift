//
//  P140.swift
//  SwiftAlgorithm
//
//  Created by Tophy on 5/25/24.
//

import Foundation

fileprivate class Solution {
  func wordBreak(_ s: String, _ wordDict: [String]) -> [String] {
    var res = [(String, String)]()
    let set = Set(wordDict)
    res.append(("", ""))
    
    let charArr = Array(s)
    for i in 0..<s.count {
      let char = charArr[i]
      var newStrings = [(String, String)]()
      
      for j in 0..<res.count {
        var strings = res[j]
        let word = strings.1 + "\(char)"
        if set.contains(word) {
          newStrings.append((strings.0.count == 0 ? word : strings.0 + " " + word, ""))
        }
        res[j] = (strings.0, word)
      }
      res.append(contentsOf: newStrings)
    }
    
    return res.filter({ strings in
      strings.1 == ""
    }).map { $0.0 }
  }
}
