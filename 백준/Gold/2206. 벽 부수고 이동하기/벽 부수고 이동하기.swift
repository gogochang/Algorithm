let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]
var grid: [[Int]] = []
for _ in 0..<n {
    let row = readLine()!.map { Int(String($0))! }
    grid.append(row)
}
// (y, x, distance, wallBroken)
var queue: [(Int, Int, Int, Bool)] = [(0, 0, 1, false)]
var visited: [[[Bool]]] = Array(repeating: Array(repeating: [false, false], count: m), count: n)
var directions: [(Int, Int)] = [
    (-1, 0), (1, 0), // 상하
    (0, -1), (0, 1) // 좌우
]

func bfs() -> Int {
    var idx = 0
    
    while idx < queue.count {
        let (y, x, distance, wallBroken) = queue[idx]
        idx += 1
        
        if y == n - 1 && x == m - 1 {
            return distance
        }
        
        for (dy, dx) in directions {
            let ny = y + dy
            let nx = x + dx
            
            if ny >= 0, nx >= 0, ny < n, nx < m {
                if grid[ny][nx] == 0 { // 다음 위치가 벽이 없으면,
                    if wallBroken && !visited[ny][nx][0] {
                        visited[ny][nx][0] = true
                        queue.append((ny, nx, distance + 1, true))
                    } else if !wallBroken && !visited[ny][nx][1] {
                        visited[ny][nx][1] = true
                        queue.append((ny, nx, distance + 1, false))
                    }
                } else if grid[ny][nx] == 1 { //다음 위치가 벽이면
                    if !wallBroken {
                        visited[ny][nx][1] = true
                        queue.append((ny, nx, distance + 1, true))
                    }
                }
            }
        }
    }
    
    return -1
}

let result = bfs()
print(result)
