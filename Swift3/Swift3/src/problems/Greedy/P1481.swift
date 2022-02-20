//
//  P1481.swift
//  Swift3
//
//  Created by choi hyunjin on 2022/02/19.
//

import Foundation

class P1481{
  func findLeastNumOfUniqueInts(_ arr: [Int], _ k: Int) -> Int {
    if k == arr.count{
      return 0
    }
    var dic: [Int:Int] = [:]
    
    for num in arr{
      dic[num] = (dic[num] ?? 0) + 1
    }
    
    var values = dic.values.sorted()
    var i = 0
    var removable = k
    while removable > 0 {
      if removable > values[i]{
        removable -= values[i]
        values[i] = 0
      } else {
        values[i] -= removable
        removable = 0
      }
      i += 1
    }
    
    return values.reduce(0, {
      $0 + ($1 > 0 ? 1 : 0)
    })
  }
}
