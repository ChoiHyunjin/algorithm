//
//  P134.swift
//  Swift3
//
//  Created by choi hyunjin on 2022/01/17.
//

import Foundation

class P134{
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        var ptr = 0
        var total = 0
        var sum = 0
        for i in 0..<gas.count{
            let subs = gas[i] - cost[i]
            total += subs
            if sum<0 {
                ptr = i
                sum = 0
            }
            sum += subs
        }
        if total < 0 {
            return -1
        }else{
            return ptr
        }
    }
}
