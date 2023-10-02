//
//  P213.swift
//  Swift3
//
//  Created by choi hyunjin on 2022/01/16.
//

import Foundation

class P213{
    func rob(_ nums: [Int]) -> Int {
        if nums.count == 1 {
            return nums[0]
        }else if nums.count == 2 {
            return max(nums[0], nums[1])
        }else if nums.count == 3 {
            return max(max(nums[0] , nums[1]), nums[2])
        }else{
            var arr1: [Int] = []
            arr1.append(contentsOf: nums[1..<nums.count])
            var arr2: [Int] = []
            arr2.append(contentsOf: nums[0..<nums.count-1])
            return max(self.rob2(arr1), self.rob2(arr2))
        }
    }
    
    func rob2(_ nums: Array<Int>) -> Int {
        if nums.count == 1 {
            return nums[0]
        }else if nums.count == 2 {
            return nums[0] > nums[1] ? nums[0] : nums[1]
        }else if nums.count == 3 {
            let last = nums[0] + nums[2]
            return last > nums[1] ? last : nums[1]
        }else{
            var arr = Array.init(repeating: 0, count: nums.count)
            arr[0] = nums[0]
            arr[1] = nums[1]
            arr[2] = nums[0] + nums[2]
            for i in 3..<nums.count {
                arr[i] = nums[i] + max(arr[i-2] , arr[i-3])
            }
            return max(arr[arr.count-1] , arr[arr.count-2])
        }
    }
}
