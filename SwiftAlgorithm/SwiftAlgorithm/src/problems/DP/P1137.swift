//
//  P1137.swift
//  Swift3
//
//  Created by choi hyunjin on 2022/02/23.
//

import Foundation

class P1137 {
  func tribonacci(_ n: Int) -> Int {
    var dp = Array.init(repeating: 0, count: 3)
    dp[1] = 1
    dp[2] = 1
    
    if n < 3 {
      return dp[n]
    }
    
    for i in 3...n{
      let temp = dp[0] + dp[1] + dp[2]
      dp[0] = dp[1]
      dp[1] = dp[2]
      dp[2] = temp
    }
    
    return dp[2]
  }
}
