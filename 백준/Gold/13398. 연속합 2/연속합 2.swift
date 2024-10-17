let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }
var dp1 = Array(repeating: 0, count: n)
var dp2 = Array(repeating: 0, count: n)
var result = arr[0]

dp1[0] = arr[0]
dp2[0] = arr[0]


for i in 1..<n {
    dp1[i] = max (arr[i], dp1[i-1] + arr[i])
    dp2[i] = max (dp1[i-1], dp2[i-1] + arr[i])
    result = max(result, dp1[i], dp2[i])
}

print(result)


