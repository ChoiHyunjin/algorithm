//
//  Socar2.swift
//  Swift3
//
//  Created by choi hyunjin on 2022/03/17.
//

import Foundation

class Socar2 {
    func sol(_ height: [Int], _ width: [Int]) -> Int64 {
        var dic = [Int: Int]()
        var widthTemp = 0
        for i in 0..<height.count{
            let h = height[i]
            if dic[h] == nil {
                dic[h] = width[i]
            } else {
                dic[h]! += width[i]
            }
            widthTemp += width[i]
        }
        
        let keys = dic.keys.sorted()
        var res : Int64 = 0
        
        for h in keys {
            res = max(res, Int64(h * widthTemp))
            widthTemp -= dic[h]!
        }
        
        return res
    }
}
