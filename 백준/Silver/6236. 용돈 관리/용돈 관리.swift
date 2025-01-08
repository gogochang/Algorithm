import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0]
let M = input[1]

var expenses = [Int]()
for _ in 0..<N {
    expenses.append(Int(readLine()!)!)
}

func canWithdrawWithLimit(_ limit: Int) -> Bool {
    var currentAmount = 0
    var withdrawCount = 0
    
    for expense in expenses {
        if currentAmount < expense {
            withdrawCount += 1
            currentAmount = limit
        }
        currentAmount -= expense
        
        if withdrawCount > M {
            return false
        }
    }
    
    return true
}

func binarySearch() -> Int {
    var left = expenses.max()!
    var right = expenses.reduce(0, +)
    var result = right
    
    while left <= right {
        let mid = (left + right) / 2
        if canWithdrawWithLimit(mid) {
            result = mid
            right = mid - 1
        } else {
            left = mid + 1
        }
    }
    
    return result
}

print(binarySearch())
