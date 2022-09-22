//
//  P799Test.swift
//  Swift3Tests
//
//  Created by choi hyunjin on 2022/03/06.
//

import XCTest
@testable import Swift3

class P799Test: XCTestCase {
  let obj = P799()
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
  
  func testExample() throws {
    let res = obj.champagneTower(1, 1, 1)
    XCTAssertEqual(res, 0.0)
  }
  
  func testExample1() throws {
    let res = obj.champagneTower(2, 1, 1)
    XCTAssertEqual(res, 0.5)
  }
  
  func testExample2() throws {
    let res = obj.champagneTower(100000009, 33, 17)
    XCTAssertEqual(res, 1.0)
  }
  
  func testExample3() throws {
    let res = obj.champagneTower(4, 2, 1)
    XCTAssertEqual(res, 0.5)
  }
  
  func testExample4() throws {
    let res = obj.champagneTower(1000000000, 99, 99)
    XCTAssertEqual(res, 1.0)
  }
  
  func testExample5() throws {
    let res = obj.champagneTower(6, 2, 0)
    XCTAssertEqual(res, 0.75)
  }
  
  func testExample6() throws {
    let res = obj.champagneTower(1, 0, 0)
    XCTAssertEqual(res, 1.0)
  }
  
  func testExample7() throws {
    let res = obj.champagneTower(8, 3, 0)
    XCTAssertEqual(res, 0.125)
  }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
