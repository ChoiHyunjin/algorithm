//
//  P740Test.swift
//  Swift3Tests
//
//  Created by choi hyunjin on 2022/03/05.
//

import XCTest
@testable import Swift3

class P740Test: XCTestCase {
  let obj = P740()
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
      let res = obj.deleteAndEarn([2,2,3,3,3,4])
      XCTAssertEqual(res, 9)
    }
  
  func testExample1() throws {
    let res = obj.deleteAndEarn([2,2,3,3,3,4,4])
    XCTAssertEqual(res, 12)
  }
  
  func testExample2() throws {
    let res = obj.deleteAndEarn([8,3,4,7,6,6,9,2,5,8,2,4,9,5,9,1,5,7,1,4])
    XCTAssertEqual(res, 61)
  }
  func testExample3() throws {
    let res = obj.deleteAndEarn([10,8,4,2,1,3,4,8,2,9,10,4,8,5,9,1,5,1,6,8,1,1,6,7,8,9,1,7,6,8,4,5,4,1,5,9,8,6,10,6,4,3,8,4,10,8,8,10,6,4,4,4,9,6,9,10,7,1,5,3,4,4,8,1,1,2,1,4,1,1,4,9,4,7,1,5,1,10,3,5,10,3,10,2,1,10,4,1,1,4,1,2,10,9,7,10,1,2,7,5])
    XCTAssertEqual(res, 338)
  }
  func testExample4() throws {
    let res = obj.deleteAndEarn([2,2])
    XCTAssertEqual(res, 4)
  }
  func testExample5() throws {
    let res = obj.deleteAndEarn([1])
    XCTAssertEqual(res, 1)
  }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
