var arr: [Int] = []
for _ in 0..<5 {
    arr.append(Int(readLine()!)!)
}

for _ in 0..<arr.count-1 {
    for j in 0..<arr.count-1 {
        if arr[j] > arr[j+1] {
            let temp = arr[j]
            arr[j] = arr[j+1]
            arr[j+1] = temp
        }
    }
}

print(arr.reduce(0, {$0+$1})/5)
print(arr[arr.count/2])