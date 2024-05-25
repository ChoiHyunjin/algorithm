//
//  M678.swift
//  SwiftAlgorithm
//
//  Created by Tophy on 4/7/24.
//

import Foundation

class M678 {
    func checkValidString(_ s: String) -> Bool {
        var joker: [Int] = []
        var left: [Int] = []
        
        for (i, c) in s.enumerated() {
            switch c {
            case "(":
                left.append(i)
                
            case ")":
                if let pop = left.popLast() {
                    break
                } else if let pop = joker.popLast() {
                    break
                }
                return false
                
            case "*":
                joker.append(i)
                
            default:
                break
            }
        }
        
        if left.count > joker.count {
            return false
        }
        
        while left.count > 0 {
            guard let l = left.popLast() else {
                break
            }
            guard let j = joker.popLast() else {
                return false
            }
            if l > j {
                return false
            }
        }
        
        return true
    }
}

// ****((*(((((**(**)
