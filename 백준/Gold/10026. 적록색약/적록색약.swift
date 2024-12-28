let n = Int(readLine()!)!
var grid: [[Character]] = []
var grid2: [[Character]] = []
//var colorPositions: [[(Int, Int)]] = Array(repeating: [], count: 3) // 0: R, 1: G, 2: B 의 좌표
var directions: [(Int, Int)] = [(-1, 0), (1, 0), (0, -1), (0, 1)]
var colorPositions: [Character: [(Int, Int)]] = [:]

for i in 0..<n {
    let row = Array(readLine()!)
    grid.append(row)
    grid2.append(row.map { $0 == "R" || $0 == "G" ? "X" : $0 })
    
    for j in 0..<row.count {
        colorPositions[row[j], default: []].append((i,j))
    }
}


func bfs(_ x: Int, _ y: Int, _ color: Character, _ grid: inout [[Character]], _ visited: inout [[Bool]]) {
    var queue = [(x,y)]
    while !queue.isEmpty {
        let (x, y) = queue.removeFirst()
        
        for (dx, dy) in directions {
            let nx = x + dx
            let ny = y + dy
            if nx >= 0, ny >= 0, nx < n, ny < n {
                if grid[nx][ny] == color && !visited[nx][ny] {
                    visited[nx][ny] = true
                    queue.append((nx, ny))
                }
            }
        }
    }
}

var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: n), count: n)

var result = 0
for x in 0..<n {
    for y in 0..<n {
        if !visited[x][y] {
            visited[x][y] = true
            result += 1
            bfs(x, y, grid[x][y], &grid, &visited)
        }
    }
}

visited = Array(repeating: Array(repeating: false, count: n), count: n)
var result2 = 0
for x in 0..<n {
    for y in 0..<n {
        if !visited[x][y] {
            visited[x][y] = true
            result2 += 1
            bfs(x, y, grid2[x][y], &grid2, &visited)
        }
    }
}


print(result, result2)
