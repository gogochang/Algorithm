let n = Int(readLine()!)! // 지방의 수
var arr = readLine()!.split(separator: " ").map { Int($0)! } // 각 지방의 예산 배열
let m = Int(readLine()!)! // 총 예산

var start = 1
var end = arr.max()!
var result = 0
while start <= end {
    var total = 0
    var mid = (start + end) / 2
    
    for num in arr {
        total += num <= mid ? num : mid
    }
    
    if total <= m {
        result = mid
        start = mid + 1
    } else {
        end = mid - 1
    }
}

print(result)

