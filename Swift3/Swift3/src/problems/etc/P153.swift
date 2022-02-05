//
//  P153.swift
//  Swift3
//
//  Created by choi hyunjin on 2022/01/30.
//

import Foundation

class P153{
	func findMin(_ nums: [Int]) -> Int{
		let res = find(nums, 0, nums.count-1)
		
		return nums[res]
	}
	
	func find(_ nums: [Int], _ start:Int, _ end: Int) -> Int{
		var res = 0;
		
		if start+1 == end{
			res = nums[start] < nums[end] ? start : end
		}else{
			let mid = (start + end) / 2
			if nums[start] > nums[mid]{
			 res = self.find(nums, start, mid)
		 }else if nums[mid] > nums[end]{
			 res = self.find(nums, mid, end)
		 }
		}
		
		return res
	}
}
