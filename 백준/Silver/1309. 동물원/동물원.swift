import Foundation

let n = Int(readLine()!)!
let mod = 9901
var dp = Array(repeating:[0,0,0], count: n+1)
dp[1] = [1,1,1]

if n > 1 {
    for i in 2...n {
        //dp[i][0] = 사자를 왼쪽에 배치하는 경우
        dp[i][0] = (dp[i-1][1] + dp[i-1][2]) % mod
        //dp[i][1] = 사자를 오른쪽에 배치하는 경우
        dp[i][1] = (dp[i-1][0] + dp[i-1][2]) % mod
        //dp[i][2] = 사자를 배치하지 않는 경우
        dp[i][2] = (dp[i-1][0] + dp[i-1][1] + dp[i-1][2]) % mod
    }
}

print((dp[n][0]+dp[n][1]+dp[n][2]) % mod)
