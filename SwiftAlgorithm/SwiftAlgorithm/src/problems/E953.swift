//
//  E953.swift
//  Swift3
//
//  Created by Tophy on 2023/04/15.
//

import Foundation

class E953 {
    func isAlienSorted(_ words: [String], _ order: String) -> Bool {
        var dic: Dictionary<Character, Int> = Dictionary()
        for (index, char) in order.enumerated() {
            dic[char] = index
        }
        
        func checkSort(_ word1: String, _ word2: String) -> Bool {
            var ptr = 0
            var char1 = Array(word1)
            var char2 = Array(word2)
            
            while res && ptr < char1.count && ptr < char2.count {
                guard let order1 = dic[char1[ptr]] else {
                    return true
                }
                guard let order2 = dic[char2[ptr]] else {
                    return false
                }
                if order1 != order2 {
                    return order1 < order2
                }
                ptr += 1
            }
            return char1.count <= char2.count
        }
        
        var res = true
        
        for i in 0..<words.count-1 {
            res = res && checkSort(words[i], words[i+1])
        }
        return res
    }
}
