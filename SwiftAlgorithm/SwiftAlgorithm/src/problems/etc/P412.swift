//
//  P412.swift
//  Swift3
//
//  Created by choi hyunjin on 2022/02/13.
//

import Foundation

class Solution {
  func fizzBuzz(_ n: Int) -> [String] {
    var res = Array.init(repeating: "", count: n)
    
    let f = "Fizz"
    let b = "Buzz"
    for i in 0..<res.count{
      if (i+1) % 3 == 0 {
        res[i] += f
      }
      if (i+1) % 5 == 0 {
        res[i] += b
      }
      if res[i].count == 0 {
        res[i] = String(i+1)
      }
    }
    return res
  }
}
