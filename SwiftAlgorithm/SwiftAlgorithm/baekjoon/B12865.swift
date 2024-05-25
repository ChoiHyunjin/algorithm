//
//  B12865.swift
//  SwiftAlgorithm
//
//  Created by Tophy on 5/12/24.
//

import Foundation

class B12865{
  func solve() {
    let firstLine = readLine()!.split(separator: " ")
    guard let count = Int(firstLine[0]), let limit = Int(firstLine[1]) else {
      return
    }
    
    var items = [[Int]]()
    for i in 1...count {
      items.append(readLine()!.split(separator: " ").map({Int($0) ?? 0}))
    }
    
    var dp = Array(repeating: Array(repeating: 0, count: limit+1), count: count+1)
    
    for i in 1...items.count {
      let item = items[i-1]
      let weight = item[0]
      let value = item[1]
      for bagLimit in 1...limit {
        dp[i][bagLimit] = max(
          dp[i-1][bagLimit],
          weight > bagLimit ? 0 : dp[i-1][bagLimit-weight] + value
        )
      }
    }
    
    print(dp.last?.last ?? "")
  }
}
