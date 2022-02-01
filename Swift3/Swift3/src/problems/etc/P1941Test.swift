//
//  P1941Test.swift
//  Swift3Tests
//
//  Created by choi hyunjin on 2022/02/01.
//

import XCTest
@testable import Swift3

class P1941Test: XCTestCase {
	let obj = P1941()
	
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
	
	func testExample() throws {
	 let res = obj.areOccurrencesEqual("abcabc")
	 XCTAssertEqual(res, true)
 }
	
	func test1() throws {
	 let res = obj.areOccurrencesEqual("aaabb")
	 XCTAssertEqual(res, false)
 }
	
	func test2() throws {
	 let res = obj.areOccurrencesEqual("azbcdef")
	 XCTAssertEqual(res, true)
 }
	
	func test3() throws {
	 let res = obj.areOccurrencesEqual("aaaaaaaa")
	 XCTAssertEqual(res, true)
 }
	
	func test4() throws {
	 let res = obj.areOccurrencesEqual("vvvvvvvv")
	 XCTAssertEqual(res, true)
 }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
