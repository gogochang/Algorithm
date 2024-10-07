let t = Int(readLine()!)!
var dp = Array(repeating: [0,0,0,0], count: 100001)
let mod = 1000000009

dp[0] = [0,0,0,0] // 0
dp[1] = [0,1,0,0] // 1
dp[2] = [0,0,1,0] // 2
dp[3] = [0,1,1,1] // 2+1, 1+2, 3

for i in 4...100000 {
        dp[i][1] = (dp[i-1][2] + dp[i-1][3]) % mod
        dp[i][2] = (dp[i-2][1] + dp[i-2][3]) % mod
        dp[i][3] = (dp[i-3][1] + dp[i-3][2]) % mod
}

for _ in 0..<t {
    let n = Int(readLine()!)!
    print((dp[n][1] + dp[n][2] + dp[n][3]) % mod)
}
