//
//  P75.swift
//  Swift3
//
//  Created by choi hyunjin on 2022/02/02.
//

import Foundation

class P75 {
	func sortColors(_ nums: inout [Int]) {
		var left = 0
		var right = nums.count-1
		var res = Array.init(repeating: 1, count: nums.count)
		
		for num in nums {
			if num == 0 {
				res[left] = 0
				left += 1
			}else if num == 2{
				res[right] = 2
				right -= 1
			}
		}
		nums = res
	}
	
	// 4ms
	func sortColors1(_ nums: inout [Int]) {
		self.sortBlue(&nums)
		self.sortRed(&nums)
	}
	
	func sortBlue(_ nums: inout [Int]) { // 2
		var left = 0
		var right = nums.count-1
		
		while left < right {
			while left < nums.count && nums[left] != 2 {
				left += 1
			}
			while right > -1 && nums[right] == 2 {
				right -= 1
			}
			if left >= right{
				break
			}
			let temp = nums[left]
			nums[left] = nums[right]
			nums[right] = temp
		}
	}
	
	func sortRed(_ nums: inout [Int]) { // 0
		var left = 0
		var right = nums.count-1
		
		while left < right {
			while left < nums.count && nums[left] == 0 {
				left += 1
			}
			while right > -1 && nums[right] != 0 {
				right -= 1
			}
			if left >= right{
				break
			}
			let temp = nums[left]
			nums[left] = nums[right]
			nums[right] = temp
		}
	}
}
