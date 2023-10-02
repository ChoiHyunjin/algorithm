//
//  P155.swift
//  Swift3
//
//  Created by choi hyunjin on 2022/02/02.
//

import Foundation

class MinStack {
	private var stack: [Int]
	private var sortedList : [Int]
	
	init() {
		stack = []
		sortedList = []
	}

	func push(_ val: Int) {
		self.stack.append(val)
		self.insert(val)
	}
	
	private func insert(_ val:Int){
		for i in 0..<self.sortedList.count{
			if self.sortedList[i] >= val{
				self.sortedList.insert(val, at: i)
				break
			}
		}
		if self.stack.count > self.sortedList.count{
			self.sortedList.append(val)
		}
	}

	func pop() {
		let val = self.stack.removeLast()
		let idx = self.findIndex(val, left: 0, right: self.sortedList.count-1)
		if idx > -1 {
			self.sortedList.remove(at: idx)
		}
	}
	
	private func findIndex(_ val: Int, left: Int, right: Int) -> Int{
		var res = -1
		if left+1 == right{
			if self.sortedList[left] == val{
				res =  left
			}else if self.sortedList[right] == val{
				res =  right
			}
			return res
		}
		let mid: Int = (left + right) / 2
		if self.sortedList[mid] == val{
			res =  mid
		}else if self.sortedList[mid] > val {
			res =  self.findIndex(val, left: left, right: mid-1)
		}else {
			res =  self.findIndex(val, left: mid+1, right: right)
		}
		return res
	}

	func top() -> Int {
		return self.stack.last ?? 0
	}

	func getMin() -> Int {
		return self.sortedList[0]
	}
}
