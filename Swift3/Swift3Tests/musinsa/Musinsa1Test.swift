//
//  Musinsa1Test.swift
//  Swift3Tests
//
//  Created by choi hyunjin on 2022/04/30.
//

import XCTest
@testable import Swift3

class Musinsa1Test: XCTestCase {
    let obj = Musinsa1()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample1() throws {
        XCTAssertEqual(obj.solution([3,5,4,1,6]), [6,1,5,3,4])
    }
    
    func testExample2() throws {
        XCTAssertEqual(obj.solution([-1,6,0,2,9,-8]), [9,-8,6,-1,2,0])
    }
    
    func testExample3() throws {
        XCTAssertEqual(obj.solution([0]), [0])
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
