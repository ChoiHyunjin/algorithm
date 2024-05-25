//
//  P139.swift
//  SwiftAlgorithm
//
//  Created by Tophy on 5/12/24.
//

import Foundation
class P139 {
  func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
    var dp = Array(repeating: false, count: s.count+1)
    dp[0] = true
    
    for i in 1...s.count {
      
      for j in 0..<wordDict.count {
        if dp[i] {
          break
        }
        let word = wordDict[j]
        if i < word.count {
          continue
        }
        let startAt = s.index(s.startIndex, offsetBy: i-word.count)
        let endAt = s.index(s.startIndex, offsetBy: i)
        let target = dp[i-word.count] ? s[startAt..<endAt] : s[..<endAt]
        dp[i] = target == word
      }
    }
    
    return dp.last ?? false
  }
}
