//
//  P79.swift
//  Swift3
//
//  Created by choi hyunjin on 2022/01/22.
//

import Foundation

class P79 {
    var copiedBoard : [[Character]] = []
    
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        self.copiedBoard = Array.init(repeating: [], count: board.count)
        for i in 0..<board.count{
            self.copiedBoard[i] = Array.init(repeating: "a", count: board[0].count)
        }
        
        for i in 0..<board.count{
            for j in 0..<board[0].count{
                self.copiedBoard[i][j] = board[i][j]
            }
        }
        
        
        for i in 0..<board.count{
            for j in 0..<board[0].count{
                if word.hasPrefix(String(board[i][j])){
                    if word.count == 1 {
                        return true
                    }
                    let char = board[i][j]
                    self.copiedBoard[i][j] = "0"
                    let sub = word[word.startIndex...]
                    let res = self.dfs(i, j, self.getSubString(sub))
                    if res {
                        return true
                    }else {
                        self.copiedBoard[i][j] = char
                    }
                }
            }
        }
        return false
    }
                        
    func dfs(_ i:Int, _ j:Int, _ word: Substring) -> Bool {
        var res = false
        if i>0 {
            res = dfsNext(i-1, j, word)
            if res {
                return true
            }
        }
        if j>0 {
            res = dfsNext(i, j-1, word)
            if res {
                return true
            }
        }
        if i<self.copiedBoard.count-1 {
            res = dfsNext(i+1, j, word)
            if res {
                return true
            }
        }
        if j<self.copiedBoard[0].count-1 {
            res = dfsNext(i, j+1, word)
            if res {
                return true
            }
        }
        return res
    }
    
    func dfsNext(_ i:Int, _ j:Int, _ word:Substring) -> Bool {
        let char = self.copiedBoard[i][j]
        if self.copiedBoard[i][j] == "0" || word.firstIndex(of: char) != word.startIndex{
            return false
        }
        if word.count == 1 {
            return true
        }
        self.copiedBoard[i][j] = "0"
        let res = dfs(i, j, self.getSubString(word))
        if !res{
            self.copiedBoard[i][j] = char
        }
        return res
    }
    
    func getSubString(_ word: Substring) -> Substring{
        return word[word.index(after:word.startIndex)...]
    }
}
