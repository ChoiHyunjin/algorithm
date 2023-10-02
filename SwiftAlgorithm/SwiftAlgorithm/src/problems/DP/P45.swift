//
//  P45.swift
//  Swift3
//
//  Created by choi hyunjin on 2022/02/22.
//

import Foundation

class P45{
  func jump(_ nums: [Int]) -> Int {
    guard nums.count > 1 else {return 0}
    var count = 0
    var res = 0
    var maxJump = 0
    
    for i in 0..<nums.count-1{
      let num = nums[i]
      maxJump = max(maxJump, num+i)
      res -= 1
      if res <= 0 {
        res = maxJump - i
        count += 1
      }
    }
    return count
  }
}
