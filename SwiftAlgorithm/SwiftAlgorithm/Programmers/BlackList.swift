//
//  BlackList.swift
//  Swift3
//
//  Created by choi hyunjin on 2022/03/16.
//

import Foundation

class BlackList {
    func solution(_ user_id:[String], _ banned_id:[String]) -> Int {
        var banned = [[String]]()
        for banned_id in banned_id {
            banned.append(getMaskedList(user_id, banned_id))
        }
        
        var res = Set<Set<String>>()
        var list = Set<String>()
        dfs(banned, &res, &list)
        
        return res.count
    }
    
    func getMaskedList(_ user_id:[String], _ banned_id:String) -> [String] {
        var res = [String]()
        
        let chars = Array(banned_id)
        for user in user_id{
            if user.count != banned_id.count{
                continue
            }
            let userChar = Array(user)
            var isMasked = true
            for i in 0..<chars.count{
                if chars[i] != "*" && chars[i] != userChar[i]{
                    isMasked = false
                    break
                }
            }
            if isMasked {
                res.append(user)
            }
        }
        
        return res
    }
    
    func dfs(_ banned: [[String]], _ result: inout Set<Set<String>>, _ list: inout Set<String>){
        let ptr = list.count
        guard ptr < banned.count else {
            let list = list
            result.insert(list)
            return
        }
        
        for ban in banned[ptr] {
            if !list.contains(ban){
                list.insert(ban)
                dfs(banned, &result, &list)
                list.remove(ban)
            }
        }
    }
}
