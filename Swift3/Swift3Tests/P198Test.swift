//
//  P198.swift
//  Swift3Tests
//
//  Created by choi hyunjin on 2022/01/16.
//

import XCTest
@testable import Swift3

class P198Test: XCTestCase {
    let obj = P198()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test1() throws {
        XCTAssertEqual(self.obj.rob([1,2,3,1]), 4)
    }
    
    func test2() throws {
        XCTAssertEqual(self.obj.rob([2,7,9,3,1]), 12)
    }
    
    func test3() throws {
        XCTAssertEqual(self.obj.rob([2,7]), 7)
    }
    
    func test4() throws {
        XCTAssertEqual(self.obj.rob([0,0]), 0)
    }
    
    func test5() throws {
        XCTAssertEqual(self.obj.rob([7]), 7)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
