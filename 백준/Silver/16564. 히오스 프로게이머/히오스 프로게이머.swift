let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0] // 캐릭터의 개수
let k = input[1] // 올릴 수 있는 레벨 총합
var levels = [Int]()
for _ in 0..<n {
    levels.append(Int(readLine()!)!)
}

func calulateNum(target: Int) -> Int {
    var result = 0
    
    for level in levels {
        let num = target - level
        result += num > 0 ? num : 0
    }
    
    return result
}
var left = levels.min()!
var right = levels.max()! + k
var result = left

while left <= right {
    let mid = (left + right) / 2
    let currentNum = calulateNum(target: mid)
    
    if currentNum <= k {
        result = mid
        left = mid + 1
    } else {
        right = mid - 1
    }
}

print(result)
