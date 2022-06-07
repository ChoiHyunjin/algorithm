//
//  BlockGame.swift
//  Swift3
//
//  Created by choi hyunjin on 2022/03/18.
//

import Foundation

class BlockGame {
    var heights = [Int]()
    func solution(_ board:[[Int]]) -> Int {
        var count = 0
        var found = true
        var dic = [Int: [Int]]()
        for i in 0..<board.count{
            for j in 0..<board.count{
                if board[i][j] > 0 {
                    if isCorrect1(board, j, i) {
                        dic[board[i][j]] = [j, i]
                    }else if isCorrect2(board, j, i) {
                        dic[board[i][j]] = [j, i]
                    }else if isCorrect3(board, j, i) {
                        dic[board[i][j]] = [j, i]
                    }else if isCorrect4(board, j, i) {
                        dic[board[i][j]] = [j, i]
                    }else if isCorrect5(board, j, i) {
                        dic[board[i][j]] = [j, i]
                    }
                }
            }
        }
        
        var board = board
        while found {
            heights = [Int].init(repeating: 0, count: board.count)
            for j in 0..<board.count{
                for i in 0..<board.count{
                    if board[i][j] > 0 {
                        heights[j] = i
                        break
                    }
                }
            }
            
            found = false
            let keys = dic.keys
            for key in keys{
                let item = dic[key]
                let i = item![0]
                let j = item![1]
                var res = match1(&board, i, j)
                res = res || match2(&board, i, j)
                res = res || match3(&board, i, j)
                res = res || match4(&board, i, j)
                res = res || match5(&board, i, j)
                if res {
                    count += 1
                    dic.removeValue(forKey: key)
                    found = true
                    break
                }
            }
        }
        
        return count
    }
    
    func isCorrect1(_ board: [[Int]], _ x: Int, _ y: Int) -> Bool {
        guard x+2 < board.count else {return false}
        guard y+1 < board.count else { return false }
        let val = board[y][x]
        var res = true
        res = res && board[y+1][x] == val
        res = res && board[y+1][x+1] == val
        res = res && board[y+1][x+2] == val
        return res
    }
    
    func match1(_ board: inout [[Int]], _ x: Int, _ y: Int) -> Bool {
        var res = isCorrect1(board, x, y)
        res = res && heights[x+1] == y+1
        res = res && heights[x+2] == y+1
        if res {
            board[y][x] = 0
            board[y+1][x] = 0
            board[y+1][x+1] = 0
            board[y+1][x+2] = 0
        }
        return res
    }
    
    func isCorrect2(_ board: [[Int]], _ x: Int, _ y: Int) -> Bool {
        guard x > 0 else { return false }
        guard y+2 < board.count else { return false }
        let val = board[y][x]
        var res = true
        res = res && board[y+1][x] == val
        res = res && board[y+2][x] == val
        res = res && board[y+2][x-1] == val
        return res
    }
    
    func match2(_ board: inout [[Int]], _ x: Int, _ y: Int) -> Bool {
        var res = isCorrect2(board, x, y)
        res = res && heights[x-1] == y+2
        if res {
            board[y][x] = 0
            board[y+1][x] = 0
            board[y+2][x] = 0
            board[y+2][x-1] = 0
        }
        return res
    }
    
    func isCorrect3(_ board: [[Int]], _ x: Int, _ y: Int) -> Bool {
        guard x > 1 else { return false }
        guard y+1 < board.count else { return false }
        let val = board[y][x]
        var res = true
        res = res && board[y+1][x] == val
        res = res && board[y+1][x-1] == val
        res = res && board[y+1][x-2] == val
        return res
    }
    
    func match3(_ board: inout [[Int]], _ x: Int, _ y: Int) -> Bool {
        var res = isCorrect3(board, x, y)
        res = res && heights[x-1] == y+1
        res = res && heights[x-2] == y+1
        if res {
            board[y][x] = 0
            board[y+1][x] = 0
            board[y+1][x-1] = 0
            board[y+1][x-2] = 0
        }
        return res
    }
    
    func isCorrect4(_ board: [[Int]], _ x: Int, _ y: Int) -> Bool {
        guard x+1 < board.count else {return false}
        guard y+2 < board.count else { return false }
        let val = board[y][x]
        var res = true
        res = res && board[y+1][x] == val
        res = res && board[y+2][x] == val
        res = res && board[y+2][x+1] == val
        return res
    }
    
    func match4(_ board: inout [[Int]], _ x: Int, _ y: Int) -> Bool {
        var res = isCorrect4(board, x, y)
        res = res && heights[x+1] == y+2
        if res {
            board[y][x] = 0
            board[y+1][x] = 0
            board[y+2][x] = 0
            board[y+2][x+1] = 0
        }
        return res
    }
    
    func isCorrect5(_ board: [[Int]], _ x: Int, _ y: Int) -> Bool {
        guard x > 0 else { return false }
        guard x+1 < board.count else {return false}
        guard y+1 < board.count else { return false }
        let val = board[y][x]
        var res = true
        res = res && board[y+1][x] == val
        res = res && board[y+1][x+1] == val
        res = res && board[y+1][x-1] == val
        return res
    }
    
    func match5(_ board: inout [[Int]], _ x: Int, _ y: Int) -> Bool {
        var res = isCorrect5(board, x, y)
        res = res && heights[x-1] == y+1
        res = res && heights[x+1] == y+1
        if res {
            board[y][x] = 0
            board[y+1][x] = 0
            board[y+1][x+1] = 0
            board[y+1][x-1] = 0
        }
        return res
    }
}
