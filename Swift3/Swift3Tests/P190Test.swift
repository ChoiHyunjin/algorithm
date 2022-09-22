//
//  P190.swift
//  Swift3Tests
//
//  Created by choi hyunjin on 2022/02/26.
//

import XCTest
@testable import Swift3

class P190Test: XCTestCase {
  let obj = P190()
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
      let res = obj.reverseBits(43261596)
      XCTAssertEqual(res, 964176192)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
