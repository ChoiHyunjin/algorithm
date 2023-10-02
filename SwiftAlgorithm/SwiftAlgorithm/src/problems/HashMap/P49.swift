//
//  P49.swift
//  Swift3
//
//  Created by choi hyunjin on 2022/02/20.
//

import Foundation

class P49 {
  func groupAnagrams(_ strs: [String]) -> [[String]] {
    var dic : [[Int] : [String]] = [:]
    
    for str in strs{
      let key = toAsciiArray(str: str)
      var checkSum = [Int](repeating: 0, count: 26)
      for str in key{
        checkSum[str] += 1
      }
      
      if dic[checkSum] == nil {
        dic[checkSum] = [str]
      }else {
        dic[checkSum]!.append(str)
      }
    }
    
    return dic.values.map{
      $0
    }
  }
  
  func toAsciiArray (str: String) -> [Int] {
    let aAscii = Character("a").asciiValue!
    return Array(str).map{
      Int($0.asciiValue! - aAscii)
    }
  }
}
