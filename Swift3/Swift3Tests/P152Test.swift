//
//  P152Test.swift
//  Swift3Tests
//
//  Created by choi hyunjin on 2022/02/19.
//

import XCTest
@testable import Swift3

class P152Test: XCTestCase {
  let obj = P152()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
  
  func testExample() throws {
    let res = self.obj.maxProduct([-2,0,-1])
    XCTAssertEqual(res, 0)
  }
  
  func test1() throws {
    let res = self.obj.maxProduct([2,3,-2,4])
    XCTAssertEqual(res, 6)
  }
  
  func test2() throws {
    let res = self.obj.maxProduct([2,3,-2,4,-4,3,2,-3,2,3])
    XCTAssertEqual(res, 1728)
  }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
