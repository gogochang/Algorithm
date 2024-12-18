let input = readLine()!.split(separator: " ").map { Int($0)! }
let m = input[0] // 조카의 수
let n = input[1] // 과자의 수
var lengths = readLine()!.split(separator: " ").map { Int($0)! }

var start = 1
var end = lengths.max()!
var result = 0

while start <= end {
    var total = 0
    var mid = (start + end) / 2
    
    for length in lengths {
        total += length / mid
    }
    
    if total >= m {
        result = mid
        start = mid + 1
    } else {
        end = mid - 1
    }
}

print(result)
