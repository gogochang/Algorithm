let n = Int(readLine()!)!
var cost = [[Int]]()
let INF = Int.max - 10000
for _ in 0..<n {
    cost.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

func solve(_ firstColor: Int) -> Int {
    var dp = Array(repeating: Array(repeating: INF, count: 3), count: n)
    
    // 첫 번째 집의 색을 고정
    dp[0][firstColor] = cost[0][firstColor]
    
    // 첫 번째 집은 고정했으니 다른 색들은 큰 값으로 설정해 채택되지 않게 만듦
    for j in 0..<3 where j != firstColor {
        dp[0][j] = INF
    }
    
    // 2번째 집부터 N번째 집까지 dp를 채워나감
    for i in 1..<n {
        dp[i][0] = cost[i][0] + min(dp[i-1][1], dp[i-1][2])
        dp[i][1] = cost[i][1] + min(dp[i-1][0], dp[i-1][2])
        dp[i][2] = cost[i][2] + min(dp[i-1][0], dp[i-1][1])
    }
    
    // 마지막 집(N번 집)은 첫 번째 집과 같은 색이 되면 안되므로 제외
    var result = Int.max
    for j in 0..<3 where j != firstColor {
        result = min(result, dp[n-1][j])
    }
    
    return result
}

var answer = INF

for firstColor in 0..<3 {
    answer = min(answer, solve(firstColor))
}

print(answer)
