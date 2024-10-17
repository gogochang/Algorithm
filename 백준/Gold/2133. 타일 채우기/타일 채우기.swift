let n = Int(readLine()!)!

// 길이가 홀수이면 타일을 배치할 수 없다.
if n%2 != 0 {
    print(0)
} else {
    var dp = Array(repeating: 0, count: n+1)
    
    dp[0] = 1 // 아무것도 배치하지 않는 방법의 수 1
    dp[2] = 3 // 2칸일때 경우의수 3개, 기본패턴
    
    if n >= 4 {
        for i in stride(from: 4, through: n, by: 2) {
            dp[i] = dp[i-2] * 3 // 기본패턴은 2칸의 기본패턴이 3개씩 증가
            for j in stride(from: 4, through: i, by: 2) {
                dp[i] += dp[i-j] * 2
            }
        }
    }
    
    print(dp[n])
}
