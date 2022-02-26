//
//  P190.swift
//  Swift3
//
//  Created by choi hyunjin on 2022/02/26.
//

import Foundation

class P190 {
  func reverseBits(_ n: Int) -> Int {
    var temp = n
    var res = 0
    var i = 0
    while i < 32 {
      res = res << 1 + temp & 1
      temp = temp >> 1
      i += 1
    }
    
    return res
  }
}
