let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]
var firstMatrix: [[Int]] = [], secondMatrix: [[Int]] = []
var result = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
for _ in 0..<n {
    firstMatrix.append(readLine()!.split(separator: " ").map{ Int($0)! })
}

for _ in 0..<n {
    secondMatrix.append(readLine()!.split(separator: " ").map{ Int($0)! })
}

for i in 0..<n {
    for j in 0..<m {
        result[i][j] = firstMatrix[i][j] + secondMatrix[i][j]
    }
    print(result[i].map{String($0)}.joined(separator: " "))
}