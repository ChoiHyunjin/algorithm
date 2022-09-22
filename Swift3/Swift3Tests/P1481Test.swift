//
//  P1481Test.swift
//  Swift3Tests
//
//  Created by choi hyunjin on 2022/02/19.
//

import XCTest
@testable import Swift3

class P1481Test: XCTestCase {
  let obj = P1481()
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
  
  func testExample() throws {
    let res = self.obj.findLeastNumOfUniqueInts([5,5,4], 1)
    XCTAssertEqual(res, 1)
  }
  
  func test1() throws {
    let res = self.obj.findLeastNumOfUniqueInts([4,3,1,1,3,3,2], 3)
    XCTAssertEqual(res, 2)
  }
  
  func test2() throws {
    let res = self.obj.findLeastNumOfUniqueInts([2,4,1,8,3,5,1,3], 3)
    XCTAssertEqual(res, 3)
  }
  
  func test3() throws {
    let res = self.obj.findLeastNumOfUniqueInts([2], 1)
    XCTAssertEqual(res, 0)
  }
  
  func test4() throws {
    let res = self.obj.findLeastNumOfUniqueInts([1, 1, 2, 2, 3, 3], 3)
    XCTAssertEqual(res, 2)
  }
  

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
