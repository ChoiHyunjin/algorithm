//
//  P1404.swift
//  SwiftAlgorithm
//
//  Created by Tophy on 6/1/24.
//

import Foundation

fileprivate class Solution {
  func numSteps(_ s: String) -> Int {
    var res = 0
    
    var temp = 0
    let cArr = Array(s).reversed()
    cArr.enumerated().forEach { (i, c) in
      if i == cArr.count && temp == 0 {
        return
      }
      
      res += 1
      if c == "1" {
        if temp == 0 {
          res += 1
          temp = 1
        }
      } else {
        if temp == 1 {
          res += 1
        }
      }
    }
    
    return res
  }
}
