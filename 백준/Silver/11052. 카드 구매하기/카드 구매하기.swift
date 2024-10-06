let n = Int(readLine()!)! // 구하고자 하는 카드의 개수 N
let p = [0] + readLine()!.split(separator: " ").map {Int($0)!}
var dp = Array(repeating: 0, count: n+1) // 구하고자 하는 N개의 카드수 지불 최댓값을 저장할 배열

for i in 1...n {
    for j in 1...i {
        dp[i] = max(dp[i], dp[i-j] + p[j])
    }
}

print(dp[n])