let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]

var matrixA: [[Int]] = []
var matrixB: [[Int]] = []
var answer = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
for _ in 0..<n {
    matrixA.append(readLine()!.split(separator: " ").map{ Int($0)! })
}

for _ in 0..<n {
    matrixB.append(readLine()!.split(separator: " ").map{ Int($0)! })
}

for i in 0..<n {
    for j in 0..<m {
        answer[i][j] = matrixA[i][j] + matrixB[i][j]
    }

}
for i in 0..<n {
    answer[i].forEach { print($0, terminator: " ") }
    print()
}