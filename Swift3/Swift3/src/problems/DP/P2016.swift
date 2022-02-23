//
//  P2016.swift
//  Swift3
//
//  Created by choi hyunjin on 2022/02/23.
//

import Foundation

class P2016{
  func maximumDifference(_ nums: [Int]) -> Int {
    var minNum = nums[0]
    
    var res = -1
    for num in nums {
      if minNum >= num{
        minNum = num
      }else {
        res = max(res, num-minNum)
      }
    }
    
    return res
  }
}
