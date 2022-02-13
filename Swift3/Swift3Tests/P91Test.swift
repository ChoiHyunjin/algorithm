//
//  P91Test.swift
//  Swift3Tests
//
//  Created by choi hyunjin on 2022/01/30.
//

import XCTest
@testable import Swift3

class P91Test: XCTestCase {
	var obj = P91()
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
	
	func testExample() throws {
		let res = self.obj.numDecodings("111261")
		XCTAssertEqual(res, 8)
	}
	func test1() throws {
		let res = self.obj.numDecodings("12")
		XCTAssertEqual(res, 2)
	}
	func test2() throws {
		let res = self.obj.numDecodings("226")
		XCTAssertEqual(res, 3)
	}
	func test3() throws {
		let res = self.obj.numDecodings("06")
		XCTAssertEqual(res, 0)
	}
	func test4() throws {
		let res = self.obj.numDecodings("60")
		XCTAssertEqual(res, 0)
	}
	func test5() throws {
		let res = self.obj.numDecodings("10")
		XCTAssertEqual(res, 1)
	}
	func test6() throws {
		let res = self.obj.numDecodings("27")
		XCTAssertEqual(res, 1)
	}
	func test7() throws {
		let res = self.obj.numDecodings("2101")
		XCTAssertEqual(res, 1)
	}
	func test8() throws {
		let res = self.obj.numDecodings("21101")
		XCTAssertEqual(res, 2)
	}
	func test9() throws {
		let res = self.obj.numDecodings("211013")
		XCTAssertEqual(res, 4)
	}
	func test10() throws {
		let res = self.obj.numDecodings("606")
		XCTAssertEqual(res, 0)
	}
	func test11() throws {
		let res = self.obj.numDecodings("1001")
		XCTAssertEqual(res, 0)
	}
	func test12() throws {
		let res = self.obj.numDecodings("123123")
		XCTAssertEqual(res, 9)
	}

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
