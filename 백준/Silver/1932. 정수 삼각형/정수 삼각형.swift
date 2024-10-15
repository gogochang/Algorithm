let n = Int(readLine()!)!
var triangle: [[Int]] = Array(repeating: [], count: n+1)
var dp: [[Int]] = Array(repeating: [], count: n+1)
for i in 1...n {
    triangle[i] = readLine()!.split(separator:" ").map { Int($0)! }
    triangle[i].insert(0, at: 0)
    triangle[i].append(0)
    dp[i] = Array(repeating: 0, count: triangle.count)
}
dp[1] = triangle[1]

if n == 1 {
    print(triangle[1][1])
} else {
    for i in 2...n {
        for j in 1...i {
            dp[i][j] = max(dp[i-1][j] + triangle[i][j], dp[i-1][j-1] + triangle[i][j])
            
        }
    }
    print(dp[n].max()!)
}
