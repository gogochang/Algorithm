let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0] // 현재 휴게소의 개수
let m = input[1] // 더 지으려고 하는 휴게소의 개수
let l = input[2] // 고속도로의 길이
var restStops = readLine()!.split(separator: " ").map { Int($0)! } + [0, l]
restStops.sort()

var left = 1
var right = l
var result = right

func calculateNum(_ mid: Int) -> Int {
    var count = 0
    for i in 1..<restStops.count {
        let distance = restStops[i] - restStops[i-1]
        count += (distance / mid)
        if distance % mid == 0 {
            count -= 1
        }
    }
    return count
}


while left <= right {
    let mid = (left + right) / 2
    let currentCount = calculateNum(mid)
    
    if currentCount <= m {
        result = mid
        right = mid - 1
    } else {
        left = mid + 1
    }
}

print(result)
