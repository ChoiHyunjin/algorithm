//
//  P56.swift
//  Swift3Tests
//
//  Created by choi hyunjin on 2022/02/20.
//

import XCTest
@testable import Swift3

class P56Test: XCTestCase {
  let obj = P56()
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
      let res = self.obj.merge([[1,3],[2,6],[8,10],[15,18]])
      XCTAssertEqual(res, [[1,6],[8,10],[15,18]])
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
