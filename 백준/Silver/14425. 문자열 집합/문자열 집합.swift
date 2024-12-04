let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]

var nArr: [String: Int] = [:]

for _ in 0..<n {
    let s = readLine()!
    nArr[s,default: 0] += 1
}

var count = 0
for _ in 0..<m {
    let s = readLine()!
    if (nArr[s] ?? 0) >= 1 {
        count += 1
    }
}

print(count)

