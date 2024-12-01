let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]
var arr: [String: Int] = [:]

for _ in 0..<n+m {
    arr[readLine()!,default: 0] += 1
}

var result = arr.filter {$0.value >= 2}.sorted { $0 < $1 }
print(result.count)
result.forEach {
    print($0.key)
}
