//
//  P57Test.swift
//  Swift3Tests
//
//  Created by choi hyunjin on 2022/02/20.
//

import XCTest
@testable import Swift3

class P57Test: XCTestCase {
  let obj = P57()
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
      let res = self.obj.insert([[1,3],[6,9]], [2,5])
      XCTAssertEqual(res, [[1,5],[6,9]])
    }
  
  func test1() throws{
    let res = self.obj.insert([[1,2],[3,5],[6,7],[8,10],[12,16]], [4,8])
    XCTAssertEqual(res, [[1,2],[3,10],[12,16]])
    
  }
  
  func test2() throws{
    let res = self.obj.insert([], [4,8])
    XCTAssertEqual(res, [[4,8]])
  }
  
  func test3() throws{
    let res = self.obj.insert([[1,2]], [4,8])
    XCTAssertEqual(res, [[1,2],[4,8]])
  }
  
  func test4() throws{
    let res = self.obj.insert([[1,5]], [0,0])
    XCTAssertEqual(res, [[0,0],[1,5]])
  }
  
  func test5() throws{
    let res = self.obj.insert([[1,5]], [2,7])
    XCTAssertEqual(res, [[1,7]])
  }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
