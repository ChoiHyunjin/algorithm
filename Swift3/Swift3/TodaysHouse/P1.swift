//
//  P1.swift
//  Swift3
//
//  Created by choi hyunjin on 2022/03/12.
//

import Foundation

class P1 {
    func product(_ products:[String], _ purchased: [String]) -> String{
        var dic = [String: Int]()
        var dictionary = [String: String]()
        
        for product in products {
            let item = product.split(separator: " ", maxSplits: 1)
            dictionary[String(item[0])] = String(item[1])
//            let items = String(item[1]).split(separator: " ")
//            for i in 0..<items.count{
//                dic[String(items[i])] = 0
//            }
        }
        
        for purchase in purchased{
            let pur = dictionary.removeValue(forKey: purchase)
            guard let item = pur?.split(separator: " ") else { continue }
            for i in 0..<item.count{
                if dic[String(item[i])] == nil {
                    dic[String(item[i])] = 1
                } else {
                    dic[String(item[i])]! += 1
                }
            }
        }
        
        let priority = dic.sorted(by: {
            if $0.value == $1.value {
                return $0.key < $1.key
            } else {
                return $0.value > $1.value
            }
        })
        
        for prio in priority{
            let keys = dictionary.keys
            if keys.count == 1{
                break
            }
            var hasSomeone = false
            for value in dictionary.values{
                if value.contains(prio.key) {
                    hasSomeone = true
                    break
                }
            }
            if hasSomeone {
                for key in keys{
                    if !(dictionary[key]?.contains(prio.key))! {
                        dictionary.removeValue(forKey: key)
                    }
                }
            }
        }
        
        let keys = dictionary.keys
        if keys.count > 1 {
            var ptr = keys.first
            for key in keys {
                let curr = (dictionary[key]?.split(separator: " ").count)!
                let prev = (dictionary[ptr!]?.split(separator: " ").count)!
                ptr = curr > prev ? key : ptr
            }
            return ptr!
        }
        return keys.first!
    }
}
