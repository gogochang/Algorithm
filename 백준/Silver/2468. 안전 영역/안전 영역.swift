let n = Int(readLine()!)!
var grid: [[Int]] = []
var maxNum = 0
for _ in 0..<n {
    let row = readLine()!.split(separator: " ").map { Int($0)! }
    maxNum = max(maxNum, row.max()! )
    grid.append(row)
}
let directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]


func dfs(x: Int, y: Int, target: Int, visited: inout [[Bool]]) {
    visited[x][y] = true
    
    for (dx, dy) in directions {
        let nx = x + dx
        let ny = y + dy
        
        if nx >= 0 && ny >= 0 && nx < n && ny < n {
            if grid[nx][ny] > target && !visited[nx][ny] {
                dfs(x: nx, y: ny, target: target, visited: &visited)
            }
        }
    }
}

var maxSafeAreas = 0

for target in 0...maxNum {
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: n), count: n)
    var safeAreas = 0
    
    for i in 0..<n {
        for j in 0..<n {
            if grid[i][j] > target && !visited[i][j] {
                safeAreas += 1
                dfs(x: i, y: j, target: target, visited: &visited)
            }
        }
    }
    
    maxSafeAreas = max(maxSafeAreas, safeAreas)
}

print(maxSafeAreas)