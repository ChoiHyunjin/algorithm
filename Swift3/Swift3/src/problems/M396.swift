//
//  M396.swift
//  Swift3
//
//  Created by Tophy on 2023/04/01.
//

import Foundation

class M396 {
    func maxRotateFunction(_ nums: [Int]) -> Int {
        var max = 0
        let sum = nums.reduce(0, {
            return $0+$1
        })
        
        for (index, num) in nums.enumerated() {
            max += num * index
        }
        
        var prev = max
        for i in 0..<nums.count-1 {
            let index = nums.count - i
            let value = prev + sum - nums[index]
            max = value > max ? value : max
            prev = value
        }
        
        return max
    }
}
