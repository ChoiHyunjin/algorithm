//
//  bucketplace.swift
//  Swift3
//
//  Created by Tophy on 2023/04/20.
//

import Foundation

class Test {
    func getCards(_ inputs: [Int]) -> Int {
        var dic: Dictionary<Int, Int> = Dictionary()
        var res = -1
        
        for i in 0..<inputs.count {
            let card = inputs[i]
            if let index = dic[card] {
                if res == -1 {
                    res = i-index+1
                } else {
                    res = min((i-index)+1, res)
                }
            }
            dic[card] = i
        }

        return res
    }
}
