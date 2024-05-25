//
//  M1638.swift
//  SwiftAlgorithm
//
//  Created by Tophy on 4/6/24.
//

import Foundation

class M1638 {
    
    func countSubstrings(_ s: String, _ t: String) -> Int {
        var res = 0
        var map: [[Bool]] = []
        
        var set: Set<String> = []
        
        func isIn(_ x: Int, _ y: Int) -> Bool {
            return x >= 0 && x < s.count && y >= 0 && y < t.count
        }
        
        func getKey(_ i: Int, _ j: Int) -> String {
            return "\(i),\(j)"
        }
        
        for (i, c1) in s.enumerated() {
            map.append([])
            for (j, c2) in t.enumerated() {
                map[i][j] = c1 != c2
                if c1 != c2 {
                    res += 1
                }
            }
        }
        
        for i in 0..<s.count {
            for j in 0..<t.count {
                if map[i][j] {
                    continue
                }
                
                var count = 0
                var zeroCount = 0
                var i2 = i + 1
                var j2 = j + 1
                while zeroCount < 2 && isIn(i2, j2) {
                    if map[i2][j2] {
                        zeroCount = 1
                    }
                }
            }
        }
        return res
    }
}
