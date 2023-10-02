//
//  P13.swift
//  Swift3
//
//  Created by choi hyunjin on 2022/02/01.
//

import Foundation


class P13{
	func romanToInt(_ s: String) -> Int {
		let chars = Array(s)
		
		var res = 0
		for i in 0..<chars.count{
			let char = chars[i]
			switch char {
			case "I":
				if i < chars.count-1 {
					let next = chars[i+1]
					if next == "V" || next == "X"{
						res -= 1
					}else {
						res += 1
					}
				}else {
					res += 1
				}
				break
			case "V":
				res += 5
				break
			case "X":
				if i < chars.count-1 {
					let next = chars[i+1]
					if next == "L" || next == "C"{
						res -= 10
					}else {
						res += 10
					}
				}else {
					res += 10
				}
				break
			case "L":
				res += 50
				break
			case "C":
				if i < chars.count-1 {
					let next = chars[i+1]
					if next == "D" || next == "M"{
						res -= 100
					}else {
						res += 100
					}
				}else {
					res += 100
				}
				break
			case "D":
				res += 500
				break
			case "M":
				res += 1000
				break
			default:
				break
			}
		}
		
		return res
	}
}
