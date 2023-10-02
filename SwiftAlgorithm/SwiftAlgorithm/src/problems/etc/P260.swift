//
//  P260.swift
//  Swift3
//
//  Created by choi hyunjin on 2022/02/13.
//

import Foundation

class P260 {
  func singleNumber(_ nums: [Int]) -> [Int] {
    var res = Array.init(repeating: 0, count: 2)
    
    var counter : UInt = 0
    for num in nums{
      if num != 0 {
        let uintNumber = intToUInt(int:num)
        counter = counter ^ (1 << (uintNumber-1))
      }
    }
    var count = 0
    var ptr = 0
    while counter > 0 {
      let end = counter & 1
      count += 1
      if end > 0 {
        res[ptr] = count
        ptr += 1
      }
      counter = counter >> 1
    }
    
    return res
  }
  
  func intToUInt(int: Int) -> UInt{
    if int < 0 {
      return UInt(abs(int)) + UInt(Int.max)
    }
    return UInt(int)
  }
}
