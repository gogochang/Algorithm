// 방향 상,하,좌,우
let directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]

// dfs
func dfs(x: Int,
         y: Int,
         grid: inout [[Int]],
         visited: inout [[Bool]],
         rows: Int,
         cols: Int
) {
    visited[x][y] = true
    for (dx, dy) in directions {
        let nx = x + dx
        let ny = y + dy
        
        if nx >= 0 && ny >= 0 && nx < rows && ny < cols {
            if grid[nx][ny] == 1 && !visited[nx][ny] {
                dfs(x: nx,
                    y: ny,
                    grid: &grid,
                    visited: &visited,
                    rows: rows,
                    cols: cols
                )
            }
        }
        
    }
}

// 테스트 케이스 입력
let tc = Int(readLine()!)!

for _ in 0..<tc {
    // 입력
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let cols = input[0]
    let rows = input[1]
    let cabbageCount = input[2]
    
    // 그래프와 방문 배열 초기화
    var grid = Array(repeating: Array(repeating: 0, count: cols), count: rows)
    var visited = Array(repeating: Array(repeating: false, count: cols), count: rows)
    
    // 배추 위치 표시
    for _ in 0..<cabbageCount {
        let position = readLine()!.split(separator: " ").map { Int($0)! }
        let y = position[0]
        let x = position[1]
        grid[x][y] = 1
    }
    
    var wormCount = 0
    
    // 배추 군집 탐색
    for x in 0..<rows {
        for y in 0..<cols {
            if grid[x][y] == 1 && !visited[x][y] {
                dfs(x: x, y: y, grid: &grid, visited: &visited, rows: rows, cols: cols)
                wormCount += 1
            }
        }
    }
    
    print(wormCount)
}

