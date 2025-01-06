let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0] // 캐릭터의 개수
let k = input[1] // 올릴 수 있는 레벨 총합

var levels = [Int]()
for _ in 0..<n {
    levels.append(Int(readLine()!)!)
}
levels.sort()

func calculateNum(target: Int) -> Int {
    var result = 0
    
    for level in levels {
        if level < target {
            result += target - level
        } else {
            break
        }
    }
    
    return result
}

var left = levels[0]
var right = levels.max()! + k
var result = left

while left <= right {
    let mid = (left + right) / 2
    let currentNum = calculateNum(target: mid)
    
    if currentNum <= k {
        result = mid
        left = mid + 1
    } else {
        right = mid - 1
    }
}

print(result)
