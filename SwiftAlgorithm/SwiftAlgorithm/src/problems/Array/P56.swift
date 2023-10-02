//
//  P56.swift
//  Swift3
//
//  Created by choi hyunjin on 2022/02/20.
//

import Foundation

class P56 {
  func merge(_ intervals: [[Int]]) -> [[Int]] {
    let sorted = intervals.sorted(by: {
      $0[0] < $1[0]
    })
    var res = [sorted[0]]
    
    for i in 1..<sorted.count {
      let interval = sorted[i]
      let last = res[res.count-1]
      if last[1] >= interval[0]{
        res[res.count-1] = [last[0], max(interval[1], last[1])]
      } else {
        res.append(interval)
      }
    }
    
    return res
  }
}
