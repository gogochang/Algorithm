
let input = readLine()!.split(separator: " ").map { Int($0)! }
let k = input[0] // 가지고 있는 랜선의 개수
let n = input[1] // 필요한 랜선의 개수
var lines: [Int] = []
for _ in 0..<k {
    lines.append(Int(readLine()!)!)
}

var start = 1
var end = lines.max()!

while start <= end {
    var mid = (start + end) / 2
    var count = 0
    
    for line in lines {
        count += line / mid
    }
    
    if count < n {
        end = mid - 1
    } else {
        start = mid + 1
    }
}

print(end)