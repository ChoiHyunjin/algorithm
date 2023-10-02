//
//  M386.swift
//  Swift3
//
//  Created by Tophy on 2023/03/31.
//

import Foundation

class M386 {
    func lexicalOrder(_ n: Int) -> [Int] {
        var res:[[Character]] = []
        
        for i in 0..<n {
            res.append(Array(String(i + 1)))
        }
        
        return res.sorted(by: {
            return sort($0, $1, 0)
        }).map({
            return Int(String($0))!
        })
    }
    
    func sort(_ arr1: [Character], _ arr2: [Character], _ pointer: Int) -> Bool {
        guard pointer < arr1.count else {
            return true
        }
        guard pointer < arr2.count else {
            return false
        }
        return arr1[pointer] == arr2[pointer] ? sort(arr1, arr2, pointer+1) : arr1[pointer] < arr2[pointer]
    }
}
