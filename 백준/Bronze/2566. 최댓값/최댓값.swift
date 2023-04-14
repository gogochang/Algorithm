var matrix: [[Int]] = []
var maxValue = 0
for _ in 0..<9 {
    matrix.append(readLine()!.split(separator: " ").map{Int($0)!})
}
for i in 0..<9 {
    for j in 0..<9 {
        if matrix[i][j] > maxValue {
            maxValue = matrix[i][j]
        }
    }
}
print(maxValue)
for i in 0..<9 {
    for j in 0..<9 {
        if matrix[i][j] == maxValue {
            print(i + 1,j + 1)
        }
    }
}