//
//  P930Test.swift
//  Swift3Tests
//
//  Created by choi hyunjin on 2022/02/02.
//

import XCTest
@testable import Swift3

class P930Test: XCTestCase {
	let obj = P930()
	
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
	
	func testExample() throws {
	 let res = obj.numSubarraysWithSum([0,1,1,1,1], 3)
	 
	 XCTAssertEqual(res, 3)
 }
	
	func test1() throws {
	 let res = obj.numSubarraysWithSum([1,0,1,0,1], 2)
	 
	 XCTAssertEqual(res, 4)
 }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
