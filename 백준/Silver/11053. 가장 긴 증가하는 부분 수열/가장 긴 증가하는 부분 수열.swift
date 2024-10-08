let length = Int(readLine()!)!
let A = readLine()!.split(separator: " ").map { Int($0)! }
var dp = Array(repeating: 1, count: length)

for i in 1..<length {
    for j in 0..<i {
        if A[j] < A[i] {
            dp[i] = max(dp[i], dp[j] + 1)
        }
    }
}

print(dp.max()!)
