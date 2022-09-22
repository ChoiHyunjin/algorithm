//
//  P57.swift
//  Swift3
//
//  Created by choi hyunjin on 2022/02/20.
//

import Foundation

class P57 {
  func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
    guard intervals.count > 0 else {
      return [newInterval]
    }
    
    var res: [[Int]] = []
    var i = 0
    var isInserted = false
    while i < intervals.count {
      let interval = intervals[i]
      var new = newInterval
      // 비교 대상 찾기
      if isOverlap(interval1: interval, interval2: new){
        new = self.getMerged(interval1: interval, interval2: new)
        i += 1
        isInserted = true
      } else if interval[0] < newInterval[0] || isInserted {
        new = interval
        i += 1
      } else {
        isInserted = true
      }
      
      if let last = res.last {
        if isOverlap(interval1: last, interval2: new){
          res[res.count-1] = self.getMerged(interval1: last, interval2: new)
        }else {
          res.append(new)
        }
      } else {
        res.append(new)
      }
    }
    
    if !isInserted {
      res.append(newInterval)
    }
    
    return res
  }
  
  func isOverlap(interval1: [Int], interval2: [Int]) -> Bool{
    return interval1[1] >= interval2[0] && interval1[0] <= interval2[0]
            || interval2[1] >= interval1[0] && interval2[0] <= interval1[0]
  }
  
  func getMerged(interval1: [Int], interval2: [Int]) -> [Int]{
    return [min(interval1[0], interval2[0]), max(interval1[1], interval2[1])]
  }
}
