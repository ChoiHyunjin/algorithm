//
//  E1331.swift
//  Swift3
//
//  Created by Tophy on 2023/03/29.
//

import Foundation

class E1331 {
    func arrayRankTransform(_ arr: [Int]) -> [Int] {
        var dic = Dictionary<Int, [Int]>()
        var res = Array(repeating: -1, count: arr.count)
        
        for (index, number) in arr.enumerated() {
            if dic[number] == nil {
                dic[number] = []
            }
            dic[number]?.append(index)
        }
        
        let keys = dic.keys.sorted()
        for (index, number) in keys.enumerated() {
            for item in dic[number]! {
                res[item] = index+1
            }
        }
        
        return res
    }
}
