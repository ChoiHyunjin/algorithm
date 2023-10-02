//
//  Musinsa2.swift
//  Swift3
//
//  Created by choi hyunjin on 2022/04/30.
//

import Foundation

class Musinsa2{
    func solution(_ numbers:[Int]) -> Int {
        var res = 0
        var mask = 1
        
        for number in numbers {
            res += number & mask
            mask = mask << 1
        }
        
        return res
    }
}
