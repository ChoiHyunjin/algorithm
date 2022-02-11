//
//  424.swift
//  Swift3
//
//  Created by choi hyunjin on 2022/01/24.
//

import Foundation
class P424 {
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        let charArr = Array(s)
        
        var left = 0
        var right = 1
        while right < charArr.count{
            let res = self.check(charArr, k, left: left, right: right)
            if res>=0 {
                right += res+1
                left += 1
            }else {
                left += 1
                right += 1
            }
        }
    
        return right - left + 1
        
    }
    
    func check(_ charArr:[Character], _ k:Int, left: Int, right:Int) -> Int{
        var res = true
        var count = k
        for i in left...left+k{
            count = k
            res = true
            let char = charArr[i]
            for j in left..<right{
                if charArr[j] != char{
                    if count > 0 {
                        count -= 1
                    }else{
                        res = false
                        break
                    }
                }
            }
            if res {
                break
            }
        }
        
        return count
    }
}
