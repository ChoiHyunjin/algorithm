//
//  EditingTableTest.swift
//  Swift3Tests
//
//  Created by choi hyunjin on 2022/03/12.
//

import XCTest
@testable import Swift3

class EditingTableTest: XCTestCase {
    let obj = EditingTable()
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let res = obj.solution(8, 2, ["D 2", "C", "U 3", "C", "D 4", "C", "U 2", "Z", "Z", "U 1", "C"])
        XCTAssertEqual(res, "OOXOXOOO")
    }
    
    func testExample2() throws {
        let res = obj.solution(8, 2, ["D 2", "C", "U 3", "C", "D 4", "C", "U 2", "Z", "Z"])
        XCTAssertEqual(res, "OOOOXOOO")
    }
    
    func testExample3() throws {
        let res = obj.solution(8, 7, ["C","C","C","C","C","C","C"])
        XCTAssertEqual(res, "OXXXXXXX")
    }
    
    func testExample4() throws {
        let res = obj.solution(8, 7, ["C","C","C","C","C","C","C", "Z", "Z", "Z", "Z", "Z", "Z", "Z", "Z", "Z"])
        XCTAssertEqual(res, "OOOOOOOO")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
