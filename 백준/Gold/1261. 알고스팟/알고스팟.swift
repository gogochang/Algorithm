let directions = [(0, 1), (1, 0), (0, -1), (-1, 0)]

// 입력 받기
let input = readLine()!.split(separator: " ").map { Int($0)! }
let m = input[0], n = input[1]

var maze = [[Int]]()
for _ in 0..<n {
    maze.append(readLine()!.map { Int(String($0))! })
}

var visited = Array(repeating: Array(repeating: false, count: m), count: n)

// 최소 벽 부수기 계산
func bfs() -> Int {
    var deque = [(x: Int, y: Int, brokenWalls: Int)]()
    deque.append((x: 0, y: 0, brokenWalls: 0))
    
    var index = 0
    visited[0][0] = true
    
    while index < deque.count {
        let current = deque[index]
        index += 1
        
        // 도착지점에 도달
        if current.x == n - 1 && current.y == m - 1 {
            return current.brokenWalls
        }
        
        for direction in directions {
            let nx = current.x + direction.0
            let ny = current.y + direction.1
            
            // 유효한 좌표인지 확인
            if nx >= 0 && nx < n && ny >= 0 && ny < m && !visited[nx][ny] {
                visited[nx][ny] = true
                if maze[nx][ny] == 0 {
                    deque.insert((x: nx, y: ny, brokenWalls: current.brokenWalls), at: index)
                } else {
                    deque.append((x: nx, y: ny, brokenWalls: current.brokenWalls + 1))
                }
            }
        }
    }
    return -1 // 도달 불가능한 경우
}

print(bfs())
