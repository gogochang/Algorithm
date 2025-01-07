import Foundation

func canDivide(_ array: [Int], _ maxDifference: Int, _ m: Int) -> Bool {
    var count = 1
    var minValue = array[0]
    var maxValue = array[0]
    
    for num in array {
        minValue = min(minValue, num)
        maxValue = max(maxValue, num)
        
        if maxValue - minValue > maxDifference {
            count += 1
            minValue = num
            maxValue = num
        }
    }
    
    return count <= m
}

func findMinimumMaxDifference(_ array: [Int], _ m: Int) -> Int {
    var left = 0
    var right = array.max()! - array.min()!
    var result = right
    
    while left <= right {
        let mid = (left + right) / 2
        
        if canDivide(array, mid, m) {
            result = mid
            right = mid - 1
        } else {
            left = mid + 1
        }
    }
    
    return result
}

// 입력 처리
if let firstLine = readLine(), let secondLine = readLine() {
    let nM = firstLine.split(separator: " ").map { Int($0)! }
    let n = nM[0]
    let m = nM[1]
    let array = secondLine.split(separator: " ").map { Int($0)! }
    
    let result = findMinimumMaxDifference(array, m)
    print(result)
}
