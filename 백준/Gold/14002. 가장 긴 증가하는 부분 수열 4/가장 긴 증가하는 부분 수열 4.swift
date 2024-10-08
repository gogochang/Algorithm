let length = Int(readLine()!)!
let A = readLine()!.split(separator: " ").map {Int($0)!}
var dp: [Int] = Array(repeating: 1, count: length)
var prev = Array(repeating: -1, count: length)

for i in 1..<length {
    for j in 0..<i {
        if A[i] > A[j],
           dp[i] < dp[j] + 1
        {
            dp[i] = dp[j] + 1
            prev[i] = j
        }
    }
}

var maxLength = dp.max()!
var lastIndex = dp.firstIndex(of: maxLength)!

var lis = [Int]()
while lastIndex != -1 {
    lis.append(A[lastIndex])
    lastIndex = prev[lastIndex]
}

lis.reverse()

print(maxLength)
print(lis.map{String($0)}.joined(separator: " "))
