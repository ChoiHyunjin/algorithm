//
//  ListNode.swift
//  Swift3
//
//  Created by choi hyunjin on 2022/02/02.
//

import Foundation

public class ListNode{
	var val : Int
	var next: ListNode?
	
	init(_ val: Int) {
		self.val = val;
		self.next = nil;
	}
	init(_ val: Int, _ next: ListNode?) {
		self.val = val;
		self.next = next;
	}
}
