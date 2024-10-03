func makeOne(_ n: Int) -> Int {
    if n == 1 {
        return 0
    }
    
    var dp = Array(repeating: 0, count: n + 1)
    
    for i in 2...n {
        dp[i] = dp[i-1] + 1
        
        if i % 3 == 0 {
            dp[i] = min(dp[i], dp[i/3] + 1)
        }
        if i % 2 == 0 {
            dp[i] = min(dp[i], dp[i/2] + 1)
        }
        
        
    }
    
    return dp[n]
}

print(makeOne(Int(readLine()!)!))
