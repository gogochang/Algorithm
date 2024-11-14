import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0]
let m = nm[1]

var board = [[Character]]()
for _ in 0..<n {
    let row = Array(readLine()!)
    board.append(row)
}

var visited = Array(repeating: Array(repeating: false, count: m), count: n)
let directions = [(0, 1), (1, 0), (0, -1), (-1, 0)]

func isInBounds(_ x: Int, _ y: Int) -> Bool {
    return x >= 0 && x < n && y >= 0 && y < m
}

func dfs(_ x: Int, _ y: Int, _ startX: Int, _ startY: Int, _ color: Character) -> Bool {
    if visited[x][y] {
        return true
    }

    visited[x][y] = true

    for direction in directions {
        let newX = x + direction.0
        let newY = y + direction.1

        if isInBounds(newX, newY), board[newX][newY] == color {
            if !(newX == startX && newY == startY) { // If it is not the previous cell
                if dfs(newX, newY, x, y, color) {
                    return true
                }
            }
        }
    }

    return false
}

func findCycle() -> Bool {
    for i in 0..<n {
        for j in 0..<m {
            if !visited[i][j] {
                if dfs(i, j, -1, -1, board[i][j]) {
                    return true
                }
            }
        }
    }
    return false
}

print(findCycle() ? "Yes" : "No")
