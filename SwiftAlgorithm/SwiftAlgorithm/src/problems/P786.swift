//
//  P786.swift
//  SwiftAlgorithm
//
//  Created by Tophy on 5/12/24.
//

import Foundation


class P786 {
  func kthSmallestPrimeFraction(_ arr: [Int], _ k: Int) -> [Int] {
    var visited = [String: Double]()
    var pointers = Array(repeating: 0, count: arr.count)
    
    func isSmaller(_ num1: Int, _ den1: Int,_ num2: Int,_ den2: Int) -> Bool {
      let number1 = visited["\(num1),\(den1)"] ?? Double(num1)/Double(den1),
          number2 = visited["\(num2),\(den2)"] ?? Double(num2)/Double(den2)
      visited["\(num1),\(den1)"] = number1
      visited["\(num2),\(den2)"] = number2
      return number1 < number2
//      return num1 * den2 < num2 * den1
    }
    
    var res = 0
    for i in 0..<k {
      var candidate = 0
      
      for j in 1..<arr.count{
        let pointer = pointers[j]
        if isSmaller(arr[pointer], arr[j], arr[pointers[candidate]], arr[candidate]) {
          candidate = j
        }
      }
      
      res = candidate
      if i < k-1 {
        pointers[candidate] += 1
      }
    }
    
    return [arr[pointers[res]], arr[res]]
  }
  
  func kthSmallestPrimeFractionBruteforce(_ arr: [Int], _ k: Int) -> [Int] {
    var result = [[Int]]()
    for i in 0..<arr.count {
      let val1 = arr[i]
      for j in 0..<i {
        let val2 = arr[j]
        result.append([val2, val1])
      }
    }
    
    result.sort { arr1, arr2 in
      let val1: Float = Float(arr1[0]) / Float(arr1[1])
      let val2: Float = Float(arr2[0]) / Float(arr2[1])
      return val1 < val2
    }
    
    return result[k-1]
  }
}
