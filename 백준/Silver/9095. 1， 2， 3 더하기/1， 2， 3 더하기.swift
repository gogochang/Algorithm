// 테스트 케이스의 개수
let t = Int(readLine()!)!

// n입력 조건 : 0 < n < 11
var dp = Array(repeating: 0, count: 11)

// 고정 값
dp[1] = 1 // 1+1
dp[2] = 2 // 1+1, 2
dp[3] = 4 // 1+1+1, 1+2, 2+1, 3

for i in 4..<dp.count {
    dp[i] = dp[i-1] + dp[i-2] + dp[i-3]
}

for _ in 0..<t {
    let n = Int(readLine()!)!
    print(dp[n])
}
