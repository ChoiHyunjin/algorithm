//
//  MenuRenewer.swift
//  Swift3
//
//  Created by choi hyunjin on 2022/03/11.
//

import Foundation

class MenuRenewer{
    func solution(_ orders:[String], _ course:[Int]) -> [String] {
        var res = [String]()
        let sortedOrders = orders.sorted(by: {
            $0.count < $1.count
        })
        
        for i in 0..<sortedOrders.count {
            for j in i..<sortedOrders.count{
                let str = getMax(sortedOrders[i], sortedOrders[j])
                for idx in stride(from: course.count-1, to: -1, by: -1){
                    if str.count == course[idx]{
                        res.append(str)
                        break
                    }
                }
            }
        }
        
        return res
    }
    
    func getMax(_ str1: String, _ str2: String) -> String {
        let aAscii = Int(Character("A").asciiValue!)
        var flags = [Int].init(repeating: 0, count: 26)
        let arr1 = Array(str1)
        let arr2 = Array(str2)
        
        var res = ""
        for char in arr1 {
            let ascii = Int(char.asciiValue!) - aAscii
            flags[ascii] += 1
        }
        for char in arr2 {
            let ascii = Int(char.asciiValue!) - aAscii
            if flags[ascii] > 0 {
                res += String(char)
            }
            flags[ascii] = 0
        }
        return res
    }
}
