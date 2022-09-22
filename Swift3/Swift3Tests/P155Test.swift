//
//  P155Test.swift
//  Swift3Tests
//
//  Created by choi hyunjin on 2022/02/02.
//

import XCTest
@testable import Swift3

class P155Test: XCTestCase {
	let stack = MinStack()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
			stack.push(-2)
			stack.push(0)
			stack.push(-1)
			print(stack.getMin())
			stack.pop()
			print(stack.top())
			print(stack.getMin())
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
