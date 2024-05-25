//
//  P131.swift
//  SwiftAlgorithm
//
//  Created by Tophy on 5/22/24.
//

import Foundation

fileprivate class Solution {
  var visited = [String: [[String]]]()
  
  func check(_ s: String) -> Bool {
    var res = true
    var head = 0
    var tail = s.count-1
    
    while head < tail {
      if s[head] != s[tail] {
        return false
      }
      head += 1
      tail -= 1
    }
    
    return res
  }
  
  func partition(_ s: String) -> [[String]] {
    var result = [[String]]()
    
    if s.count == 0 {
      return result
    } else if s.count == 1 {
      return [[s]]
    }
    
    if let visit = visited[s] {
      return visit
    }
    
    var set = Set<String>()
    
    if check(s) {
      set.insert(s)
    }
    
    for i in 1..<s.count {
      let substrings = s.slice(at: i)
      print("substrings",substrings)
      if substrings.reduce(true, { partialResult, sub in
        partialResult && check(sub)
      }) {
        set.insert(substrings.joined(separator: ","))
      }
      let firParts = partition(substrings[0])
      let secParts = partition(substrings[1])
      
      firParts.forEach{ firsts in
        secParts.forEach{ seconds in
          set.insert((firsts + seconds).joined(separator: ","))
        }
      }
    }
    
    result = Array(set).map{s in
      s.split(separator: ",").map(String.init)
    }
    
    visited[s] = result
    return result
  }
}

fileprivate extension String {
  var strArr: Array<Character> {
    Array(self)
  }
  
  func slice(at: Int) -> [String] {
    var result = [String]()
    
    var temp = ""
    for i in 0..<self.count {
      if i == at {
        result.append(temp)
        temp = ""
      }
      temp += "\(strArr[i])"
    }
    result.append(temp)
    if result.count == 1 {
      result.append("")
    }
    
    return result
  }
  
  subscript(_ i: Int) -> Character {
    strArr[i]
  }
}
