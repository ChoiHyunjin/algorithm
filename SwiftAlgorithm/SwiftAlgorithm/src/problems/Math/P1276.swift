//
//  P1276.swift
//  SwiftAlgorithm
//
//  Created by Tophy on 4/27/24.
//

import Foundation

class P1276 {
    func numOfBurgers2(_ tomatoSlices: Int, _ cheeseSlices: Int) -> [Int] {
        if tomatoSlices % 2 == 1 {
            return []
        }
        var result = [0, cheeseSlices]
        
        var remainTomato = tomatoSlices - cheeseSlices*2
        
        if remainTomato == 0 {
            return result
        }
        
        while remainTomato > 0 && result[1] > 0 {
            result[1] -= 1
            result[0] += 1
            remainTomato -= 2
            
            if remainTomato == 0 {
                return result
            }
        }
        
        return []
    }
    
    func numOfBurgers(_ tomatoSlices: Int, _ cheeseSlices: Int) -> [Int] {
        
        if tomatoSlices % 2 == 1 {
            return []
        }
        //        t = 4j + 2s
        //        c = j + s
                
        //        j = (t - 2c) / 2 = t/2 - c
        //        s = (4c - t) / 2 = 2c - t/2
        let jumbo = tomatoSlices/2-cheeseSlices
        let small = 2*cheeseSlices-tomatoSlices/2
        
        if jumbo < 0 || small < 0{
            return []
        }
        
        return [jumbo, small]
    }
}
