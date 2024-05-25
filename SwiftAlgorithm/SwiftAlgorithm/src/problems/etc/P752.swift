//
//  P752.swift
//  SwiftAlgorithm
//
//  Created by Tophy on 4/22/24.
//

import Foundation

class P752 {
    class Queue<T> {
        class Node {
            let value: T
            var next: Node? = nil
            
            init(value: T){
                self.value = value
            }
        }
        
        var head: Node?
        var tail: Node?
        var count = 0
        
        init(nodes: [T]) {
            if nodes.count == 0 {
                return
            }
            
            self.head = Node(value: nodes[0])
            tail = self.head
            for i in 1..<nodes.count {
                let next = Node(value: nodes[i])
                tail?.next = next
                tail = next
            }
            count = nodes.count
        }
        
        func enqueue(node: T) {
            let item = Node(value: node)
            if head == nil {
                head = item
            }
            tail?.next = item
            tail = item
            count += 1
        }
        
        func enqueue(nodes: [T]) {
            nodes.forEach(enqueue)
        }
        
        func dequeue() -> T? {
            guard let next = head else {
                return nil
            }
            count -= 1
            let temp = head
            head = next.next
            return temp?.value
        }
        
        func reset() {
            head = nil
            tail = nil
            count = 0
        }
    }
    
    func getChildren(_ value: Int) -> [Int] {
        var children = [Int]()
        var temp = value
        
        var values = Array(repeating: 0, count: 4)
        
        for i in 0..<4 {
            values[i] = temp % 10
            temp /= 10
        }
        
        func toInt(_ arr: [Int]) -> Int {
            arr.reversed().reduce(0) { prev, curr in
                prev * 10 + ((10 + curr) % 10)
            }
        }
        
        for i in 0..<4 {
            values[i] += 1
            children.append(toInt(values))
            values[i] -= 2
            children.append(toInt(values))
            values[i] += 1
        }
        return children
    }

    func openLock(_ deadends: [String], _ target: String) -> Int {
        if deadends.contains("0000") {
            return -1
        }
        
        var visited = Set(deadends.map{Int($0)!})
        let targetInt = Int(target)
        
        var nodes = [Int]()
        for i in 0..<10000 {
            nodes.append(i)
        }
        
        var queue = Queue<Int>(nodes: [0] )
        var nextQueue = Queue<Int>(nodes: [])
        var count = 0
        visited.insert(0)
        
        while queue.count > 0 {
            guard let pointer = queue.dequeue() else {
                break
            }
            
            if pointer == targetInt {
                return count
            }
            
            let nextList = getChildren(pointer).filter{ !visited.contains($0) }
            nextList.forEach{visited.insert($0)}
            nextQueue.enqueue(nodes: nextList.map{ nodes[$0] })
            
            if queue.count == 0 {
                count += 1
                let temp = queue
                queue = nextQueue
                nextQueue = temp
                nextQueue.reset()
            }
        }
        
        return -1
    }
}
