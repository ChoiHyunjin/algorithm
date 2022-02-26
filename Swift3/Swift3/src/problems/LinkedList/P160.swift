//
//  P160.swift
//  Swift3
//
//  Created by choi hyunjin on 2022/02/26.
//

import Foundation

class P160 {
  func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
    var dic = Array<ListNode>()
    
    var ptr = headA
    while ptr != nil {
      dic.append(ptr!)
      ptr = ptr?.next
    }

    ptr = headB
    while ptr != nil {
      var res: ListNode?
      dic.forEach{
        if $0 === ptr{
          res = $0
        }
      }
      if res != nil {
        break
      }
      ptr = ptr?.next
    }
    return ptr
  }
  func getIntersectionNode2(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
//    var dic = Set<ListNode>()
    
    var ptr = headA
//    while ptr != nil {
//      dic.insert(ptr!)
//      ptr = ptr?.next
//    }
//
//    ptr = headB
//    while ptr != nil && !dic.contains(ptr!) {
//      ptr = ptr?.next
//    }
    return ptr
  }
}
