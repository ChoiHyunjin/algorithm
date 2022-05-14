//
//  P417Test.swift
//  Swift3Tests
//
//  Created by choi hyunjin on 2022/05/11.
//

import XCTest
@testable import Swift3

class P417Test: XCTestCase {
    let obj = P417()
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let res = obj.pacificAtlantic([[1,2,2,3,5],[3,2,3,4,4],[2,4,5,3,1],[6,7,1,4,5],[5,1,1,2,4]])
        XCTAssertEqual(res, [[0,4],[1,3],[1,4],[2,2],[3,0],[3,1],[4,0]])
    }
    
    func testExample2() throws {
        let res = obj.pacificAtlantic([[1,1],[1,1],[1,1]])
        XCTAssertEqual(res, [[]])
    }
    
    func testExample3() throws {
        let res = obj.pacificAtlantic([[1,2,3],[8,9,4],[7,6,5]])
        XCTAssertEqual(res, [[0,2],[1,0],[1,1],[1,2],[2,0],[2,1],[2,2]])
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
