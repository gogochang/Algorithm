let n = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map { Int($0)! }.sorted()

func toPointer(_ target: Int, _ excludeIndex: Int) -> Bool {
    var left = 0
    var right = n - 1
    
    while left < right {
        
        if left == excludeIndex {
            left += 1
            continue
        } else if right == excludeIndex {
            right -= 1
            continue
        }
        
        let sum = numbers[left] + numbers[right]
        
        
        if sum < target {
            left += 1
        }
        // 합이 찾고자 하는 수보다 크면
        else if sum > target {
            right -= 1
        }
        // 합이 찾고자 하는 수와 일치하면 참
        else {
            return true
        }
    }
    
    return false
}

var result = 0
for i in 0..<n {
    result += toPointer(numbers[i], i) ? 1 : 0
}

print(result)
