//
//  P799.swift
//  Swift3
//
//  Created by choi hyunjin on 2022/03/05.
//

import Foundation
class P799{
  func champagneTower(_ poured: Int, _ query_row: Int, _ query_glass: Int) -> Double {
    guard poured > 0 else { return 0.0 }
    
    if query_glass == 0 || query_row == query_glass {
      guard query_row > 0 else { return min (1.0, Double(poured)) }
      var sum = 1
      for i in 0..<query_row{
        sum += (i) * 2
      }
      let left = poured - sum
      if left <= 0 {
        return 0.0
      } else { // 8, 3, 0 인 경우 왜 0.125가 답임? 0.1666 아님?
        return left > query_row*2 ? 1.0 : (Double(left) / Double(query_row*2))
      }
    }
    
    var arr = [[Double]].init(repeating: [], count: query_row + 1)
    for i in 0..<arr.count{
      arr[i] = [Double].init(repeating: 0.0, count: i+1)
    }
    
    pour(&arr, Double(poured), 0, 0, query_row, query_glass)
    return min(1.0, arr[query_row][query_glass])
  }
  
  func pour(_ arr: inout [[Double]], _ poured: Double, _ query_row: Int, _ query_glass: Int, _ goal_row: Int, _ goal_glass: Int){
    guard query_row < arr.count && poured > 0 && arr[goal_row][goal_glass] < 1 else { return }
    
    arr[query_row][query_glass] += poured
    if arr[query_row][query_glass] > 1.0 {
      let amount = (arr[query_row][query_glass] - 1) / 2
      arr[query_row][query_glass] = 1.0
      pour(&arr, amount, query_row+1, query_glass, goal_row, goal_glass)
      pour(&arr, amount, query_row+1, query_glass+1, goal_row, goal_glass)
    } else {
      return
    }
  }
}
