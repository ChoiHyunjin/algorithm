//
//  P69.swift
//  Swift3
//
//  Created by choi hyunjin on 2022/01/30.
//

import Foundation

class P69 {
		func mySqrt(_ x: Int) -> Int {
			var res = 0
			var exactly = true
			
			while res * res < x {
				res += 1
				exactly = res * res == x
			}
			
			return res - (exactly ? 0 : 1)
		}
}
