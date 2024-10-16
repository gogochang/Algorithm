let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }
var dp = arr

for i in 1..<n {
    for j in 0..<i {
        if arr[i] > arr[j] {
            dp[i] = max(dp[i], dp[j] + arr[i])
        }
    }
}

print(dp.max()!)
