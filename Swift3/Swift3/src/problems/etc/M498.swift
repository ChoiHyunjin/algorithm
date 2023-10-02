//
//  M498.swift
//  Swift3
//
//  Created by Tophy on 2023/04/13.
//

import Foundation

class M498 {
    func findDiagonalOrder(_ mat: [[Int]]) -> [Int] {
        let total = mat.count*mat[0].count
        var res = Array(repeating: -1, count: total)
        var count = 0
        var time = 0
        
        func getNext(_ times: Int) -> (Int, Int) {
            if times > mat.count + mat[0].count {
                return (-1, -1)
            }
            
            if times % 2 == 0 {
                var y = min(mat.count-1, times)
                var x = max(times-(mat.count-1), 0)
                return (x, y)
            } else {
                var x = min(mat[0].count-1, times)
                var y = max(times-(mat[0].count-1), 0)
                return (x, y)
            }
        }
        
        var pointer = (0, 0)
        while count < total {
            let up = (pointer.0 + pointer.1) % 2 == 0
            while pointer.1 >= 0 && pointer.0 >= 0 && pointer.0 < mat[0].count && pointer.1 < mat.count {
                res[count] = mat[pointer.1][pointer.0]
                if up {
                    pointer.0 += 1
                    pointer.1 -= 1
                } else {
                    pointer.1 += 1
                    pointer.0 -= 1
                }
                count += 1
            }
            time += 1
            pointer = getNext(time)
        }
        
        return res
    }
}
