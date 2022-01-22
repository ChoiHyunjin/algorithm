//
//  P213Test.swift
//  Swift3Tests
//
//  Created by choi hyunjin on 2022/01/17.
//

import XCTest
@testable import Swift3

class P213Test: XCTestCase {
    let obj = P213()
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        XCTAssertEqual(self.obj.rob([2,3,2]), 3)
    }
    
    func test1() throws {
        XCTAssertEqual(self.obj.rob([1,2,3,1]), 4)
    }
    
    func test2() throws {
        XCTAssertEqual(self.obj.rob([1,2,3,1]), 4)
    }
    
    func test3() throws {
        XCTAssertEqual(self.obj.rob([1,2,3]), 3)
    }
    
    func test4() throws {
        XCTAssertEqual(self.obj.rob([4,4,6,9,1,0,4,7]), 20)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
