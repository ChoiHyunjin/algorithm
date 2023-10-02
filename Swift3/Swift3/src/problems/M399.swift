//
//  M399.swift
//  Swift3
//
//  Created by Tophy on 2023/04/01.
//

import Foundation

private class Solution {
    func calcEquation(_ equations: [[String]], _ values: [Double], _ queries: [[String]]) -> [Double] {
        var dics: [Dictionary<String, Double>] = []
        var set = Set<Int>()
        var times = equations.count
        
        func visitedAt(_ i: Int) -> Void {
            set.insert(i)
            times = 0
        }
        
        var i = 0
        var dic = Dictionary<String, Double>()
        dics.append(dic)
        while set.count < equations.count {
            let v1 = equations[i][0]
            let v2 = equations[i][1]
            if set.contains(i) {
                i = (i + 1) % equations.count
                continue
            }
            if let res = dic[v1] {
                dic[v2] = res / values[i]
                visitedAt(i)
            } else if let res = dic[v2] {
                dic[v1] = values[i] * res
                visitedAt(i)
            } else if times >= equations.count {
                dic = Dictionary<String, Double>()
                dics.append(dic)
                dic[v1] = values[0]
                dic[v2] = 1
                visitedAt(0)
            } else {
                i = (i + 1) % equations.count
                times += 1
            }
        }
        
        return queries.map({ (q: [String]) in
            guard let dic = dics.first(where: { (item: Dictionary<String, Double>) in
                return item.contains { (key: String, value: Double) in
                    return key == q[0]
                }
            }) else {
                return -1.0
            }
            
            guard let v1 = dic[q[0]], let v2 = dic[q[1]] else {
                return -1.0
            }
            return v1 / v2
        })
    }
}
