let n = Int(readLine()!)!
var grid = [[Int]]()
var sharkPosition = (x: 0, y: 0)
var sharkSize = 2
var eatenFish = 0
var time = 0

for i in 0..<n {
    let row = readLine()!.split(separator: " ").map { Int($0)! }
    grid.append(row)
    if let x = row.firstIndex(of: 9) {
        sharkPosition = (x: i, y: x)
        grid[i][x] = 0
    }
}

// 방향 상좌우하
let directions: [(Int, Int)] = [(-1, 0), (0, -1), (0, 1), (1, 0)]

func bfs(start: (x: Int, y: Int)) -> ((x: Int, y: Int), Int)? {
    var queue = [(x: Int, y: Int, distance: Int)]()
    var visited = Array(repeating: Array(repeating: false, count: n) ,count: n)
    var fishList = [(x: Int, y: Int, distance: Int)]()
    
    queue.append((start.x, start.y, 0))
    visited[start.x][start.y] = true
    
    while !queue.isEmpty {
        let (x, y, distance) = queue.removeFirst()
        
        for direction in directions {
            let (dx, dy) = direction
            let nx = dx + x
            let ny = dy + y
            if nx >= 0, ny >= 0, nx < n, ny < n, !visited[nx][ny] {
                if grid[nx][ny] <= sharkSize {
                    visited[nx][ny] = true
                    queue.append((nx, ny, distance + 1))
                    
                    if grid[nx][ny] > 0 && grid[nx][ny] < sharkSize {
                        fishList.append((nx, ny, distance + 1))
                    }
                }
            }
        }
    }
    
    // 가장 가까운 피시를 찾는다.
    if fishList.isEmpty {
        return nil
    } else {
        fishList.sort {
            if $0.distance == $1.distance {
                if $0.x == $1.x {
                    return $0.y < $1.y
                }
                return $0.x < $1.x
            }
            return $0.distance < $1.distance
        }
        return ((fishList[0].x, fishList[0].y), fishList[0].distance)
    }
}

while true {
    if let (target, distance) = bfs(start: sharkPosition) {
        let (x, y) = target
        sharkPosition = (x, y) // 상어 이동
        time += distance // 이동 시간 누적
        eatenFish += 1
        grid[x][y] = 0 // 물고기 먹음
        
        if eatenFish == sharkSize {
            sharkSize += 1
            eatenFish = 0
        }
    } else {
        break
    }
}

print(time)
