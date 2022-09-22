//
//  P424Test.swift
//  Swift3Tests
//
//  Created by choi hyunjin on 2022/01/24.
//

import XCTest
@testable import Swift3

class P424Test: XCTestCase {
    let obj = P424()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        
        XCTAssertEqual(self.obj.characterReplacement("ABAB", 2), 4)
    }
    
    func test1() throws {
        XCTAssertEqual(self.obj.characterReplacement("AABABBA", 1), 4)
    }
    
    func test2() throws {
        XCTAssertEqual(self.obj.characterReplacement("ABAB", 1), 3)
    }
    
    func test3() throws {
        XCTAssertEqual(self.obj.characterReplacement("ABBB", 2), 4)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
