//
//  P1146.swift
//  Swift3
//
//  Created by choi hyunjin on 2022/02/01.
//

import Foundation

class P763{
	func partitionLabels(_ s: String) -> [Int] {
		var dic : [Character : Int] = [:]
		
		var res : [Int] = []
		
		for (idx, char) in s.enumerated(){
			dic[char] = idx
		}
		
		var end = 0
		var start = 0
		for (idx, char) in s.enumerated(){
			end = max(end, dic[char]!)
			if end == idx{
				res.append(end - start + 1)
				start = idx + 1
			}
		}
		
		return res
	}
	
	func partitionLabels2(_ s: String) -> [Int] {
		let aAscii = Int(Character("a").asciiValue!)
		let chars = Array(s).map{
			Int($0.asciiValue!) - aAscii
		}
		var ends = Array.init(repeating: -1, count: 26)	 // [end]
		
		var res : [Int] = []
		
		var i = 0
		while i < s.count {
			let num = chars[i]
			ends[num] = i
			
			i += 1
		}
		
		i = 0
		var end = 0
		var start = 0
		while i < s.count {
			let num = chars[i]
			end = max(end, ends[num])
			if end == i {
				res.append(end - start + 1)
				start = i+1
			}
			i += 1
		}
		
		return res
	}
}
