//
//  TeamPhoto.swift
//  Swift3
//
//  Created by choi hyunjin on 2022/03/16.
//

import Foundation

class Tuple {
    func solution(_ s:String) -> [Int] {
        var res = [Int]()
        var dic = [Int:[Int]]()
        
        var count = 0
        let chars = s.split(separator: "}")
        for i in 0..<chars.count{
            if chars[i] == "" {
                continue
            }
            let arr = getArray(chars[i])
            dic[arr.count] = arr
            count = max(count, arr.count)
        }
        
        res.append(dic[1]![0])
        if dic.count < 2 {
            return res
        }
        for i in 2...count{
            for num in dic[i]! {
                if !res.contains(num){
                    res.append(num)
                    break
                }
            }
        }
        
        return res
    }
    
    func getArray(_ str: Substring) -> [Int] {
        var res = [Int]()
        
        var temp = ""
        let chars = Array(str)
        for char in chars{
            switch char{
            case "{":
                break
            case ",":
                if temp != "" {
                    res.append(Int(temp)!)
                    temp = ""
                }
                break
            case "}":
                break
            default:
                temp += String(char)
                break
            }
            
        }
        if temp != "" {
            res.append(Int(temp)!)
        }
        
        return res
    }
}
