//
//  P417.swift
//  Swift3
//
//  Created by choi hyunjin on 2022/05/11.
//

import Foundation

class P417 {
    
    func pacificAtlantic(_ heights: [[Int]]) -> [[Int]] {
        var res = [[Int]]()
        
        var pacificMap = Array.init(repeating: Array.init(repeating: true, count: heights[0].count), count: heights.count)
        var atlanticMap = Array(pacificMap)
        
        for i in 1..<pacificMap.count{
            for j in 1..<pacificMap[0].count{
                pacificMap[i][j] =
                    ( pacificMap[i][j-1] && couldFlowLeft(heights[i][j-1], heights[i][j]) ) ||
                    ( pacificMap[i-1][j] && couldFlowTop(heights[i-1][j], heights[i][j]) )
            }
        }
        for i in stride(from: atlanticMap.count-2, to: -1, by: -1){
            for j in stride(from: atlanticMap[0].count-2, to: -1, by: -1){
                atlanticMap[i][j] =
                    ( atlanticMap[i][j+1] && couldFlowRight(heights[i][j], heights[i][j+1]) ) ||
                    ( atlanticMap[i+1][j] && couldFlowBottom(heights[i][j], heights[i+1][j]) )
            }
        }
        
        for pacific in pacificMap{
            debugPrint("pacificMap: \(pacific)")
        }
        for pacific in atlanticMap{
            debugPrint("atlanticMap: \(pacific)")
        }
        
        for i in 0..<pacificMap.count{
            for j in 0..<pacificMap[0].count{
                if pacificMap[i][j] && atlanticMap[i][j] {
                    res.append([i, j])
                }
            }
        }
        
        return res
    }
    
    func pacificAtlantic2(_ heights: [[Int]]) -> [[Int]] {
        var set = Set<[Int]>()
        
        for i in 0..<heights.count{
            for j in 0..<heights.count{
                if j == 0 {
                    set.insert([i,j])
                    continue
                }
                if couldFlowLeft(heights[i][j-1], heights[i][j]){
                    set.insert([i,j])
                }else {
                    break
                }
            }
        }
        
        for j in 0..<heights.count{
            for i in 0..<heights.count{
                if i == 0 {
                    set.insert([i,j])
                    continue
                }
                if couldFlowTop(heights[i-1][j], heights[i][j]){
                    set.insert([i,j])
                }else {
                    break
                }
            }
        }
        
        debugPrint("set: \(set)")
        var res = [[Int]]()
        for pos in set{
            var possible = true
            for i in pos[1]..<heights.count-1{
                possible = couldFlowRight(heights[pos[0]][i], heights[pos[0]][i+1])
                if !possible{
                    break
                }
            }
            if possible {
                res.append(pos)
                continue
            }
            possible = true
            for i in pos[0]..<heights.count-1{
                possible = couldFlowBottom(heights[i][pos[1]], heights[i+1][pos[1]])
                if !possible{
                    break
                }
            }
            if possible {
                res.append(pos)
                continue
            }
        }
        
        return res
    }
    
    func couldFlowLeft(_ left: Int, _ right: Int) -> Bool {
        return left <= right
    }
    
    func couldFlowTop(_ up: Int, _ down: Int) -> Bool {
        return up <= down
    }
    
    func couldFlowRight(_ left: Int, _ right: Int) -> Bool {
        return left >= right
    }
    
    func couldFlowBottom(_ up: Int, _ down: Int) -> Bool {
        return up >= down
    }
}
