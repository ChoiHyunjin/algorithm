//
//  SearchRanking.swift
//  Swift3
//
//  Created by choi hyunjin on 2022/03/14.
//

import Foundation

class SearchRanking {
    func solution(_ info:[String], _ query:[String]) -> [Int] {
        var res = [Int]()
        var people = Array.init(repeating: Array.init(repeating: Array.init(repeating: Array.init(repeating: [Int](), count: 2), count: 2), count: 2), count: 3)
        
        for person in info{
            let props = person.split(separator: " ")
            people[getLang(String(props[0]))-1][getPosi(String(props[1]))-1][getCarr(String(props[2]))-1][getFood(String(props[3]))-1].append(Int(props[4])!)
        }
        
        for i in 0..<query.count{
            var count = 0
            let prop = query[i].split(separator: " ")
            let arr = [getLang(String(prop[0])), getPosi(String(prop[2])), getCarr(String(prop[4])), getFood(String(prop[6])), Int(prop[7])!]
            let range1 = arr[0] == 0 ? (0...2) : (arr[0]-1...arr[0]-1)
            let range2 = arr[1] == 0 ? (0...1) : (arr[1]-1...arr[1]-1)
            let range3 = arr[2] == 0 ? (0...1) : (arr[2]-1...arr[2]-1)
            let range4 = arr[3] == 0 ? (0...1) : (arr[3]-1...arr[3]-1)
            for a in range1{
                for b in range2{
                    for c in range3{
                        for d in range4{
                            let temp = people[a][b][c][d].sorted()
                            var high = temp.count-1
                            var low = 0
                            var idx = temp.count
                            while low <= high {
                                let mid = (low + high) / 2
                                if arr[4] <= temp[mid]{
                                    idx = mid
                                    high = mid - 1
                                } else {
                                    low = mid + 1
                                }
                            }
                            count += temp.count - idx
//                            count += people[a][b][c][d].reduce(0, {
//                                $0 + ($1 >= arr[4] ? 1 : 0)
//                            })
                        }
                    }
                }
            }
            
            res.append(count)
        }
        
        return res
    }
    
    func solution2(_ info:[String], _ query:[String]) -> [Int] {
        var res = [Int]()
        var people = [[Int]]()
        
        for person in info{
            let props = person.split(separator: " ")
            let arr = [getLang(String(props[0])), getPosi(String(props[1])), getCarr(String(props[2])), getFood(String(props[3])), Int(props[4])!]
            people.append(arr)
        }
        
        for i in 0..<query.count{
            var count = 0
            let prop = query[i].split(separator: " ")
            let arr = [getLang(String(prop[0])), getPosi(String(prop[2])), getCarr(String(prop[4])), getFood(String(prop[6])), Int(prop[7])!]
            for person in people {
                count += ((person[0] == arr[0] || arr[0] == 0) && (person[1] == arr[1] || arr[1] == 0) && (person[2] == arr[2] || arr[2] == 0) && (person[3] == arr[3] || arr[3] == 0) && (person[4] >= arr[4] || arr[4] == 0) ) ? 1 : 0
            }
            res.append(count)
        }
        
        return res
    }
    
    func getLang(_ str: String) -> Int {
        switch str {
        case "cpp":
            return 3
        case "java":
            return 2
        case "python":
            return 1
        default:
            return 0
        }
    }
    
    func getPosi(_ str: String) -> Int {
        switch str {
        case "backend":
            return 2
        case "frontend":
            return 1
        default:
            return 0
        }
    }
    
    func getCarr(_ str: String) -> Int {
        switch str {
        case "junior":
            return 2
        case "senior":
            return 1
        default:
            return 0
        }
    }
    
    func getFood(_ str: String) -> Int {
        switch str {
        case "chicken":
            return 2
        case "pizza":
            return 1
        default:
            return 0
        }
    }
}
