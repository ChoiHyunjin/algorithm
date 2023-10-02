//
//  BowRanking.swift
//  Swift3
//
//  Created by choi hyunjin on 2022/03/16.
//

import Foundation

class BowRanking {
    var maxCount = 1
    
    /*
     재귀 방식으로 전수 검사
     */
    func solution(_ n:Int, _ info:[Int]) -> [Int] {
        var res = [[Int]]()
        var list = [Int].init(repeating: 0, count: 11)
        recur(&res, n, &list, 0, info)
        
        if res.count == 0 {
            return [-1]
        }
        res = res.sorted(by: {
            for i in 0..<11 {
                if $0[10-i] != $1[10-i]{
                    return $0[10-i] > $1[10-i]
                }
            }
            return true
        })
        
        return res[0]
    }
    
    func recur(_ result: inout [[Int]], _ count: Int, _ list: inout [Int], _ ptr: Int, _ info:[Int]) {
        if count <= 0 {
            let list = list
            let sum = isWin(list, info)
            if sum > maxCount{
                maxCount = sum
                result = [list]
            }else if sum == maxCount {
                result.append(list)
            }
            return
        }
        if ptr >= info.count {
            return
        }
        for i in ptr..<info.count{
            if i == 10 {
                list[i] = count
                recur(&result, 0, &list, i+1, info)
            }else if count >= info[i]+1{
                list[i] = info[i]+1
                recur(&result, count-info[i]-1, &list, i+1, info)
            }
            list[i] = 0
        }
    }
    
    func isWin(_ lion: [Int], _ appeach: [Int]) -> Int {
        var sum = 0
        for i in 0..<appeach.count {
            if lion[i] == 0 && appeach[i] == 0 {
                continue
            }
            sum += (lion[i] > appeach[i] ? 1 : -1) * (10-i)
        }
        return sum
    }
    
    /*
        실패
     */
    func solution2(_ n:Int, _ info:[Int]) -> [Int] {
        var res = [Int].init(repeating: 0, count: 11)
        
        var values = [Double].init(repeating: 0.0, count: 11)
        var left = n
        for i in 0..<values.count{
            values[i] = Double((10 - i)*(info[i]>0 ? 2 : 1) / (info[i]+1))
        }
        var idxes = [Int].init(repeating: 0, count: 11)
        for i in 0..<idxes.count{
            idxes[i] = i
        }
        
        idxes = idxes.sorted(by: {
            if values[$0] == values[$1]{
                return $0 < $1
            } else {
                return values[$0] > values[$1]
            }
        })
        
        for i in 0..<info.count{
            let index = idxes[i]
            let num = info[index]
            if num+1 <= left {
                left -= num+1
                res[index] = num + 1
            }
            if left <= 0 {
                break
            }
        }
        
        if left > 0 {
            res[res.count-1] += left
        }
        
        var sum = 0
        for i in 0..<info.count {
            if res[i] == 0 && info[i] == 0 {
                continue
            }
            sum += (res[i] > info[i] ? 1 : -1) * (10-i)
        }
        
        return sum > 0 ? res : [-1]
    }
}
