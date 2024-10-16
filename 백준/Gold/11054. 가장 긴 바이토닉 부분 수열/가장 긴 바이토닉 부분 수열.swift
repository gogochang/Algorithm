let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }
var lis = Array(repeating: 1, count: n)
var lds = Array(repeating: 1, count: n)


// lis 계산
for i in 0..<n {
    for j in 0..<i {
        if arr[j] < arr[i] {
            lis[i] = max(lis[i], lis[j]+1)
        }
    }
}

// lsd 계산
for i in (0..<n).reversed() {
    for j in (i+1)..<n {
        if arr[i] > arr[j] {
            lds[i] = max(lds[i], lds[j]+1)
        }
    }
}
var maxLength = 0
for i in 0..<n {
    maxLength = max(maxLength, lis[i] + lds[i] - 1)
}

print(maxLength)
