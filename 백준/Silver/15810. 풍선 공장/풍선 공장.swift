let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0] // 스태프의 수
let m = input[1] // 풍선의 수
var times = readLine()!.split(separator: " ").map { Int($0)! }.sorted()

func calculateNum(targetNum: Int) -> Int {
    times.reduce(0) { $0 + (targetNum / $1)  }
}

var left = 0
var right = times.max()! * m
var result = right

while left <= right {
    let mid = (left + right) / 2
    let currentCount = calculateNum(targetNum: mid)
    
    if currentCount >= m {
        result = mid
        right = mid - 1
    } else {
        left = mid + 1
    }
}

print(result)

