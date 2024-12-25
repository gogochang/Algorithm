import Foundation

let n = Int(readLine()!)!
var map = [[Int]]()

var maxHeight = 0

for _ in 0..<n {
    let row = readLine()!.split(separator: " ").map { Int($0)! }
    maxHeight = max(maxHeight, row.max()!)
    map.append(row)
}

let directions = [(0, 1), (0, -1), (1, 0), (-1, 0)]

func isValid(_ x: Int, _ y: Int) -> Bool {
    return x >= 0 && x < n && y >= 0 && y < n
}

func dfs(_ x: Int, _ y: Int, _ visited: inout [[Bool]], _ height: Int) {
    var stack = [(x, y)]
    visited[x][y] = true
    
    while !stack.isEmpty {
        let (cx, cy) = stack.removeLast()
        for (dx, dy) in directions {
            let nx = cx + dx, ny = cy + dy
            if isValid(nx, ny) && !visited[nx][ny] && map[nx][ny] > height {
                visited[nx][ny] = true
                stack.append((nx, ny))
            }
        }
    }
}

var maxSafeAreas = 0

for height in 0...maxHeight {
    var visited = Array(repeating: Array(repeating: false, count: n), count: n)
    var safeAreas = 0
    
    for i in 0..<n {
        for j in 0..<n {
            if !visited[i][j] && map[i][j] > height {
                dfs(i, j, &visited, height)
                safeAreas += 1
            }
        }
    }
    maxSafeAreas = max(maxSafeAreas, safeAreas)
}

print(maxSafeAreas)
