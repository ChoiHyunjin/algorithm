//
//  P1502.swift
//  Swift3
//
//  Created by choi hyunjin on 2022/02/13.
//

import Foundation

class P1502{
  func canMakeArithmeticProgression(_ arr: [Int]) -> Bool {
    let list = arr.sorted()
    let sub = list[1] - list[0]
    var res = true
    var i = 2
    while res && i < list.count{
      res = sub == (list[i] - list[i-1])
      i += 1
    }
    return res
  }
}
