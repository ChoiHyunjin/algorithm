//
//  P198.swift
//  Swift3
//
//  Created by choi hyunjin on 2022/01/16.
//

import Foundation
class P198 {
    func rob(_ nums: [Int]) -> Int {
        var list = Array.init(repeating: 0, count: nums.count)
        list[0] = nums[0]
        if nums.count == 1 {
            return nums[0]
        }
        list[1] = nums[1]
        if nums.count > 2 {
            list[2] = nums[2] + nums[0]
            
            for i in 3..<nums.count {
                list[i] = nums[i] + (list[i-2] > list[i-3] ? list[i-2] : list[i-3])
            }
        }
        
        return list[nums.count-1] > list[nums.count-2] ? list[nums.count-1]  : list[nums.count-2]
    }
}
