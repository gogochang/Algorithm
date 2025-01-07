let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0] // 현재 휴게소의 개수
let m = input[1] // 더 지으려고 하는 휴게소의 개수
let l = input[2] // 고속도로의 길이
var restStops = readLine()!.split(separator: " ").map { Int($0)! } + [0, l]
restStops.sort()

func calculateNum(targetDistance: Int) -> Int {
    restStops.enumerated().dropFirst().reduce(0) {
        let distance = restStops[$1.offset] - restStops[$1.offset - 1]
        return $0 + (distance / targetDistance) - (distance % targetDistance == 0 ? 1 : 0)
    }
}

var left = 1
var right = l
var result = right

while left <= right {
    let mid = (left + right) / 2
    let currentCount = calculateNum(targetDistance: mid)
    
    if currentCount <= m {
        result = mid
        right = mid - 1
    } else {
        left = mid + 1
    }
}

print(result)