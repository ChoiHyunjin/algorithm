//
//  Rook.swift
//  SwiftAlgorithm
//
//  Created by Tophy on 6/1/24.
//

import Foundation

class Rook {
  func getMaximumRookPosition(_ arr: [[Int]]) -> Int {
    var res = 0
    
    var maximums = [(index: Int, value: Int)]()
    for i in 0..<arr.count {
      maximums.append(getMax(arr[i], except: 0))
    }
    
    for i in 0..<arr.count {
      for j in 0..<arr.count {
        var temp = arr[i][j]
        
        temp += maximums.enumerated().reduce(0) { prev, element in
          let (index, maximum) = element
          if index == i {
            return prev
          }
          var value = maximum.value
          if maximum.index == j {
            maximums[index] = getMax(arr[index], except: j)
            value = maximums[index].value
          }
          
          return max(prev, value)
        }
        
        res = max(temp, res)
      }
    }
    
    return res
  }
  
  private func getMax(_ arr: [Int], except: Int) -> (Int, Int) {
    arr.enumerated().reduce((0, 0)) { prev, element in
      let (index, value) = element
      if except == index {
        return prev
      }
      
      return prev.1 < value ? (index, value) : prev
    }
  }
}
