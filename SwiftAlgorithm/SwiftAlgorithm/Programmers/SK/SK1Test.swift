//
//  SK1Test.swift
//  Swift3Tests
//
//  Created by choi hyunjin on 2022/03/19.
//

import XCTest
@testable import Swift3

class SK1Test: XCTestCase {
    let obj = SK1()
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test() throws {
        let res = obj.hasString("pencil", "encil")
        XCTAssertEqual(res, true)
    }
    
    func test2() throws {
        let res = obj.hasString("pencil", "p")
        XCTAssertEqual(res, true)
    }
    
    func test3() throws {
        let res = obj.hasString("pencil", "a")
        XCTAssertEqual(res, false)
    }

    func testExample() throws {
        let res = obj.sol(["pencil","cilicon","contrabase","picturelist"])
        XCTAssertEqual(res, ["en nc pe","ico ili lic","a b","u"])
    }
    
    func testExample1() throws {
        let res = obj.sol(["abcdeabcd","cdabe","abce","bcdeab"])
        XCTAssertEqual(res, ["abcd eabc","be da","ce","None"])
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
