let n = Int(readLine()!)!
var wine = [Int](repeating: 0, count: n+1)

for i in 1...n {
    wine[i] = Int(readLine()!)!
}

if n == 1 {
    print(wine[1])
} else if n == 2{
    print(wine[1] + wine[2])
} else {
    var dp = Array(repeating: 0, count: n+1)
    dp[1] = wine[1]
    dp[2] = wine[1] + wine[2]
    
    for i in 3...n {
        // 1. i번째 마시지 않고, i-1번째 최대양
        let case1 = dp[i-1]
        // 2. i번째 마시고, i-1번째 마시지 않고, i-2번째 최대양
        let case2 = wine[i] + dp[i-2]
        // 3. i번째, i-1번째 마시고, i-3번째 최대양
        let case3 = wine[i] + wine[i-1] + dp[i-3]
        dp[i] = max(case1, case2, case3)
    }
    print(dp.max()!)
}

