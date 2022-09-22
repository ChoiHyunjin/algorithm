//
//  P2017Test.swift
//  Swift3Tests
//
//  Created by choi hyunjin on 2022/02/26.
//

import XCTest
@testable import Swift3

class P2017Test: XCTestCase {
  let obj = P2017()
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
  
  func testExample() throws {
    let res = obj.gridGame([[2,5,4],[1,5,1]])
    XCTAssertEqual(res, 4)
  }
  func test1() throws {
    let res = obj.gridGame([[20,3,20,17,2,12,15,17,4,15],[20,10,13,14,15,5,2,3,14,3]])
    XCTAssertEqual(res, 63)
  }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
