//
//  JewelryShopping.swift
//  Swift3
//
//  Created by choi hyunjin on 2022/03/11.
//

import Foundation

class JewelryShopping {
    func solution(_ gems:[String]) -> [Int] {
        var dic : [String: Int] = [:]
        for gem in gems{
            dic[gem] = 0
        }
        let keys = dic.keys
        for i in 0..<keys.count{
            let gem = gems[i]
            dic[gem]! += 1
        }
        var head = keys.count-1
        var end = 0
        var res = [Int].init(repeating: 1, count: 2)
        var hasAnswer = false
        res[1] = gems.count
        while head >= end + keys.count-1 && head < gems.count {
            if dic[gems[head]]! > 1 || dic.values.contains(0){
                head += 1
                guard head < gems.count else {break}
                dic[gems[head]]! += 1
                if hasAnswer {
                    dic[gems[end]]! -= 1
                    end += 1
                }
            } else {
                if head - end < res[1] - res[0]{
                    res[1] = head + 1
                    res[0] = end + 1
                } else if head - end == res[1] - res[0] && end+1 < res[0]{
                    res[1] = head + 1
                    res[0] = end + 1
                }
                hasAnswer = true
                dic[gems[end]]! -= 1
                end += 1
                if head < end + keys.count{
                    break
                }
                while end+1 < head && gems[end] == gems[end+1]{
                    dic[gems[end]]! -= 1
                    end += 1
                }
            }
        }
        
        return res
    }
}
