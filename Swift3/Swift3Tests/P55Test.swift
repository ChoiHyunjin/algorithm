//
//  P55Test.swift
//  Swift3Tests
//
//  Created by choi hyunjin on 2022/02/19.
//

import XCTest
@testable import Swift3

class P55Test: XCTestCase {
  let obj = P55()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
      let res = self.obj.canJump([0])
      XCTAssertEqual(res, true)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
