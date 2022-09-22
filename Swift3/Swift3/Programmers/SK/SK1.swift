//
//  SK1.swift
//  Swift3
//
//  Created by choi hyunjin on 2022/03/19.
//

import Foundation

//  "pencil","cilicon","contrabase","picturelist"
class SK1 {
    func sol(_ inputs: [String]) -> [String]{
        var result = [String]()
        for i in 0..<inputs.count{
            let input = inputs[i]
            
            var set = Set<String>()
            for j in 1..<input.count{
                set = makeSet(input, j)
                
                var res = false
                for k in 0..<inputs.count{
                    if k == i {
                        continue
                    }
                    var set2 = set
                    for str in set2 {
                        res = hasString(inputs[k], str)
                        if res {
                            set.remove(str)
                        }
                    }
                }
                if set.count > 0 {
                    break
                }
            }
            if set.count == 0 {
                result.append("None")
            }else {
                result.append(set.joined(separator: " "))
            }
        }
        return result
    }
    
    func makeSet(_ input: String, _ length: Int) -> Set<String>{
        var res = Set<String>()
        
        for i in 0...input.count - length{
            let start = input.index(input.startIndex, offsetBy: i)
            let end = input.index(input.startIndex, offsetBy: i+length-1)
            res.insert(String(input[start...end]))
        }
        return res
    }
    
    func hasString(_ string: String,_ sub: String) -> Bool {
        guard string.count >= sub.count else {return false}
        let charArr = Array(string)
        let subArr = Array(sub)
        var res = true
        for i in 0...charArr.count-subArr.count{
            for j in 0..<subArr.count{
                res = charArr[i+j] == subArr[j]
                if !res {
                    break
                }
            }
            if res {
                break
            }
        }
        return res
    }
}
