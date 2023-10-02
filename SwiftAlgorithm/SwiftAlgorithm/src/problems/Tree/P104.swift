//
//  File.swift
//  
//
//  Created by choi hyunjin on 2022/01/09.
//

import Foundation

public class P100{
    func maxDepth(_ root: TreeNode?) -> Int {
        if root == nil{ return 0}
        
        let leftDepth = self.maxDepth(root?.left)
        let rightDepth = self.maxDepth(root?.right)
        
        return (leftDepth > rightDepth ? leftDepth : rightDepth) + 1
    }
}
