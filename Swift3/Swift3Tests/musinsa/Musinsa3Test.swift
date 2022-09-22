//
//  Musinsa3Test.swift
//  Swift3Tests
//
//  Created by choi hyunjin on 2022/04/30.
//

import XCTest
@testable import Swift3

class Musinsa3Test: XCTestCase {
    let obj = Musinsa3()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        XCTAssertEqual(obj.solution(1), 2)
    }
    
    func testExample2() throws {
        XCTAssertEqual(obj.solution(2), 6)
    }
    
    func testExample3() throws {
        XCTAssertEqual(obj.solution(4), 20)
    }
    
    func testExample4() throws {
        XCTAssertEqual(obj.solution(9), 60)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
