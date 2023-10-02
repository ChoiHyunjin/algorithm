//
//  Socar2-1.swift
//  Swift3
//
//  Created by choi hyunjin on 2022/03/19.
//

import Foundation

class Socar2_1{
    func solution(_ input: [Int],_ k: Int) -> Int {
        var res = 0
        
        var currQueue = [[Int]]()
        var prevQueue = [[Int]].init(repeating: input, count: 1)
        
        while prevQueue.count > 0 {
            var result = false
            for queue in prevQueue{
                result = bfs(queue, k, &currQueue)
                if result {
                    break
                }
            }
            if result {
                break
            }
            res += 1
            prevQueue = currQueue
            currQueue = [[Int]]()
        }
        
        return res
    }
    
    func bfs(_ input: [Int],_ k: Int,_ queue: inout [[Int]]) -> Bool {
        var res = true
        for i in 0..<input.count-1{
            let sub = input[i] - input[i+1]
//            if sub < 0 && sub < -k {
//                res = false
//
//            }else if sub >= 0 && sub > k  {
//                res = false
//            }
            if (sub < 0 && sub < -k) || (sub >= 0 && sub > k) {
                res = false
                for j in 0..<input.count{
                    var result = isAvailble(input, j, i, k)
                    result = res && isAvailble(input, i, j, k)
                    if res {
                        var input = input
                        let temp = input[i]
                        input[i] = input[j]
                        input[j] = temp
                        queue.append(input)
                    }
                    result = isAvailble(input, j, i+1, k)
                    result = res && isAvailble(input, i+1, j, k)
                    if res {
                        var input = input
                        let temp = input[i+1]
                        input[i+1] = input[j]
                        input[j] = temp
                        queue.append(input)
                    }
                }
            }
        }
        return res
    }
    
    func isAvailble(_ input: [Int],_ from: Int, _ to: Int, _ k: Int) -> Bool {
        let value = input[from]
        var res = true
        if to > 0 {
            res = abs(input[to-1] - value) <= k
        }
        if res && to < input.count-1{
            res = abs(input[to+1] - value) <= k
        }
        return res
    }
}
