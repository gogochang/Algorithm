let inputs = readLine()!.split(separator: " ").map { Int($0)! }
let n = inputs[0]
let k = inputs[1]
var dp = Array(repeating: Array(repeating:0, count: n+1), count: k+1)
let mod = 1000000000
dp[0][0] = 1

for i in 1...k {
    for j in 0...n {
        if j > 0 {
            dp[i][j] = (dp[i-1][j] + dp[i][j-1]) % mod
        } else {
            dp[i][j] = dp[i-1][j] % mod
        }
    }
}

print(dp[k][n]%mod)
