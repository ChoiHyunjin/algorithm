//
//  BlockGameTest.swift
//  Swift3Tests
//
//  Created by choi hyunjin on 2022/03/18.
//

import XCTest
@testable import Swift3

class BlockGameTest: XCTestCase {
    let obj = BlockGame()
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        let res = obj.solution([
            [0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,4,0,0,0],
            [0,0,0,0,0,4,4,0,0,0],
            [0,0,0,0,3,0,4,0,0,0],
            [0,0,0,2,3,0,0,0,5,5],
            [1,2,2,2,3,3,0,0,0,5],
            [1,1,1,0,0,0,0,0,0,5]])
        XCTAssertEqual(res, 2)
    }
    
    func testExample2() throws {
        let res = obj.solution([
            [0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,4,0,0,0],
            [0,0,0,0,0,4,4,4,0,0],
            [0,0,0,0,3,0,0,0,0,0],
            [0,0,0,2,3,0,6,0,5,5],
            [1,2,2,2,3,3,6,0,0,5],
            [1,1,1,0,0,0,6,6,0,5]])
        XCTAssertEqual(res, 5)
    }
    
    func testExample3() throws {
        let res = obj.solution([
            [0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,4,0,0,0],
            [0,0,0,0,0,4,4,4,0,0],
            [0,0,0,0,3,0,0,0,0,0],
            [0,0,0,2,3,0,6,0,5,5],
            [1,2,2,2,3,3,6,0,0,5],
            [1,1,1,0,0,6,6,0,0,5]])
        XCTAssertEqual(res, 5)
    }
    
    func testExample4() throws {
        let res = obj.solution([
            [9,9,9,8,8,8,7,7,7,0],
            [9,0,0,0,0,8,0,7,0,0],
            [0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,4,0,0,0],
            [0,0,0,0,0,4,4,4,0,0],
            [0,0,0,0,3,0,0,0,0,0],
            [0,0,0,2,3,0,6,0,5,5],
            [1,2,2,2,3,3,6,0,0,5],
            [1,1,1,0,0,6,6,0,0,5]])
        XCTAssertEqual(res, 0)
    }
    
    func testExample5() throws {
        let res = obj.solution([[1, 1, 1, 0, 0, 0, 0, 0, 0, 0], [1, 0, 0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 4, 0, 0, 0], [0, 0, 0, 0, 0, 4, 4, 0, 0, 0],
            [0, 0, 0, 0, 3, 0, 4, 0, 0, 0], [0, 0, 0, 2, 3, 0, 0, 0, 5, 5],
            [1, 2, 2, 2, 3, 3, 0, 0, 0, 5], [1, 1, 1, 0, 0, 0, 0, 0, 0, 5]])
        XCTAssertEqual(res, 0)
    }
    
    func testExample6() throws {
        let res = obj.solution([[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                                [0, 0, 0, 0, 0, 0, 0, 9, 0, 0],
                                [0, 0, 0, 0, 0, 0, 9, 9, 0, 0],
                                [0, 0, 0, 0, 0, 0, 0, 9, 0, 0],
                                [0, 0, 0, 0, 0, 0, 4, 0, 0, 0],
                                [8, 8, 8, 0, 0, 4, 4, 0, 0, 0],
                                [8, 2, 7, 0, 0, 3, 4, 0, 0, 0],
                                [0, 2, 7, 7, 7, 3, 0, 0, 5, 5],
                                [1, 2, 2, 0, 3, 3, 0, 0, 0, 5],
                                [1, 1, 1, 0, 0, 0, 0, 0, 0, 5]])
        XCTAssertEqual(res, 2)
    }
    
    func testExample7() throws {
        let res = obj.solution([[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                                [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                                [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                                [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                                [0, 0, 0, 0, 0, 0, 4, 0, 0, 0],
                                [0, 0, 0, 0, 0, 4, 4, 0, 0, 0],
                                [0, 2, 7, 0, 0, 3, 4, 0, 0, 0],
                                [0, 2, 7, 7, 7, 3, 0, 0, 5, 5],
                                [1, 2, 2, 0, 3, 3, 0, 0, 0, 5],
                                [1, 1, 1, 0, 0, 0, 0, 0, 0, 5]])
        XCTAssertEqual(res, 4)
    }
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
