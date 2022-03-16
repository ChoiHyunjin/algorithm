//
//  TupleTest.swift
//  Swift3Tests
//
//  Created by choi hyunjin on 2022/03/16.
//

import XCTest
@testable import Swift3

class TupleTest: XCTestCase {
    let obj = Tuple()
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let res = obj.solution("{{2},{2,1},{2,1,3},{2,1,3,4}}")
        XCTAssertEqual(res, [2,1,3,4])
    }
    
    func testExample2() throws {
        let res = obj.solution("{{4,2,3},{3},{2,3,4,1},{2,3}}")
        XCTAssertEqual(res, [3,2,4,1])
    }
    
    func testExample3() throws {
        let res = obj.solution("{{123}}")
        XCTAssertEqual(res, [123])
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
