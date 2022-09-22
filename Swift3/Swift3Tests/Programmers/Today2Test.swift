//
//  Today2Test.swift
//  Swift3Tests
//
//  Created by choi hyunjin on 2022/03/12.
//

import XCTest
@testable import Swift3

class Today2Test: XCTestCase {
    let obj = Today2()
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        let res = obj.doIt([3, 3, 6, 7, 7, 9])
        XCTAssertEqual(res, 12)
    }
    
    func testExample2() throws {
        let res = obj.doIt([2, 2, 3, 3, 8, 8])
        XCTAssertEqual(res, 13)
    }
    
    func testExample3() throws {
        let res = obj.doIt([5,5,5,5,5])
        XCTAssertEqual(res, 6)
    }
    
    func testExample4() throws {
        let res = obj.doIt([2, 2, 2, 3, 3, 8, 8])
        XCTAssertEqual(res, 13)
    }
    
    func testExample5() throws {
        let res = obj.doIt([2, 3, 3, 3, 3, 8, 8, 8, 8])
        XCTAssertEqual(res, 13)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
