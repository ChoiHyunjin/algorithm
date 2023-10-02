//
//  P2017.swift
//  Swift3
//
//  Created by choi hyunjin on 2022/02/26.
//

import Foundation

class P2017{
  func gridGame(_ grid: [[Int]]) -> Int {
    var map = Array.init(repeating: Array.init(repeating: 0, count: grid[0].count+1), count: 3)
    
    for i in 0..<grid.count{
      for j in 0..<grid[0].count{
        map[i+1][j+1] = grid[i][j]
      }
    }
    
    doDp(grid: &map)
    
    var i = grid.count-1
    var j = grid[0].count-1
    while i >= 0 && j >= 0 {
      map[i+1][j+1] = 0
      if i == 0 {
        j -= 1
      } else if j == 0 {
        i -= 1
      }else if map[i][j+1] < map[i+1][j]{
        j -= 1
      }else if map[i][j+1] == map[i+1][j]{      // [[2,5,5][1,5,1]] 의 경우
        if j <= grid[0].count/2{
          i -= 1
        }else {
          j -= 1
        }
      }else {
        i -= 1
      }
    }
    
    for i in 0..<grid.count{
      for j in 0..<grid[0].count{
        if map[i+1][j+1] != 0{
          map[i+1][j+1] = grid[i][j]
        }
      }
    }
    
    doDp(grid: &map)
    return map[2][map[0].count-1]
  }
  
  func doDp(grid: inout [[Int]]){
    for i in 1..<grid.count{
      for j in 1..<grid[0].count{
        grid[i][j] += max(grid[i-1][j], grid[i][j-1])
      }
    }
  }
}
