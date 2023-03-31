//
//  M390.swift
//  Swift3
//
//  Created by Tophy on 2023/03/31.
//

import Foundation
class M390 {
    func lastRemaining(_ n: Int) -> Int {
        var step = 1
        var head = 0
        var count = n
        var fromFirst = true
        
        while count > 1 {
            if fromFirst || count % 2 == 1 {
                head += step
            }
            step *= 2
            fromFirst = !fromFirst
            count = (count - count % 2) / 2
        }
        
        return head
    }
}
