//
//  M397.swift
//  Swift3
//
//  Created by Tophy on 2023/04/01.
//

import Foundation

private class Solution {
    func integerReplacement(_ n: Int) -> Int {
        var dic = Dictionary<Int, Int>()
        
        func dfs(_ n: Int) -> Int {
            if let res = dic[n] {
                return res
            }
            if n == 1 {
                return 0
            }
            
            let res = ( n%2 == 1 ? min(dfs(n+1), dfs(n-1)): dfs(n/2) ) + 1
            dic[n] = res
            return res
        }
        
        return dfs(n)
    }
}
