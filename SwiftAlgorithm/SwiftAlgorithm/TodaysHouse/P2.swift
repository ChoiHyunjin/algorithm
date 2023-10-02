//
//  P2.swift
//  Swift3
//
//  Created by choi hyunjin on 2022/03/12.
//

import Foundation

class Today2 {
    func doIt(_ arr: [Int]) -> Int {
        var total = arr.count
        var dic = [Int:Int]()
        
        for item in arr {
            if dic[item] == nil {
                dic[item] = 1
            } else {
                dic[item]! += 1
            }
        }
        
        var sum = [Int]()
        
        var keys = dic.keys.sorted(by: {
            $0 < $1
        })
        func check(index: Int){
            if dic[keys[index]]! == 0 {
                dic.removeValue(forKey: keys[index])
                let idx = keys.lastIndex(of: keys[index])
                keys.remove(at: idx!)
            }
        }
        
        func getSum(_ sum:[Int]) -> Int {
            var res = 0
            for i in 0..<sum.count{
                if i & 1 == 0 {
                    if i == sum.count-1{
                        break
                    }
                    res += sum[i]
                }else {
                    res += 1
                }
            }
            return res
        }
        
        while total > 2 && keys.count > 0 {
            var height = keys.count-1
            while height > 0 && dic[keys[height]]! & 1 == 1 {
                height -= 1
            }
            if height < 0 {
                break
            }
            dic[keys[height]]! -= 2
            total -= 2
            sum.append(keys[height])
            check(index: height)
            
            var width = keys.count-1
            while dic[keys[width]]! & 1 == 0 {
                width -= 1
                if width < 0 {
                    var pairs = (total + 2) / 3
                    for i in 0..<keys.count{
                        pairs -= dic[keys[i]]!
                        if pairs <= 0 {
                            width = i
                            break
                        }
                    }
                    if width < 0 || width >= keys.count{
                        return getSum(sum)
                    }else {
                        break
                    }
                }
            }
            if keys[width] > 1 {
                dic[keys[width]]! -= 1
                total -= 1
                sum.append(keys[width])
            }
            check(index: width)
        }
        
        return getSum(sum)
    }
}
