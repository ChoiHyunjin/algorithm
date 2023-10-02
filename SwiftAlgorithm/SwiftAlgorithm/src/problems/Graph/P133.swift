//
//  File.swift
//  
//
//  Created by choi hyunjin on 2022/01/09.
//

import Foundation

class P133{
    var stack : [Node] = []
    var stack2 = Dictionary<Int, Node>()
    
    // using Dictionary
    func cloneGraph(_ node: Node?) -> Node? {
        if node == nil{ return nil}
        
        if let existing = stack2[node!.val] {
            return existing
        }
        var newNode = Node(node!.val)
        self.stack2[node!.val] = newNode
        for neighbor in node!.neighbors{
            let temp = self.stack2[neighbor!.val];
            if temp == nil {
                newNode.neighbors.append(self.cloneGraph(neighbor))
            }else{
                newNode.neighbors.append(temp!)
            }
                
        }
        return newNode
    }
    
    // using Array
    func cloneGraph2(_ node: Node?) -> Node? {
        if node == nil{ return nil}
        
        var newNode = Node(node!.val)
        self.stack.append(newNode)
        for n in node!.neighbors{
            let index = self.stack.firstIndex(where:{ $0.val == n!.val })
            if index == nil {
                newNode.neighbors.append(self.cloneGraph(n))
            }else{
                newNode.neighbors.append(self.stack[index!])
            }
                
        }
        return newNode
    }
}
