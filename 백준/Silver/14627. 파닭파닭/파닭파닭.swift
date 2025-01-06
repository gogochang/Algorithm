// 입력 처리
let input = readLine()!.split(separator: " ").map { Int($0)! }
let s = input[0] // 파의 개수
let c = input[1] // 파닭의 개수
var lengths = [Int]()
for _ in 0..<s {
    lengths.append(Int(readLine()!)!)
}

func countOnions(cutLength: Int) -> Int {
    return lengths.reduce(0) { $0 + ($1 / cutLength) }
}
var left = 1
var right = lengths.max()!
var result = right

while left <= right {
    let mid = (left + right) / 2
    let currentCount = countOnions(cutLength: mid)

    if currentCount >= c {
        result = mid
        left = mid + 1
    } else {
        right = mid - 1
    }
}
let totalLength = lengths.reduce(0 , +)
let usedLength = result * c
let remainingLength = totalLength - usedLength
print(remainingLength)