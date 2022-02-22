//
//  P763Test.swift
//  Swift3Tests
//
//  Created by choi hyunjin on 2022/02/01.
//

import XCTest
@testable import Swift3

class P763Test: XCTestCase {
	let obj = P763()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

	func testExample() throws {
	 let res = obj.partitionLabels("abcjbcdedgfde")
	 XCTAssertEqual(res, [1,5,7])
 }
	func test1() throws {
	 let res = obj.partitionLabels("ababcbacadefegdehijhklij")
	 XCTAssertEqual(res, [9,7,8])
 }
	func test2() throws {
	 let res = obj.partitionLabels("eccbbbbdec")
	 XCTAssertEqual(res, [10])
 }
	func test3() throws {
		let res = obj.partitionLabels("c")
	 XCTAssertEqual(res, [1])
 }
//	func test4() throws {
//	 let res = obj.partitionLabels("c")
//	 XCTAssertEqual(res, [0])
// }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
