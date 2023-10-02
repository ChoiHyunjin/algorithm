//
//  Musinsa1.swift
//  Swift3
//
//  Created by choi hyunjin on 2022/04/30.
//

import Foundation

class Musinsa1{
    func test() -> Bool{
        return false
    }
    
    func solution(_ numbers:[Int]) -> [Int] {
        var res = Array.init(repeating: 0, count: numbers.count)
        let sorted = numbers.sorted(by: {
            $0 < $1
        })
        
        var tail = sorted.count - 1
        var head = 0
        var ptr = 0
        while ptr < sorted.count && tail >= head{
            if ptr & 0x1 == 0 {
                res[ptr] = sorted[tail]
                tail -= 1
                ptr += 1
            }else {
            res[ptr] = sorted[head]
            head += 1
            ptr += 1
                
            }
        }
        
        return res
    }
}
