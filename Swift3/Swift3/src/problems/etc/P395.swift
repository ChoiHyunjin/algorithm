//
//  P204.swift
//  Swift3
//
//  Created by choi hyunjin on 2022/02/01.
//

import Foundation

class P395 {
	var numbers: [Int]?
	
	func longestSubstring(_ s: String, _ k: Int) -> Int {
		self.numbers = Array(s).map{
			Int($0.asciiValue!) - 97
		}
		return longestSubstring(k, 0, s.count)
	}
	
	func longestSubstring(_ k: Int, _ start: Int, _ end: Int) -> Int {
		if start >= end || end - start + 1 < k {
			return -1
		}
		let res = self.isValid(k, start, end)
		if res.reduce(true, {prev, num in
			prev && (num >= k || num == 0)
		}) {
			return end - start
		}
		
		var left = 0
		var result = 0
		for i in start..<end{
			if res[self.numbers![i]] < k {
				result = max(self.longestSubstring(k, left, i), result)
				left = i
			}
		}
		result = max(self.longestSubstring(k, left, end), result)
		return result
	}
	
	func isValid(_ k: Int, _ start: Int, _ end: Int) -> [Int] {
		var counter = Array.init(repeating: 0, count: 26)
		for i in start..<end {
			let char = self.numbers![i]
			counter[char] += 1
		}
		
		return counter
	}
	
}
