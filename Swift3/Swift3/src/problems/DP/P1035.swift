//
//  1035.swift
//  Swift3
//
//  Created by choi hyunjin on 2022/02/21.
//

import Foundation

class P1035{
  func maxUncrossedLines(_ nums1: [Int], _ nums2: [Int]) -> Int {
    var dp = Array.init(repeating: [Int].init(repeating: 0, count: nums2.count+1), count: nums1.count+1)
    
    for i in 0..<nums1.count {
      for j in 0..<nums2.count {
        if nums1[i] == nums2[j] {
          dp[i+1][j+1] = dp[i][j] + 1
        }else {
          dp[i+1][j+1] = max(dp[i][j+1], dp[i+1][j])
        }
        debugPrint(dp)
      }
    }
    
    return dp[nums1.count][nums2.count]
  }
}

//   1 1 2 1
// 3 0 0 0 0
// 3 0 0 0 0
// 1 1 1 1 1
