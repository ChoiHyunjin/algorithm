//
//  P1290.swift
//  Swift3
//
//  Created by choi hyunjin on 2022/02/02.
//

import Foundation

class P1290{
	func getDecimalValue(_ head: ListNode?) -> Int {
		var res = 0
		var ptr = head
		while ptr != nil {
			res += ptr!.val
			res = res << 1
			ptr = ptr!.next
		}
		return res
	}
}
