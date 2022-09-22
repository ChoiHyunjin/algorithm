//
//  JewelryShoppingTest.swift
//  Swift3Tests
//
//  Created by choi hyunjin on 2022/03/11.
//

import XCTest
@testable import Swift3

class JewelryShoppingTest: XCTestCase {
    let obj = JewelryShopping()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        let res = obj.solution(["DIA", "RUBY", "RUBY", "DIA", "DIA", "EMERALD", "SAPPHIRE", "DIA"])
        XCTAssertEqual(res, [3,7])
    }
    
    func testExample1() throws {
        let res = obj.solution(["AA", "AB", "AC", "AA", "AC"])
        XCTAssertEqual(res, [1,3])
    }
    
    func testExample2() throws {
        let res = obj.solution(["XYZ", "XYZ", "XYZ"])
        XCTAssertEqual(res, [1,1])
    }
    
    func testExample3() throws {
        let res = obj.solution(["ZZZ", "YYY", "NNNN", "YYY", "BBB"])
        XCTAssertEqual(res, [1,5])
    }
    
    func testExample4() throws {
        let res = obj.solution(["ZZZ"])
        XCTAssertEqual(res, [1,1])
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
