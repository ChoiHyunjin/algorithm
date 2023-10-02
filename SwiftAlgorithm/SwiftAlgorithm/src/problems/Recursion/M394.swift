//
//  M394.swift
//  Swift3
//
//  Created by Tophy on 2023/03/31.
//

import Foundation

class M394 {
    func decodeString(_ s: String) -> String {
        let charArr = Array(s)
        
        func getString(_ start: Int) -> (String, Int) {
            var res = ""
            var index = start
            var count = ""
            
            while index < charArr.count{
                let char = charArr[index]
                if char == "]" {
                    break
                } else if char == "[" {
                    let result = getString(index+1)
                    index = result.1
                    for _ in 0..<Int(String(count))! {
                        res += result.0
                    }
                    count = ""
                } else if char.isNumber {
                    count += String(char)
                } else {
                    res += String(charArr[index])
                }
                index += 1
            }
            
            return (res, index)
        }
        
        return getString(0).0
    }
}
