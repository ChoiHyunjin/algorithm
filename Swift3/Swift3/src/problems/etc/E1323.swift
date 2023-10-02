//
//  E1323.swift
//  Swift3
//
//  Created by Tophy on 2023/03/29.
//

import Foundation

class E1323 {
    func maximum69Number (_ num: Int) -> Int {
        let strNum = Array(String(num))
        var res = ""
        var isChanged = false
        for (index, char) in strNum.enumerated() {
            if char == "6" && !isChanged {
                res += "9"
                isChanged = true
            }else {
                res += String(strNum[index])
            }
        }
        return Int(res) ?? 0
    }
}
