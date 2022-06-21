//
//  File.swift
//  
//
//  Created by choi hyunjin on 2022/01/09.
//

import Foundation

class P139{
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
//        func helper(_ s: [String], _ wordDict: ){
//
//        }
        var res = false
        for word in wordDict{
            if word == s {
                res = true
                break
            }
                // 1. 있는지 확인
            if s.contains(word){
                    // 2. split
                
                let strings : [String] = self.split(s, word: word).map(String.init)
                // 3. recursive
                for subString in strings{
                    let tempRes = self.wordBreak(subString, wordDict)
                    if tempRes {
                        res = true
                        break
                    }
                }
            }
            if res {
                break
            }
        }
        return res
        // 4-1. return 이 false면 break
        // 4-2. true면 모두 실행
        // 5. 하나라도 false면 return false
        // 6. return true
    }
    
    func split(_ s: String, _ word: String) -> [String]{
        var i: String.Index? = s.startIndex
        var j: String.Index
        var string = s
        while i != nil && i!<string.endIndex {
            i = string.firstIndex(of: word.first!)
            if i != nil {
                j = i!
                for ch in word{
                    let temp = string.index(after: j)
                    if ch == string[temp]{
                        j = temp
                    }
                }
                if j == string.index(i!, offsetBy: word.count){
                    break
                }else{
                    string = String(string[string.startIndex...i!])
                }
            }
        }
        if i == nil {
            return [s]
        }else {
            return [String(s[s.startIndex..<i!]), String(s[s.index(after: j)..<s.endIndex])]
        }
    }

}
