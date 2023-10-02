//
//  P1941.swift
//  Swift3
//
//  Created by choi hyunjin on 2022/02/01.
//

import Foundation

class P1941{
	func areOccurrencesEqual(_ s: String) -> Bool {
		let aAscii = Int(Character("a").asciiValue!)
		let chars = Array(s).map{
			Int($0.asciiValue!) - aAscii
		}
		var flags = Array.init(repeating: 0, count: 26)
		
		var count = 0
		
		for char in chars {
			flags[char] += 1
			count = count > flags[char] ? count : flags[char]
		}
		return flags.reduce(true) { partialResult, number in
			partialResult && ((number == count) || number == 0 )
		}
	}
}
