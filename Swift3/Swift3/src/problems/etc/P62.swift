//
//  P62.swift
//  Swift3
//
//  Created by choi hyunjin on 2022/02/23.
//

import Foundation

class P62 {
  func uniquePaths(_ m: Int, _ n: Int) -> Int {
    let minimum = min(m, n) - 1
    let maximum = max(m, n) - 1
    
    var res = 1
    
    if minimum == 0 {
        return 1
    }
    for i in maximum+1...(minimum + maximum){
        res *= i
    }
    for i in 1...minimum{
        res /= i
    }
    
    return res
  }
  
  func getFactorior(num: Int) -> Int {
    return 0
  }
}
