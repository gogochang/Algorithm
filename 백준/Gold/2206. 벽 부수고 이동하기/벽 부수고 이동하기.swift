let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]
var grid: [[Int]] = []

for _ in 0..<n {
    let row = readLine()!.map { Int(String($0))! }
    grid.append(row)
}

//queue: (y, x, distance, wallBroken)
var queue: [(Int, Int, Int, Bool)] = [(0, 0, 1, false)]
var visited: [[[Bool]]] = Array(repeating: Array(repeating: [false, false], count: m) ,count: n)

visited[0][0][0] = true

let directions: [(Int, Int)] = [
    (-1, 0), (1, 0), // 상하
    (0, -1), (0, 1), // 좌우
]

func bfs() -> Int {
    var idx = 0
    while idx < queue.count {
        let (y, x, distance, wallBroken) = queue[idx]
        idx += 1
        
        // 도착 지점 도달 시 거리 반환
        if y == n - 1 && x == m - 1 {
            return distance
        }
        
        for (dy, dx) in directions {
            let ny = y + dy
            let nx = x + dx
            
            if ny >= 0, nx >= 0, ny < n, nx < m {
                if grid[ny][nx] == 0 {
                    // 벽을 부수지 않고 이동
                    if !wallBroken && !visited[ny][nx][0] {
                        visited[ny][nx][0] = true
                        queue.append((ny, nx, distance + 1, false))
                    } else if wallBroken && !visited[ny][nx][1] {
                        visited[ny][nx][1] = true
                        queue.append((ny, nx, distance + 1, true))
                    }
                } else if grid[ny][nx] == 1 {
                    // 벽을 부수고 이동
                    if !wallBroken {
                        visited[ny][nx][1] = true
                        queue.append((ny, nx, distance + 1, true))
                    }
                }
            }
        }
    }
    return -1 // 도달이 불가능 한 경우
}

let result = bfs()
print(result)
