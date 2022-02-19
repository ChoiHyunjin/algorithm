//
//  P200.swift
//  Swift3
//
//  Created by choi hyunjin on 2022/02/19.
//

import Foundation

class P200 {
  func numIslands(_ grid: [[Character]]) -> Int {
    var res = 0
    var map = Array(grid)
    
    for i in 0..<map.count{
      for j in 0..<map[0].count{
        if map[i][j] == "1"{
          map[i][j] = "2"
          res += 1
          self.markLand(&map, i, j)
        }
      }
    }
    
    return res
  }
  
  func markLand(_ map: inout [[Character]], _ i: Int, _ j: Int){
    if i < map.count-1 && map[i+1][j] == "1"{
      map[i+1][j] = "2"
      self.markLand(&map, i+1, j)
    }
    if j < map[0].count-1 && map[i][j+1] == "1"{
      map[i][j+1] = "2"
      self.markLand(&map, i, j+1)
    }
    if i > 0 && map[i-1][j] == "1"{
      map[i-1][j] = "2"
      self.markLand(&map, i-1, j)
    }
    if j > 0 && map[i][j-1] == "1"{
      map[i][j-1] = "2"
      self.markLand(&map, i, j-1)
    }
    return
  }
}
