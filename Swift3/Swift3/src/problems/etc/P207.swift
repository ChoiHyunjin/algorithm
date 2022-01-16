//
//  P207.swift
//  Swift3
//
//  Created by choi hyunjin on 2022/01/16.
//

import Foundation

class ListNode{
    var value : Int
    var next: ListNode?
    
    init(_ value: Int){
        self.value = value
        self.next = nil
    }
}

class P207{
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var startableDic = Dictionary<Int, ListNode>()
        var arr :[ListNode] = []
        for i in 0..<numCourses{
            let node = ListNode(i)
            arr.append(node)
            startableDic[i] = node
        }
        
        var res = true
        
        for pair in prerequisites{
            if pair[0] == pair[1] {
                return false
            }
            var post : ListNode
            post = arr[pair[0]]
            
            var pre : ListNode
            if startableDic[pair[1]] != nil {
                pre = startableDic.removeValue(forKey: pair[1])!
            }else{
                pre = arr[pair[1]]
            }
            
            post.next = pre
        }
        
        for node in startableDic{
            res = self.checkCirculation(numCourses,node.value)
            if !res {
                break
            }else{
                var starter: ListNode? = node.value
                while starter != nil {
                    starter!.value = -1
                    starter = starter!.next
                }
            }
        }
        
        if res {
            res = arr.firstIndex(where: { $0.value >= 0}) == nil
        }
        
        return res
    }
    
    func checkCirculation(_ numCourses: Int,_ node: ListNode) -> Bool{
        var res = true
        var slower: ListNode? = node
        var faster: ListNode? = node
        
        for _ in 0..<numCourses{
            if faster == nil {
                break
            }
            faster = faster!.next
            if faster == nil {
                break
            }
            faster = faster!.next
            if faster == nil {
                break
            }
            
            slower = slower!.next
            
            if slower!.value == faster!.value {
                res = false
                break
            }
        }
        return res
    }
}
