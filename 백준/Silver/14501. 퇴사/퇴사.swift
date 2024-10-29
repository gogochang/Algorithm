let N = Int(readLine()!)!
var T = [Int](repeating: 0, count: N + 1)
var P = [Int](repeating: 0, count: N + 1)
for i in 1...N {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    T[i] = input[0]
    P[i] = input[1]
}

// dp 배열 초기화
var dp = [Int](repeating: 0, count: N + 2)

// 역순으로 dp 계산
for i in stride(from: N, through: 1, by: -1) {
    
    let nextDay = i + T[i]
    if nextDay <= N + 1 {
        dp[i] = max(dp[i + 1], P[i] + dp[nextDay])
    } else {
        dp[i] = dp[i + 1]
    }
}
print(dp[1])
