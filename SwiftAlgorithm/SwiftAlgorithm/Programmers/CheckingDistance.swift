//
//  CheckingDistance.swift
//  Swift3
//
//  Created by choi hyunjin on 2022/03/14.
//

import Foundation

class CheckDistance {
    func solution(_ places:[[String]]) -> [Int] {
        var answers = [Int].init(repeating: 0, count: places.count)
        
        for i in 0..<places.count {
            answers[i] = calculate(places[i])
        }
        
        return answers
    }
    
    func calculate(_ place: [String]) -> Int {
        var pos = [[Int]]()
        var map = [[Character]]()
        
        for i in 0..<place.count{
            let row = Array(place[i])
            map.append(row)
            for j in 0..<row.count{
                if row[j] == "P" {
                    pos.append([i, j])
                }
            }
        }
        
        for j in 0..<pos.count{
            var tempMap = map
            if !dfs(&tempMap, pos[j], 3) {
                return 0
            }
        }
        
        return 1
    }
    
    func dfs(_  map: inout [[Character]],_ pos:[Int], _ count:Int) -> Bool {
        guard count > 0 else { return true }
        guard pos[0] >= 0 else { return true }
        guard pos[1] >= 0 else { return true }
        guard pos[0] < 5 else { return true }
        guard pos[1] < 5 else { return true }
        guard map[pos[0]][pos[1]] != "X" else { return true }
        if count < 3 && map[pos[0]][pos[1]] == "P"{
            return false
        }
        map[pos[0]][pos[1]] = "X"
        var res = dfs(&map, [pos[0]-1, pos[1]], count-1)
        res = res && dfs(&map, [pos[0]+1, pos[1]], count-1)
        res = res && dfs(&map, [pos[0], pos[1]-1], count-1)
        res = res && dfs(&map, [pos[0], pos[1]+1], count-1)
        return res
    }
}
