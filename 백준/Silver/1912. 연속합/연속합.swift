let n = Int(readLine()!)!
let sequence = readLine()!.split(separator: " ").map {Int($0)!}
var dp = Array(repeating: -1001, count: n)
dp[0] = sequence[0]

for i in 1..<n {
    dp[i] = max(sequence[i], dp[i-1] + sequence[i])
}
print(dp.max()!)
