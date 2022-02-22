//
//  P712.swift
//  Swift3
//
//  Created by choi hyunjin on 2022/01/22.
//

import Foundation

class P712{
    func minimumDeleteSum(_ s1: String, _ s2: String) -> Int {
        let arr1 = Array(s1).map({char in
            return Int(char.asciiValue!)
        })
        let arr2 = Array(s2).map({char in
            return Int(char.asciiValue!)
        })
        
        let sum = arr1.reduce(0, {prev, num in
            return prev + num
        }) + arr2.reduce(0, {prev, num in
            return prev + num
        })

        var map = Array.init(repeating: Array.init(repeating: sum, count: s1.count+1), count: s2.count+1)

        for i in 1...arr2.count{
            for j in 1...arr1.count{
                map[i][j] = min(map[i-1][j], map[i][j-1])
                let ch1 = arr1[j-1]
                let ch2 = arr2[i-1]
                if ch1 == ch2{
                    let ascii = ch1
                    map[i][j] = min(map[i-1][j-1]-ascii*2, map[i][j])
                }
            }
        }
        return map[s2.count][s1.count]
    }
}
