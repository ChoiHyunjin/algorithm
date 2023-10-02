//
//  P1.swift
//  CodingTest
//
//  Created by choi hyunjin on 2022/03/17.
//

import Foundation

class Socar1 {
    func solution(_ rect: [[Int]]) -> [String] {
        var res = [String]()
        
        var width = rect[0][3]
        var height = rect[0][4]
        var rect = rect.sorted(by: {
            width = max(width, $1[2])
            height = max(height, $1[3])
            return $0[1] <= $1[1]
        })
        
        let heights = [Int].init(repeating: 0, count: width)
        
        for r in rect {
            let height = getMaxValue(in: r[0]...r[2], heights)
            r[3] -= height
            r[1] = height
            for i in r[0]...r[2]{
                heights[i] = r[3]
            }
        }
        
        var widths = [Int].init(repeating: 0, count: height)
        
        for r in rect {
            let width = getMaxValue(in: r[1]...r[3], widths)
            r[2] -= width
            r[0] = width
            for i in r[1]...r[3]{
                widths[i] = r[2]
            }
        }
        
        return res
    }
    
    func getMaxValue(in range: Range, _ list:[Int]) -> Int {
        var res = 0
        for i in range{
            res = max(res, list[i])
        }
        return res
    }
}
