//
//  P91.swift
//  Swift3
//
//  Created by choi hyunjin on 2022/01/30.
//

import Foundation

class P91 {
	func numDecodings(_ s: String) -> Int {
		if s[s.startIndex] == "0" {
			return 0
		}else if s.count == 1{
			return 1
		}
		
		let subString = s.split(separator: "0", omittingEmptySubsequences: false)
		var arr	= subString.map{
			Array($0).map{
				Int($0.asciiValue!) - 48
			}
		}
		
		if arr[arr.count-1].count == 0 {
			arr.remove(at: arr.count-1)
		}
		
		if subString.count > 1 {
			for i in 0..<subString.count-1 {
				
			}
		}
		for i in 0..<arr.count{
			if i < arr.count-1{
				if arr[i].count == 0 || arr[i][arr[i].count-1] > 2{
					 return 0
				 }
				arr[i].remove(at: arr[i].count-1)
			}else {
				if s[s.index(s.startIndex, offsetBy: s.count-1)] == "0" {
					if arr[i][arr[i].count-1] > 2{
						return 0
					}
					arr[i].remove(at: arr[i].count-1)
				}
			}
		}
		
		return arr.reduce(1) { partialResult, numbers in
			return partialResult * (numbers.count > 1 ? self.getDecoding(numbers) : 1)
		}
	}
	
	func getDecoding(_ arr:[Int]) -> Int {
		var dp = Array.init(repeating: 0, count: arr.count+1)
		dp[1] = 1
		var res = 1
		for i in 2..<dp.count{
			let j = i-1
			let num = arr[j]
			let number = num + arr[j-1]*10
			 if number <= 26 {
				 dp[i] = dp[i-1] + dp[i-2]
				 res = dp[i-1] + dp[i]
			 }else{
				 dp[i] = dp[i-1]
			 }
		}
		return res
	}
}
