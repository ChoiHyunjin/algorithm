//
//  Socar1.swift
//  Swift3
//
//  Created by choi hyunjin on 2022/03/17.
//

import Foundation

class Rectangle: NSObject {
    
    var left: Int
    var right: Int
    var top: Int
    var down: Int
    
    let index : Int
    init (_ pos: [Int], _ index: Int) {
        left = pos[0]
        down = pos[1]
        right = pos[2]
        top = pos[3]
        self.index = index
    }
    
    func toDown(by: Int){
        down -= by
        top -= by
    }
    
    func toLeft(by: Int){
        left -= by
        right -= by
    }
    
    func toString() -> String {
        return "\(left) \(down) \(right) \(top)"
    }
}

class Socar1 {
    func solution(_ rectangles: [[Int]]) -> [String] {
        var width = 0
        var height = 0
        var rects = [Rectangle]()
        for i in 0..<rectangles.count {
            let rect = rectangles[i]
            width = max(width, rect[2])
            height = max(height, rect[3])
            rects.append(Rectangle(rect, i))
        }
        var rect = rects.sorted(by: {
            return $0.down <= $1.down
        })
        
        var heights = [Int].init(repeating: 0, count: width + 1)
        
        for i in 0..<rect.count {
            let r = rect[i]
            let height = r.down - getMaxValue(in: r.left..<r.right, heights)
            r.toDown(by: height)
            for i in r.left..<r.right{
                heights[i] = r.top
            }
        }
        
        rect = rect.sorted(by: {
            return $0.left <= $1.left
        })
        
        var widths = [Int].init(repeating: 0, count: height + 1)
        
        for i in 0..<rect.count {
            let r = rect[i]
            let width = r.left - getMaxValue(in: r.down..<r.top, widths)
            r.toLeft(by: width)
            for i in r.down..<r.top{
                widths[i] = r.right
            }
        }
        
        return rect.sorted(by: {
            $0.index < $1.index
        }).map({
            $0.toString()
        })
    }
    
    func getMaxValue(in range: Range<Int>, _ list:[Int]) -> Int {
        var res = 0
        for i in range{
            res = max(res, list[i])
        }
        return res
    }
}
