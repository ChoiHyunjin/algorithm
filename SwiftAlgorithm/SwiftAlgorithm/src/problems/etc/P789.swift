//
//  P789.swift
//  Swift3
//
//  Created by choi hyunjin on 2022/02/13.
//

import Foundation

class P789{
  func escapeGhosts(_ ghosts: [[Int]], _ target: [Int]) -> Bool {
    let turn = abs(target[0]) + abs(target[1])
    
    var res = true
    for ghost in ghosts{
      res = turn < abs(target[0] - ghost[0]) + abs(target[1]-ghost[1])
      
      if !res{
        break
      }
    }
    
    return res
  }
}
