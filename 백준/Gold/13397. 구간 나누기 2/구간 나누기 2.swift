let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]
let arr = readLine()!.split(separator: " ").map { Int($0)! }

func canDivide(distance: Int) -> Bool {
    var count = 1
    var minValue = arr[0]
    var maxValue = arr[0]
    
    for num in arr {
        minValue = min(minValue, num)
        maxValue = max(maxValue, num)
        
        if maxValue - minValue > distance {
            count += 1
            minValue = num
            maxValue = num
        }
    }
    
    return count <= m
}

var left = 0
var right = arr.max()! - arr.min()!
var result = right

while left <= right {
    let mid = (left + right) / 2
    
    if canDivide(distance: mid) {
        result = mid
        right = mid - 1
    } else {
        left = mid + 1
    }
    
}

print(result)
