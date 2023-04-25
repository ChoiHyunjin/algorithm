import UIKit

var greeting = "Hello, playground"

func getCards(_ inputs: [Int]) -> Int {
    var dic: Dictionary<Int, Int> = Dictionary()
    var sums = Array(repeating: -1, count: inputs.count)
    var res = -1
    
    for i in 0..<inputs.count {
        let card = inputs[i]
        
        if i == 0 {
            sums[i] = inputs[i]
        } else {
            sums[i] = sums[i-1] + inputs[i]
        }
        
        if let index = dic[card] {
            var sum = sums[i] - sums[index] + card
            
            if res == -1 {
                res = sum
            } else {
                res = min(sum, res)
            }
        }
        dic[card] = i
    }

    return res
}

getCards([3, 4, 2, 3, 4, 7])
getCards([1, 0, 5, 3])

func getLargerNumbers(_ inputs:[Int]) -> [Int] {
    var res: [Int] = Array(repeating: -1, count: inputs.count)
    var stack: [Int] = []
    
    for i in 0..<inputs.count {
        let input = inputs[i]
        
        while true {
            if stack.count == 0 || input <= inputs[stack[stack.count-1]]{
                break
            }
            guard let index = stack.popLast() else {
                break
            }
            res[index] = input
        }
        
        stack.append(i)
    }
    
    return res
}

// [3,1,3,4,3]
// [3]
// [3, 1]
// [3, 3] -> res = [-1, 3, -1]
// [4] -> res = [4, 3, 4, -1]

getLargerNumbers([3,1,3,4,3])
getLargerNumbers([1,2,1])

// [9, 8, 7, 6, 5, ... , 10]
