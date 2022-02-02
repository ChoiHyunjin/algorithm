//
//  P930.swift
//  Swift3
//
//  Created by choi hyunjin on 2022/02/02.
//

import Foundation

class P930{
	func numSubarraysWithSum(_ nums: [Int], _ goal: Int) -> Int {
		if goal == 0 {
			return self.onZero(nums)
		}
		
		var oneIndexes : [Int] = []
		
		for i in 0..<nums.count{
			if nums[i] > 0 {
				oneIndexes.append(i)
			}
		}
		
		var res = 0
		var left = 0
		while left + goal - 1 < oneIndexes.count {
			res += getSum(nums, oneIndexes, left, left + goal - 1)
			left += 1
		}
		return res
	}
	
	func getSum(_ nums:[Int], _ oneIndexes:[Int], _ left: Int, _ right: Int) -> Int{
		let leftCount = oneIndexes[left] - (left > 0 ? oneIndexes[left-1] + 1 : 0)
		let rightCount = (right+1 < oneIndexes.count ? oneIndexes[right+1]-1 : nums.count-1) - oneIndexes[right]
		return (leftCount + 1) * (rightCount + 1)
	}
	
	func onZero(_ nums: [Int])-> Int {
		var res = 0
		
		var count = 0
		for i in 0..<nums.count{
			if nums[i] == 0{
				count += 1
			} else {
				res += count * (count + 1) / 2
				count = 0
			}
		}
		res += count * (count + 1) / 2
		return res
	}
}
