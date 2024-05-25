//
//  P2373.swift
//  SwiftAlgorithm
//
//  Created by Tophy on 5/12/24.
//

import Foundation

class P2373 {
  func largestLocal(_ grid: [[Int]]) -> [[Int]] {
    func getMax(_ x: Int, _ y:Int) -> Int {
      var res = 0
      
      for i in x...x+2 {
        for j in y...y+2{
          res = max(res, grid[j][i])
        }
      }
      
      return res
    }
    
    var res: [[Int]] = []
    for i in 0..<grid.count-2 {
      res.append([])
      for j in 0..<grid[0].count-2 {
        res[i].append(getMax(j, i))
      }
    }
    return res
  }
}
