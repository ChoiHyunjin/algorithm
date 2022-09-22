//
//  P395Test.swift
//  Swift3Tests
//
//  Created by choi hyunjin on 2022/02/01.
//

import XCTest
@testable import Swift3

class P395Test: XCTestCase {
	let obj = P395()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
	
	func testExample() throws {
	 let res = obj.longestSubstring("aaabb", 3)
	 XCTAssertEqual(res, 3)
 }
	
	func test1() throws {
	 let res = obj.longestSubstring("ababb", 2)
	 XCTAssertEqual(res, 5)
 }
	
	func test2() throws {
	 let res = obj.longestSubstring("aaabbcbcc", 3)
	 XCTAssertEqual(res, 9)
 }
	
	func test3() throws {
	 let res = obj.longestSubstring("daaabbcbcc", 3)
	 XCTAssertEqual(res, 9)
 }
	
	func test4() throws {
	 let res = obj.longestSubstring("daaabbcbc", 3)
	 XCTAssertEqual(res, 3)
 }
	
	func test5() throws {
	 let res = obj.longestSubstring("weitong", 2)
	 XCTAssertEqual(res, 0)
 }
	
	func test6() throws {
	 let res = obj.longestSubstring("daaabbddcbc", 3)
	 XCTAssertEqual(res, 3)
 }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
