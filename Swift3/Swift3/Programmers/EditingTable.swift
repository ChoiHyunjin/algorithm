//
//  EditingTable.swift
//  Swift3
//
//  Created by choi hyunjin on 2022/03/12.
//

import Foundation

class EditingTable {
    func solution(_ n:Int, _ k:Int, _ cmd:[String]) -> String {
        var res = [Character].init(repeating: "O", count: n)
        var list = [Int].init(repeating: 0, count: n)
        var stack = [Int]()
        
        for i in 0..<list.count{
            list[i] = i
        }
        
        var ptr = k
        
        for ch in cmd{
            switch ch {
            case "C":
                let num = list.remove(at: ptr)
                stack.append(num)
                ptr = min(ptr, list.count-1)
                break
            case "Z":
                if let num = stack.popLast(){
                    list.insert(num, at: min(num, list.count))
                    if num <= ptr {
                        ptr += 1
                    }
                }
                break
            default:
                let str = ch.split(separator: " ")
                var count = Int(str[1])!
                if str[0] == "U" {
                    ptr = max(ptr-count, 0)
                }else if str[0] == "D" {
                    ptr = min(ptr+count, list.count-1)
                }
                break
            }
        }
        
        for num in stack {
            res[num] = "X"
        }
        
        return String(res)
    }
}
