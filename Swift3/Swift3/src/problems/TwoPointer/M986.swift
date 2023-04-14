//
//  M986.swift
//  Swift3
//
//  Created by Tophy on 2023/04/15.
//

import Foundation

class M986 {
    func intervalIntersection(_ firstList: [[Int]], _ secondList: [[Int]]) -> [[Int]] {
        var ptr1 = 0
        var ptr2 = 0
        var index = 0
        var res: [[Int]] = []
        
        var temp: [Int]
        while ptr1 < firstList.count && ptr2 < secondList.count {
            temp = [max(firstList[ptr1][0], secondList[ptr2][0]), min(firstList[ptr1][1], secondList[ptr2][1])]
            index = temp[1]
            if temp[0] < temp[1] {
                res.append(temp)
            }
            
            if firstList[ptr1][1] == index {
                ptr1 += 1
            }
            if secondList[ptr2][1] == index {
                ptr2 += 1
            }
        }
        
        return res
    }
}
