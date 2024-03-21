let N = Int(readLine()!)!
var arr: [Int] = []
for _ in 0..<N {
    arr.append(Int(readLine()!)!)
}

for _ in 0..<N-1 {
    for j in 0..<N-1 {
        if arr[j] > arr[j+1] {
            let temp = arr[j]
            arr[j] = arr[j+1]
            arr[j+1] = temp
        }
    }
}

for num in arr {
    print(num)
}