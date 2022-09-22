//
//  P1Test.swift
//  Swift3Tests
//
//  Created by choi hyunjin on 2022/03/12.
//

import XCTest
@testable import Swift3

class P1Test: XCTestCase {
    let obj = P1()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let res = obj.product(["sofa red long", "blanket blue long", "towel red", "mattress long", "curtain blue long cheap"], ["towel", "mattress", "curtain"])
        XCTAssertEqual(res, "blanket")
    }
    
    func testExample2() throws {
        let res = obj.product(["towel red long thin", "blanket red thick short", "curtain red long wide", "mattress thick", "hat red thin", "pillow red long", "muffler blue thick long"], ["blanket", "curtain", "hat", "muffler"])
        XCTAssertEqual(res, "towel")
    }
    
    func testExample3() throws {
        let res = obj.product(["sofa red long", "blanket blue long"], ["sofa"])
        XCTAssertEqual(res, "blanket")
    }
    
    func testExample4() throws {
        let res = obj.product(["sofa red", "blanket blue"], ["sofa"])
        XCTAssertEqual(res, "blanket")
    }
    
    func testExample5() throws {
        let res = obj.product(["sofa red long", "blanket blue long", "towel long"], ["sofa"])
        XCTAssertEqual(res, "blanket")
    }
    
    func testExample6() throws {
        let res = obj.product(["sofa aa aaa aaaa aaaaa", "blanket aaaaa aaaa aa a b", "towel long"], ["towel"])
        XCTAssertEqual(res, "blanket")
    }
    
    func testExample7() throws {
        let res = obj.product(["sofa aa aaa aaaa aaaaa", "blanket aaaaa aaaa aa aaa b", "towel long"], ["towel"])
        XCTAssertEqual(res, "blanket")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
