let t = Int(readLine()!)!

for _ in 0..<t {
    let n = Int(readLine()!)!
    let inputs1 = readLine()!.split(separator: " ").map { Int($0)! }
    let inputs2 = readLine()!.split(separator: " ").map { Int($0)! }
    var dp = Array(repeating: [0,0,0], count: n)
    dp[0][1] = inputs1[0]
    dp[0][2] = inputs2[0]
    for i in 1..<n {
        // 아무것도 선택하지 않았습니다.
        dp[i][0] = max(dp[i-1][1], dp[i-1][2])
        // 위 스티커를 선택했습니다.
        dp[i][1] = max(inputs1[i] + dp[i-1][2], inputs1[i] + dp[i-1][0])
        // 아래 스티커를 선택했습니다.
        dp[i][2] = max(inputs2[i] + dp[i-1][1], inputs2[i] + dp[i-1][0])
    }
    
    print(dp[n-1].max()!)
}

