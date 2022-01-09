//
//  File.swift
//  
//
//  Created by choi hyunjin on 2022/01/09.
//

import Foundation

public class Node {
    public var val: Int
    public var neighbors: [Node?]
    public init(_ val: Int) {
        self.val = val
        self.neighbors = []
    }
}
