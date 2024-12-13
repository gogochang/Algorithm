let input = readLine()!.split(separator: " ").map { Int($0)! }
let x = input[0] // 게임 횟수
let y = input[1] // 게임 이긴 횟수

// 현재 승률
var currentWinRate = (y * 100) / x

if currentWinRate >= 99 {
    print(-1)
} else {
    var left = 1
    var right = x
    var result = -1
    while left <= right {
        var mid = (left + right) / 2
        var newWinRate = ((y + mid) * 100) / (x + mid)
        
        if newWinRate > currentWinRate {
            result = mid
            right = mid - 1
        } else {
            left = mid + 1
        }
    }
    print(result)
}
