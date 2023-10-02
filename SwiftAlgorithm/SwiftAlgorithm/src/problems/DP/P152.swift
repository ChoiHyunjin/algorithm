//
//  P15.swift
//  Swift3
//
//  Created by choi hyunjin on 2022/02/19.
//

import Foundation

class P152{
  func maxProduct(_ nums: [Int]) -> Int {
    var res = nums.contains(0) ? 0 : Int.min
    let list = nums.split(separator: 0, omittingEmptySubsequences: true)
    
    for num in list{
      res = max(res, getMax(num))
    }
    return res
  }
  
  func getMax(_ nums:ArraySlice<Int>) -> Int {
    let start = nums.startIndex
    let end = nums.endIndex
    if end == start+1{
      return nums[start]
    }
    var res = nums[start]
    
    var minusPtr1 = -1
    var minusPtr2 = -1
    
    var dp = Array.init(repeating: 1, count: end-start+1)
    
    for i in 0..<dp.count-1{
      let num = nums[i+start]
      dp[i+1] = dp[i] * num
      if num < 0 {
        if minusPtr1 < 0 {
          minusPtr1 = i
        }else {
          minusPtr2 = i
        }
      }
    }
    
    res = dp[dp.count-1]
    if res < 0 {
      let head = dp[minusPtr1+1]
      if minusPtr2 < 0 {
        res = max(res / head, dp[minusPtr1])
      }else {
        let tail = dp[dp.count-1] / dp[minusPtr2]
        
        res /= max(head, tail)
      }
      return res
    }else {
      return res
    }
  }
}
