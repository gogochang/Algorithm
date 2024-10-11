import Foundation

let n = Int(readLine()!)!
var cost = [[Int]]()

for _ in 0..<n {
    let rgb = readLine()!.split(separator: " ").map {Int($0)!}
    cost.append(rgb)
}

var dp = Array(repeating: [0,0,0], count: n)
dp[0][0] = cost[0][0]
dp[0][1] = cost[0][1]
dp[0][2] = cost[0][2]

// 점화식
for i in 1..<n {
    dp[i][0] = min(dp[i-1][1], dp[i-1][2]) + cost[i][0]
    dp[i][1] = min(dp[i-1][0], dp[i-1][2]) + cost[i][1]
    dp[i][2] = min(dp[i-1][0], dp[i-1][1]) + cost[i][2]
}

let result = dp[n-1].min()!
print(result)
