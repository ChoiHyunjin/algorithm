//
//  M1249.swift
//  SwiftAlgorithm
//
//  Created by Tophy on 4/6/24.
//

import Foundation

class M1249 {
    func minRemoveToMakeValid(_ s: String) -> String {
        var stack: [String] = []
        var res = ""
        
        var temp = ""
        for c in s {
            switch c {
            case "(":
                stack.append(temp)
                temp = ""
            case ")":
                if let pop = stack.popLast() {
                    temp = pop + "(\(temp))"
                }
            default:
                temp += "\(c)"
            }
        }
        
        return stack.joined() + temp
    }
}
