//
//  Socar1Test.swift
//  Swift3Tests
//
//  Created by choi hyunjin on 2022/03/17.
//

import XCTest
@testable import Swift3

class Socar1Test: XCTestCase {
    let obj = Socar1()
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let res = obj.solution([[0,2,1,3],[1,2,2,5],[3,3,4,4],[4,1,6,3],[1,6,5,7],[5,5,7,6],[5,8,6,10]])
        XCTAssertEqual(res, ["0 0 1 1","1 0 2 3","2 0 3 1","3 0 5 2","0 3 4 4","2 2 4 3","4 3 5 5"])
    }
    
    func testExample2() throws {
        let res = obj.solution([[4,2,5,3],[5,2,6,5],[3,3,4,4],[0,1,2,3],[1,6,5,7],[5,5,7,6],[5,8,6,10]])
        XCTAssertEqual(res, ["3 0 4 1","4 0 5 3","2 0 3 1","0 0 2 2","0 2 4 3","0 3 2 4","0 4 1 6"])
    }
    
    func testExample3() throws {
        let res = obj.solution([[4,2,5,3],[5,2,6,5],[3,3,4,4],[0,1,1,3],[1,6,5,7],[5,5,7,6],[5,8,6,10]])
        XCTAssertEqual(res, ["2 0 3 1","5 0 6 3","1 0 2 1","0 0 1 2","1 1 5 2","0 3 2 4","0 4 1 6"])
    }
    
    func testExample4() throws {
        let res = obj.solution([[4,2,5,3],[5,2,6,5],[3,3,4,4],[1,1,2,3],[1,6,5,7],[5,5,7,6],[5,8,6,10]])
        XCTAssertEqual(res, ["2 0 3 1","4 0 5 3","1 0 2 1","0 0 1 2","0 2 4 3","0 3 2 4","0 4 1 6"])
    }
    
    func testExample5() throws {
        let res = obj.solution([[0,2,1,3],[1,2,2,5],[3,3,4,4],[4,1,6,3],[2,6,5,7],[5,5,7,6],[5,8,6,10]])
        XCTAssertEqual(res, ["0 0 1 1","1 0 2 3","2 0 3 1","3 0 5 2","2 2 5 3","5 2 7 3","0 3 1 5"])
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
