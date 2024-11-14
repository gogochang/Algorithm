let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0]
let m = nm[1]

var board = [[Character]]()
for _ in 0..<n {
    board.append(Array(readLine()!))
}
var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
let directions = [(-1,0), (1,0), (0, -1), (0, 1)]

func isInBounds(_ x: Int, _ y: Int) -> Bool {
    return x >= 0 && x < n && y >= 0 && y < m
}

// dfs
func dfs(_ x: Int, _ y: Int, _ startX: Int, _ startY: Int, _ color: Character) -> Bool {
    if visited[x][y] {
        return true
    }
    
    visited[x][y] = true
    
    for (dx, dy) in directions {
        let nx = x + dx
        let ny = y + dy
        
        if isInBounds(nx, ny), board[nx][ny] == color {
            if !(nx == startX && ny == startY) {
                if dfs(nx, ny, x, y, color) {
                    return true
                }
            }
        }
    }
    
    visited[x][y] = false
    return false
}

func findCycle() -> Bool {
    for i in 0..<n {
        for j in 0..<m {
            if dfs(i, j, -1, -1, board[i][j]) {
                return true
            }
        }
    }
    return false
}

print(findCycle() ? "Yes" : "No")
