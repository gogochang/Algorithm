// 입력처리
let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0] // 주전자의 개수
let k = input[1] // 친구들의 수
var kettles: [Int] = []
for _ in 0..<n {
    kettles.append(Int(readLine()!)!)
}

var left = 1
var right = kettles.max()!
var result = right

while left <= right {
    let mid = (left + right) / 2
    var total = 0
    
    for kettle in kettles {
        total += kettle / mid
    }
    
    if total >= k {
        result = mid
        left = mid + 1
    } else {
        right = mid - 1
    }
}

print(result)
