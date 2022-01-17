//
//  P134Test.swift
//  Swift3Tests
//
//  Created by choi hyunjin on 2022/01/17.
//

import XCTest
@testable import Swift3

class P134Test: XCTestCase {
    let obj = P134()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test1() throws {
        XCTAssertEqual(self.obj.canCompleteCircuit([1,2,3,4,5], [3,4,5,1,2]), 3)
    }
    
    func test2() throws {
        XCTAssertEqual(self.obj.canCompleteCircuit([2,3,4], [3,4,3]), -1)
    }
    
    func test3() throws {
        XCTAssertEqual(self.obj.canCompleteCircuit([5,1,2,3,4,5,6,7,8], [2,3,4,5,1,8,2,9,10]), -1)
    }
    
    func test4() throws {
        XCTAssertEqual(self.obj.canCompleteCircuit([5,1,2,3,4,5,6,7,8,9], [2,3,4,5,1,8,2,9,10,6]), 4)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
