var input = readLine()!.split(separator: " ").map { Int($0)! }
var arr = readLine()!.split(separator: " ").map { Int($0)! }

for _ in 0..<arr.count-1 {
    for j in 0..<arr.count-1 {
        if arr[j] < arr[j+1] {
            let temp = arr[j]
            arr[j] = arr[j+1]
            arr[j+1] = temp
        }
    }
}

print(arr[input[1]-1])