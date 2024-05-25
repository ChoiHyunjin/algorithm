//
//  P1971.swift
//  SwiftAlgorithm
//
//  Created by Tophy on 4/21/24.
//

import Foundation

class P1971 {
    func validPath(_ n: Int, _ edges: [[Int]], _ source: Int, _ destination: Int) -> Bool {
        var dic: [Int: [Int]] = [:]
        
        for i in 0..<n {
            dic[i] = []
        }
        
        edges.forEach { nodes in
            let a = nodes[0], b = nodes[1]
            dic[a]?.append(b)
            dic[b]?.append(a)
        }
        
        func dfs(_ node: Int) -> Bool {
            if destination == node {
                return true
            }
            
            guard let arr = dic.removeValue(forKey: node) else {
                return false
            }
            
            return arr.reduce(false) { partialResult, next in
                partialResult || dfs(next)
            }
        }
        
        return dfs(source)
    }
}
