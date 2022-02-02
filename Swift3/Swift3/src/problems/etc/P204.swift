//
//  P224.swift
//  Swift3
//
//  Created by choi hyunjin on 2022/01/22.
//

import Foundation

class P204 {
	func countPrimes(_ n: Int) -> Int {
		if n < 2 {
			return 0
		}
		var arr = [Bool](repeating: true, count: n)
		arr[0] = false
		arr[1] = false
		for i in 2..<Int(ceil(sqrt(Double(n)))){
			if arr[i] {
				for j in stride(from: i*i, to: n, by: i){
					arr[j] = false
				}
			}
		}
		return arr.reduce(0, {
			return $0 + ($1 ? 1 : 0)
		})
	}
	
	func countPrimes2(_ n: Int) -> Int {
		guard n > 1 else {
			return 0
		}
		var arr = Array.init(repeating: true, count: n)
		
		func off(_ prime: Int){
			var i = prime
			while i < arr.count{
				arr[i] = false
				i += prime
			}
		}
		
		func nextIndex(_ prime: Int) -> Int{
			var i = prime+(prime == 2 ? 1 : 2)
			while i < n {
				if arr[i] {
					return i
				}
				i += prime == 2 ? 1 : 2
			}
			return -1
		}
		
		var prime = 2
		var res = 0
		while prime > 1 && prime < n {
			res += 1
			off(prime)
			prime = nextIndex(prime)
		}
		
		return res
	}
}
