//
//  Musinsa3.swift
//  Swift3
//
//  Created by choi hyunjin on 2022/04/30.
//

import Foundation

class Musinsa3{
    
    var visited = [String: Int64]()
    let MAX = Int64.max
    func solution(_ n:Int) -> Int64 {
        if n == 1 {
            return 2
        } else if n == 2 {
            return 6
        }
        var res : Int64 = 0
        
        var numbers = [Int64]()
        
        for i in 0..<n-2{
            let value = calculate(start: 1, length: i+2)

            if value == MAX{
                break
            }
            numbers.append(value)
        }
        var ptrs = Array.init(repeating: 1, count: numbers.count)
        
        for _ in 0..<n {
            var ptr = 0
            var temp = numbers[0]
            for j in 1..<numbers.count{
                if temp < numbers[j]{
                    continue
                }else if temp == numbers[j]{
                    getNext(numbers: &numbers, ptrs: &ptrs, ptr: j)
                    continue
                }
                ptr = j
                temp = numbers[j]
            }
            res = temp
            getNext(numbers: &numbers, ptrs: &ptrs, ptr: ptr)
            if numbers[ptr] == MAX {
                numbers.remove(at: ptr)
                ptrs.remove(at: ptr)
            }
        }
        
        return res
    }
    
    func getNext(numbers: inout [Int64], ptrs: inout [Int], ptr: Int){
        ptrs[ptr] += 1
        numbers[ptr] = calculate(start: ptrs[ptr], length: ptr+2)
    }
    
    func calculate(start: Int, length: Int) -> Int64 {
        var res : Int64 = 1
        
        let limit = MAX / Int64(start+length)
        let prevKey = "\(start),\(length-1)"
        let key = "\(start),\(length)"
        if let value = visited[prevKey] {
            if value >= limit {
                res = MAX
            }else{
                res = value * Int64(start + length-1)
            }
        } else {
            for i in 0..<length{
                res *= Int64((start + i))
                if res >= limit {
                    res = MAX
                    break
                }
            }
        }
        visited[key] = res
        
        return res
    }
}
