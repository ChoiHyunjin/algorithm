//
//  P1035Test.swift
//  Swift3Tests
//
//  Created by choi hyunjin on 2022/02/21.
//

import XCTest
@testable import Swift3

class P1035Test: XCTestCase {
  let obj = P1035()
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
      let res = self.obj.maxUncrossedLines([1,4,2], [1,4,2])
      XCTAssertEqual(res, 3)
    }
  
  func test1() throws {
    let res = self.obj.maxUncrossedLines([1,4,2], [1,2,4])
    XCTAssertEqual(res, 2)
  }
  
  func test2() throws {
    let res = self.obj.maxUncrossedLines([1,1,2,1], [3,3,1])
    XCTAssertEqual(res, 1)
  }
  
  func test3() throws {
    let res = self.obj.maxUncrossedLines([1,3,7,1,7,5,6], [1,9,2,5,7,1,1,6])
    XCTAssertEqual(res, 4)
  }
  
  func test4() throws {
    let res = self.obj.maxUncrossedLines([1,3,7,1,7,5,0,6,7,8], [1,9,2,5,1,7,6,7,8,0])
    XCTAssertEqual(res, 5)
  }
  
  func test5() throws {
    let res = self.obj.maxUncrossedLines([2,3,1], [3,1,3,3,3])
    XCTAssertEqual(res, 2)
  }
  
  func test6() throws {
    let res = self.obj.maxUncrossedLines([1,2,3], [0,4,2,3,1])
    XCTAssertEqual(res, 2)
  }
  
  func test7() throws {
    let res = self.obj.maxUncrossedLines([3,2,2,3], [1,1,2,3,2])
    XCTAssertEqual(res, 2)
  }
  
  func test8() throws {
    let res = self.obj.maxUncrossedLines([3,3,3,1], [2,2,3,3])
    XCTAssertEqual(res, 2)
  }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
