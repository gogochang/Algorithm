let t = Int(readLine()!)!
let mod = 1000000009
for _ in 0..<t {
    let n = Int(readLine()!)!
    var dp = Array(repeating: 0, count: n+1)
    
    if n == 0 {
        dp[n] = 0
    } else if n == 1 {
        dp[n] = 1
    } else if n == 2 {
        dp[n] = 2
    } else if n == 3 {
        dp[n] = 4
    } else {
        dp[0] = 0
        dp[1] = 1
        dp[2] = 2
        dp[3] = 4
        
        for i in 4...n {
            dp[i] = (dp[i-1] + dp[i-2] + dp[i-3]) % mod
        }
    }
    print(dp[n])
}
