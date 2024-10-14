let n = Int(readLine()!)!
let mod = 10007
var dp = Array(repeating: Array(repeating: 0, count: 10), count: n+1)
dp[1] = [1,1,1,1,1,1,1,1,1,1]

if n > 1 {
    for i in 2...n {
        for j in 0..<10 {
            if j == 0 {
                dp[i][j] = dp[i-1][j]
            } else {
                dp[i][j] = (dp[i-1][j] + dp[i][j-1]) % mod
            }
        }
        
    }
}
print(dp[n].reduce(0, +) % mod)
