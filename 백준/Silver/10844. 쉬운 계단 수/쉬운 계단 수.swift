// 2차원 배열
// ex) dp[n][i], n자리수에 오는 i숫자가 몇가지의 방법으로 올 수 있는지 저장
let mod = 1000000000
var dp = Array(repeating: [0,0,0,0,0,0,0,0,0,0], count: 101)
dp[1] = [0, 1, 1, 1, 1, 1, 1, 1, 1, 1]

let n = Int(readLine()!)!

//for i in 2...n {
//    for j in 0...9 {
//        if j == 0 {
//            dp[i][j] = dp[i-1][j+1] % mod
//        } else if j == 9 {
//            dp[i][j] = dp[i-1][j-1] % mod
//        } else {
//            dp[i][j] = (dp[i-1][j+1] + dp[i-1][j-1]) % mod
//        }
//        
//    }
//}

if n > 1 {
    for i in 2...n {
        for j in 0...9 {
            if j == 0 {
                dp[i][0] = dp[i-1][1] % mod
            } else if j == 9 {
                dp[i][9] = dp[i-1][8] % mod
            } else {
                dp[i][j] = (dp[i-1][j-1] + dp [i-1][j+1]) % mod
            }
        }
    }
}

print((dp[n].reduce(0) { $0+$1 }) % mod)
