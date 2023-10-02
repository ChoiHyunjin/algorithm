//
//  E1832.swift
//  Swift3
//
//  Created by Tophy on 2023/03/29.
//

import Foundation

class E1832 {
    func checkIfPangram(_ sentence: String) -> Bool {
        if(sentence.count < 26){
            return false
        }
        let aAscii = Int(Character("a").asciiValue!)
        var map = Array(repeating: false, count: 26)
        
        for char in sentence{
            let index = Int(char.asciiValue!) - aAscii
            map[index] = true
        }
        
        
        return map.reduce(true, {result, item in
            return result && item
        })
    }

}
