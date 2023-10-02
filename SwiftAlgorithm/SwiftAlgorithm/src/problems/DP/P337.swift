//
//  P337.swift
//  Swift3
//
//  Created by choi hyunjin on 2022/01/16.
//

import Foundation

class P337 {
    func rob(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        
        let money = self.bfs(root!)
        
        if money.count == 1 {
            return money[0]
        } else if money.count == 2 {
            return money[0] > money[1] ? money[0] : money[1]
        } else if money.count == 3 {
            let last = money[0] + money[2]
            return money[1] > last ? money[1] : last
        } else {
            var arr = Array.init(repeating: 0, count: money.count)
            arr[0] = money[0]
            arr[1] = money[1]
            arr[2] = money[0] + money[2]
            for i in 3..<money.count {
                arr[i] = money[i] + (arr[i-2] > arr[i-3] ? arr[i-2] : arr[i-3])
            }
            return arr[money.count-1] > arr[money.count-2] ? arr[money.count-1] : arr[money.count-2]
        }
    }
    
    func bfs(_ root: TreeNode) -> [Int]{
        var money : [Int] = [0]
        
        var queueArr: [[TreeNode]] = [[root],[]]
        
        var i = 0
        while queueArr[i % 2].count > 0 || queueArr[(i+1) % 2].count > 0 {
            let tempNode = queueArr[i % 2].removeFirst()
            money[i] += tempNode.val
            
            if tempNode.left != nil {
                queueArr[(i+1) % 2].append(tempNode.left!)
            }
            if tempNode.right != nil {
                queueArr[(i+1) % 2].append(tempNode.right!)
            }
            if queueArr[i % 2].count == 0 {
                i += 1
                money.append(0)
            }
        }
        return money
    }
}
