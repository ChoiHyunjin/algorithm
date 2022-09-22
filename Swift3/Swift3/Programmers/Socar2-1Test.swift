//
//  Socar2-1Test.swift
//  Swift3Tests
//
//  Created by choi hyunjin on 2022/03/19.
//

import XCTest
@testable import Swift3

class Socar2_1Test: XCTestCase {
    let obj = Socar2_1()
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        let res = obj.solution([10,40,30,20], 20)
        XCTAssertEqual(res, 1)
    }
    
    func testExample2() throws {
        let res = obj.solution([3,7,2,8,6,4,5,1], 3)
        XCTAssertEqual(res, 2)
    }
    
    func testExample3() throws {
        let res = obj.solution([3,7,2,4,6,8,5,1], 3)
        XCTAssertEqual(res, 2)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
