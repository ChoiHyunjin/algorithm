//
//  P795.swift
//  Swift3
//
//  Created by choi hyunjin on 2022/02/26.
//

import Foundation

class P795 {
  func numSubarrayBoundedMax(_ nums: [Int], _ left: Int, _ right: Int) -> Int {
    var ranges = [[Int]]()
    var range: [Int]? = nil
    for i in 0..<nums.count{
      let num = nums[i]
      if num > right {
        if var r = range {
          r[1] = i-1
          ranges.append(r)
          range = nil
        }
      }else if ((num >= left && num <= right) || num < left) && range == nil{
        range = [Int].init(repeating: i, count: 2)
      }
    }
    if var r = range {
      r[1] = nums.count-1
      ranges.append(r)
      range = nil
    }
    // [73,55,36,5,55,14,9,7,72,52], 32, 69
    // ranges = [[55,7], [52]]
    
    var res = 0
    for r in ranges {
      let count = r[1] - r[0] + 1
      var temp = (count + 1) * count / 2
      var idx = -1
      for i in r[0]...r[1]{
        let num = nums[i]
        if num < left {
          if idx < 0 {
            idx = i
          }
        }else if idx >= 0 {
          // 범위보다 작은 subarray 제거 ([[5],[9,7]])
          let outRange = i - idx
          temp -= (outRange + 1) * outRange / 2
          idx = -1
        }
      }
      if idx >= 0 {
        let outRange = r[1] - idx + 1
        temp -= (outRange + 1) * outRange / 2
      }
      
      res += temp
    }
    return res
  }
}
