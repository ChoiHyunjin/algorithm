//
//  B14494.swift
//  SwiftAlgorithm
//
//  Created by Tophy on 2023/10/02.
//

import Foundation

let divider = 1_000_000_007
func solve(_ x: Int, _ y:Int) {
    var map = Array(repeating: Array(repeating: 1, count: x), count: y)
    
    for i in 1..<y {
        for j in 1..<x {
            map[i][j] = (map[i][j-1] + map[i-1][j] + map[i-1][j-1]) % divider
        }
    }
    
    print(map[y-1][x-1])
}

let inputs = readLine()!.split(separator: " ")
//solve(Int(inputs[0]) ?? 0, Int(inputs[1]) ?? 0)
