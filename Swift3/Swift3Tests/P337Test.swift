//
//  P337Test.swift
//  Swift3Tests
//
//  Created by choi hyunjin on 2022/01/16.
//

import XCTest
@testable import Swift3

class P337Test: XCTestCase {
    let obj = P337()
    
    func makeTree(_ nodes:[Int?]) -> TreeNode{
        var arr = Array<TreeNode?>.init(repeating: nil, count: nodes.count)
        
        for i in 0..<nodes.count {
            if nodes[i] != nil{
                arr[i] = TreeNode(nodes[i]!)
            }
        }
        var j = 1
        var limit = j
        for i in 0..<nodes.count {
            if i <= nodes.count - i*2 {
                arr[i]?.left = arr[i*2+1]
            }
            if i <= nodes.count - i*2 - 1 {
                arr[i]?.right = arr[i*2+2]
            }
            limit -= 1
            if limit == 0 {
                j *= 2
                limit = j
            }
        }
        return arr[0]!
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test1() throws {
        let node = self.makeTree([3,2,3,nil,3,nil,1])
        XCTAssertEqual(self.obj.rob(node), 7)
    }
    
    func test2() throws {
        let node = self.makeTree([3,4,5,1,3,nil,1])
        XCTAssertEqual(self.obj.rob(node), 9)
    }
    
    func test3() throws {
        let node = self.makeTree([2,1,3,nil,4])
        XCTAssertEqual(self.obj.rob(node), 7)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
