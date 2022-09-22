//
//  P795.swift
//  Swift3Tests
//
//  Created by choi hyunjin on 2022/03/05.
//

import XCTest
@testable import Swift3

class P795Test: XCTestCase {
  let obj = P795()
  
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
      let res = self.obj.numSubarrayBoundedMax([2,1,4,3], 2, 3)
      XCTAssertEqual(res, 3)
    }
  
  func testExample2() throws {
    let res = self.obj.numSubarrayBoundedMax([2,9,2,5,6], 2, 8)
    XCTAssertEqual(res, 7)
  }
  
  func testExample3() throws {
    let res = self.obj.numSubarrayBoundedMax([73,55,36,5,55,14,9,7,72,52], 32, 69)
    XCTAssertEqual(res, 22)
  }
  
  func testExample4() throws {
    let res = self.obj.numSubarrayBoundedMax([876,880,482,260,132,421,732,703,795,420,871,445,400,291,358,589,617,202,755,810,227,813,549,791,418,528,835,401,526,584,873,662,13,314,988,101,299,816,833,224,160,852,179,769,646,558,661,808,651,982,878,918,406,551,467,87,139,387,16,531,307,389,939,551,613,36,528,460,404,314,66,111,458,531,944,461,951,419,82,896,467,353,704,905,705,760,61,422,395,298,127,516,153,299,801,341,668,598,98,241],658,719)
    XCTAssertEqual(res, 19)
  }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
