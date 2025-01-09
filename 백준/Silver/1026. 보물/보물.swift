let n = Int(readLine()!)!
let aArr = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
let bArr = readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: >)

var result = 0
for i in 0..<n {
    result += aArr[i] * bArr[i]
}
print(result)
