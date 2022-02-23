//
//  P121.swift
//  Swift3
//
//  Created by choi hyunjin on 2022/02/23.
//

import Foundation

class P121{
  func maxProfit(_ prices: [Int]) -> Int {
    var min = prices[0]
    var res = 0
    for price in prices {
      if price < min {
        min = price
      }else {
        res = max(res, price-min)
      }
    }
    
    return res
  }
}
