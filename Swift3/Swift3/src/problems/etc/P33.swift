//
//  P33.swift
//  Swift3
//
//  Created by choi hyunjin on 2022/01/30.
//

import Foundation

class P33 {
	func search(_ nums: [Int], _ target: Int) -> Int {
		if nums[0] == target{
			return 0
		 }else if nums[nums.count-1] == target {
			 return nums.count-1
		 }
	 
		let start = self.searchStart(nums, 0, nums.count-1)
		
		var res = searchValue(nums, start, nums.count-1, target)
		if res < 0 {
			res = searchValue(nums, 0, start, target)
		}
		
		return res
	}
	
	func searchStart(_ nums:[Int], _ start:Int, _ end:Int) -> Int {
		if start + 1 == end {
			return nums[start] > nums[end] ? end : start
		} else {
			let mid: Int = (start + end)/2
			var res = 0
			if nums[start] > nums[mid] {
				res = self.searchStart(nums, start, mid)
			} else if nums[mid] > nums[end] {
				res = self.searchStart(nums, mid, end)
			}
			return res
		}
	}
	
	func searchValue(_ nums:[Int], _ start: Int, _ end: Int, _ target: Int) -> Int{
		var res = -1
		
		let mid: Int = (start+end) / 2
		if nums[mid] == target {
			return mid
    }
		
    if start+1 >= mid {
      if nums[start] == target{
        res = start
      }else if nums[mid] == target{
        res = mid
      }
    }else {
      res = searchValue(nums, start, mid, target)
    }
    if res < 0 {
      if mid+1 >= end{
        if nums[end] == target{
         res = end
       }else if nums[mid] == target{
         res = mid
       }
      }else {
        res = searchValue(nums, mid, end, target)
      }
    }
		
		
		return res
	}
}
