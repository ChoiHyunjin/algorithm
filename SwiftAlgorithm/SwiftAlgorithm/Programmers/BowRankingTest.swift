//
//  BowRankingTest.swift
//  Swift3Tests
//
//  Created by choi hyunjin on 2022/03/16.
//

import XCTest
@testable import Swift3

class BowRankingTest: XCTestCase {
    let obj = BowRanking()
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        let res = obj.solution(5, [2, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0])
        XCTAssertEqual(res, [0,2,2,0,1,0,0,0,0,0,0])
    }
    
    func testExample1() throws {
        let res = obj.solution(1, [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0])
        XCTAssertEqual(res, [-1])
    }
    
    func testExample2() throws {
        let res = obj.solution(9, [0,0,1,2,0,1,1,1,1,1,1])
        XCTAssertEqual(res, [1,1,2,0,1,2,2,0,0,0,0])
    }
    
    func testExample3() throws {
        let res = obj.solution(10, [0,0,0,0,0,0,0,0,3,4,3])
        XCTAssertEqual(res, [1,1,1,1,1,1,1,1,0,0,2])
    }
    
    func testExample4() throws {
        let res = obj.solution(7, [1,2,1,1,1,1,0,0,3,4,3])
        XCTAssertEqual(res, [2,0,2,2,0,0,1,0,0,0,0])
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
