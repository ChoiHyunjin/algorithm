//
//  Socar2Test.swift
//  Swift3Tests
//
//  Created by choi hyunjin on 2022/03/17.
//

import XCTest
@testable import Swift3

class Socar2Test: XCTestCase {
    let obj = Socar2()
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let res = obj.sol([140,21,21,32], [2,1,3,7])
        XCTAssertEqual(res, 288)
    }
    
    func testExample2() throws {
        let res = obj.sol([140,32,21,21], [2,7,1,3])
        XCTAssertEqual(res, 288)
    }
    
    func testExample1() throws {
        let res = obj.sol([140,32,21,21,32], [2,1,3,7,7])
        XCTAssertEqual(res, 420)
    }
    
    func testExample3() throws {
        let res = obj.sol([140,32,21,21,32], [2,1,7,7,3])
        XCTAssertEqual(res, 420)
    }
    
    func testExample4() throws {
        let res = obj.sol([1000000,4000,200000,50000], [4,3000,1000,5000])
        XCTAssertEqual(res, 300200000)
    }
    
    func testExample5() throws {
        let height = [Int].init(repeating: 1000000, count: 400000)
        let width = [Int].init(repeating: 5000, count: 400000)
        let res = obj.sol(height, width)
        XCTAssertEqual(res, 2000000000000000)
    }
    
    func testExample6() throws {
        let res = obj.sol([1], [1])
        XCTAssertEqual(res, 1)
    }
    
    func testExample7() throws {
        let res = obj.sol([2], [5])
        XCTAssertEqual(res, 10)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
