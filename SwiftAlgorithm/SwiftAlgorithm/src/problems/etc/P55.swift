//
//  P55.swift
//  Swift3
//
//  Created by choi hyunjin on 2022/02/19.
//

import Foundation

class P55{
  func canJump(_ nums: [Int]) -> Bool {
    var zeroPtr = -1
    for i in stride(from: nums.count-1, to: -1, by: -1){
      if zeroPtr > 0 {
        if nums[i] > zeroPtr - i{
          zeroPtr = -1
        }
      }else if nums[i] == 0 {
        zeroPtr = i
      }
    }
    
    return zeroPtr < 0
  }
}
