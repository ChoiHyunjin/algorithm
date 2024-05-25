//
//  P2304.swift
//  SwiftAlgorithm
//
//  Created by Tophy on 4/21/24.
//

import Foundation

class P2304 {
    func minPathCost2(_ grid: [[Int]], _ moveCost: [[Int]]) -> Int {
        var costs = Array(repeating: 0, count: grid[0].count)
        
        func getCosts(_ row: [Int]) -> [Int] {
            var result = Array(repeating: Int.max, count: row.count)
            for cell in row {
                moveCost[cell].enumerated().forEach { (k, cost) in
                    result[k] = min(cell + cost, result[k])
                }
            }
            
            return result
        }
        
        for (i, row) in grid.enumerated() {
            if i == grid.count-1 {
                break
            }
            
            var costsAtRow = getCosts(row)
            
            for i in 0..<costs.count {
                costs[i] += costsAtRow[i]
            }
        }
        
        return costs.enumerated().reduce(Int.max) { result, cost in
            let (i, value) = cost
            guard let last = grid.last else {
                return 0
            }
            
            return min(result, value + last[i])
        }
    }
    
    func minPathCost(_ grid: [[Int]], _ moveCost: [[Int]]) -> Int {
        var dp = Array(repeating: Array(repeating: Int.max, count: grid[0].count), count: grid.count)
        grid[0].enumerated().forEach { (i, v) in
            dp[0][i] = 0
        }
        
        var result = Int.max
            
        for i in 0..<grid.count {
            grid[i].enumerated().forEach { (j, node) in
                if i == grid.count-1 {
                    result = min(dp[i][j] + node, result)
                    return
                }
                
                moveCost[node].enumerated().forEach { (k, cost) in
                    dp[i+1][k] = min(dp[i+1][k], node + cost + dp[i][j])
                }
            }
        }
        
        print(dp)
        return result
    }
}

//[[28,35,29,5,13,17,18,23,14],[30,15,12,27,2,26,25,19,7],[1,16,34,21,9,3,20,24,8],[4,33,22,11,31,0,6,10,32]]
//[[87,46,11,33,55,26,26,56,23],[77,56,72,49,35,18,37,66,37],[54,40,62,1,64,49,95,81,77],[80,7,76,71,91,67,75,84,52],[65,11,13,15,9,34,10,98,20],[1,95,100,61,33,47,28,100,44],[39,56,94,7,64,91,66,34,70],[37,99,62,7,23,78,74,89,97],[84,41,63,42,84,15,46,31,11],[60,36,27,25,37,18,4,90,43],[35,83,90,37,91,27,61,99,53],[85,2,98,99,67,70,38,91,68],[66,46,7,99,26,81,95,51,51],[41,96,66,84,61,73,78,28,63],[38,34,49,55,35,29,93,5,28],[3,30,80,20,23,10,93,40,33],[8,86,47,15,45,84,47,19,58],[72,5,76,82,60,50,13,74,38],[4,8,25,38,29,4,60,81,21],[65,50,74,32,9,47,71,55,14],[90,30,92,51,45,51,4,85,22],[30,56,1,45,63,72,91,73,60],[51,61,53,49,44,99,11,5,3],[24,54,91,11,5,30,50,89,44],[87,97,46,92,93,41,64,73,15],[94,76,90,80,30,9,88,8,33],[50,34,4,63,49,90,46,55,16],[10,46,80,21,97,69,70,85,31],[10,66,74,43,65,45,85,34,91],[82,26,77,10,2,5,89,39,4],[80,70,89,73,54,61,100,89,23],[30,66,80,51,3,34,92,100,63],[74,15,4,33,37,3,87,76,92],[44,43,77,99,27,1,23,10,8],[8,74,17,35,31,84,97,98,34],[99,9,28,43,55,39,93,64,93]]
