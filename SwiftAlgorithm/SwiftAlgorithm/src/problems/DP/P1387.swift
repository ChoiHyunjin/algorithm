//
//  P1387.swift
//  Swift3
//
//  Created by choi hyunjin on 2022/04/23.
//

import Foundation

class P1387{
    var map = [Int: Int]()
    
    func getKth(_ lo: Int, _ hi: Int, _ k: Int) -> Int {
        var res = [(Int, Int)]()
        for i in lo...hi{
            res.append((i, calculate(i)))
        }
        res.sort(by: {
            return $0.1 < $1.1
        })
        return res[k].0
    }
    
    func calculate(_ number: Int, _ count: Int = 1) -> Int {
        if number == 1 {
            map[number] = count
            return count
        }
        if let res = map[number]{
            return res + count
        }else {
            return calculate(number%2 == 0 ? getEven(number): getOdd(number), count + 1)
        }
    }
    
    func getOdd(_ number: Int) -> Int {
        return number * 3 + 1;
    }
    
    func getEven(_ number: Int) -> Int {
        return number / 2 ;
    }
}
