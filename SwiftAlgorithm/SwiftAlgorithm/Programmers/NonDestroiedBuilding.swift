//
//  NonDestoriedBuilding.swift
//  Swift3
//
//  Created by choi hyunjin on 2022/03/15.
//

import Foundation

class NonDestroiedBuilding {
    /*
     누적합 풀이
     */
    func solution(_ board:[[Int]], _ skills:[[Int]]) -> Int {
        var res = 0
        
        var newBoard = Array.init(repeating: Array.init(repeating: 0, count: board[0].count+1), count: board.count+1)
        for skill in skills {
            let damage = skill[0]>1 ? skill[5] : -skill[5]
            newBoard[skill[1]][skill[2]] += damage
            newBoard[skill[1]][skill[4]+1] += -damage
            newBoard[skill[3]+1][skill[2]] += -damage
            newBoard[skill[3]+1][skill[4]+1] += damage
        }
        
        for i in 0..<board.count{
            for j in 0..<board[0].count{
                newBoard[i][j] += (j>0 ? newBoard[i][j-1] : 0)
            }
        }
        
        for i in 0..<board.count{
            for j in 0..<board[0].count{
                newBoard[i][j] += (i>0 ? newBoard[i-1][j] : 0)
            }
        }
        
        for i in 0..<board.count{
            for j in 0..<board[0].count{
                newBoard[i][j] += board[i][j]
                res += newBoard[i][j] > 0 ? 1 : 0
            }
        }
        
        return res
    }
    
    /*
     brute force
     */
    func solution2(_ board:[[Int]], _ skills:[[Int]]) -> Int {
        var res = board.count * board[0].count
        
        var board = board
        for skill in skills {
            let damage = skill[0]>1 ? skill[5] : -skill[5]
            for i in skill[1]...skill[3]{
                for j in skill[2]...skill[4]{
                    let destroied = board[i][j] <= 0
                    board[i][j] += damage
                    if destroied != (board[i][j] <= 0) {
                        res += destroied ? 1 : -1
                    }
                }
            }
        }
        
        return res
    }
}
