//
//  E1337.swift
//  Swift3
//
//  Created by Tophy on 2023/03/31.
//

import Foundation

class E1337 {
    func kWeakestRows(_ mat: [[Int]], _ k: Int) -> [Int] {
        var dic = Dictionary<Int, Int>()
        
        for (index, row) in mat.enumerated(){
            dic[index] = getSoldiers(row)
        }
        
        return Array(dic.keys.sorted(by: {
            if dic[$0] == dic[$1] {
                return $0 < $1
            }
            return dic[$0]! < dic[$1]!
        }).prefix(k))
    }
    
    func getSoldiers(_ row: [Int]) -> Int {
        return row.reduce(0, {
            return $0 + $1
        })
    }
}
