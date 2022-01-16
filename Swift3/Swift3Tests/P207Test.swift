//
//  P207Test.swift
//  Swift3Tests
//
//  Created by choi hyunjin on 2022/01/16.
//

import XCTest
@testable import Swift3

class P207Test: XCTestCase {
    var obj = P207()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func test1() throws{
        let res = self.obj.canFinish(2, [[1,0]])
        XCTAssertTrue(res)
    }
    
    func test2() throws{
        let res = self.obj.canFinish(2, [[1,0],[0,1]])
        XCTAssertFalse(res)
    }
    
    func test3() throws{
        let res = self.obj.canFinish(20, [[0,10],[3,18],[5,5],[6,11],[11,14],[13,1],[15,1],[17,4]])
        XCTAssertFalse(res)
    }
    
    func test4() throws{
        let res = self.obj.canFinish(3, [[1,0],[1,2],[0,1]])
        XCTAssertFalse(res)
    }
    
    func test5() throws{
        let res = self.obj.canFinish(5, [[1,4],[2,4],[3,1],[3,2]])
        XCTAssertTrue(res)
    }
    
}

