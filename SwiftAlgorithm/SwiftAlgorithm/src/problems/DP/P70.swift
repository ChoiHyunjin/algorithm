//
//  P70.swift
//  Swift3
//
//  Created by choi hyunjin on 2022/02/22.
//

import Foundation

class P70 {
  func climbStairs(_ n: Int) -> Int {
    guard n > 1 else {return 1}
    var dp = Array.init(repeating: 1, count: n+1)
    for i in 2...n{
      dp[i] = dp[i-2] + dp[i-1]
    }
    
    return dp[dp.count-1]
  }
}
