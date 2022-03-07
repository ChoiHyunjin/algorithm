//
//  P740.swift
//  Swift3
//
//  Created by choi hyunjin on 2022/03/05.
//

import Foundation

class P740{
  func deleteAndEarn(_ nums: [Int]) -> Int {
    var res = 0
    var dic : [Int: Int] = [:]
    for num in nums {
      dic[num] = (dic[num] ?? 0) + num
    }
    
    let keys = dic.keys.sorted()
    
    var i = 1
    var arr : [Int]? = nil
    for key in keys{
      // 연속된 수 찾아서 dp로 값 찾기
      if dic[key+1] != nil {
        if arr == nil {
          arr = [Int]()
        }
        arr!.append(dic[key]!)
      }else if arr != nil{
        arr!.append(dic[key]!)
        res += getMax(arr!)
        arr = nil
        i += 1
      }else {
        // 고립된 값은 바로 더하기
        res += dic[key]!
      }
      i += 1
    }
    
    return res
  }
  
  func getMax(_ nums: [Int]) -> Int {
    var res = 0
    
    var dp = [Int].init(repeating: 0, count: nums.count+2)
    
    var i = 1
    for num in nums{
      dp[i+1] = max(dp[i-1], (i-2 < 0 ? 0 :dp[i-2])) + num
      
      res = max(res, dp[i+1])
      i += 1
    }
    
    return res
  }
}
