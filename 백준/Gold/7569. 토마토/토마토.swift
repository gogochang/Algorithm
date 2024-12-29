let input = readLine()!.split(separator: " ").map { Int($0)! }
let m = input[0]
let n = input[1]
let h = input[2]
var grid: [[[Int]]] = Array(repeating: [], count: h)
var emptySpaces: [(Int, Int)] = []
var tomatos: [(Int, Int)] = []
var ripeTomatos: [(Int,Int)] = []
var visited: [[[Bool]]] = Array(repeating: Array(repeating: Array(repeating: false, count: m), count: n), count: h)

// 방향 (상,하,좌,우, 윗칸, 아랫칸), (x, y, z)
var directions: [(Int, Int, Int)] = [
    (-1, 0, 0), // 상
    (1, 0, 0),  // 하
    (0, -1, 0), // 좌
    (0, 1, 0),  // 우
    (0, 0, -1), // 윗칸
    (0, 0, 1)   // 아랫칸
]
for floor in 0..<h {
    for i in 0..<n {
        let row = readLine()!.split(separator: " ").map { Int($0)! }
        grid[floor].append(row)
        
        for j in 0..<row.count {
            if row[j] == -1 {
                emptySpaces.append((i,j))
            } else if row[j] == 1 {
                ripeTomatos.append((i,j))
            } else if row[j] == 0 {
                tomatos.append((i,j))
            }
        }
    }
}

var queue: [(Int, Int, Int)] = []
var unripeCount = 0

for z in 0..<h {
    for y in 0..<n {
        for x in 0..<m {
            if grid[z][y][x] == 1 {
                queue.append((z,y,x))
            } else if grid[z][y][x] == 0 {
                unripeCount += 1
            }
        }
    }
}

func bfs() -> Int {
    var days = -1 // 시작을 -1로 설정해 첫 번째 반복에서 0일을 맞춘다.
    var idx = 0
    
    while idx < queue.count {
        let size = queue.count
        for _ in idx..<size {
            let (z,y,x) = queue[idx]
            idx += 1
            
            for (dz, dy, dx) in directions {
                let nz = z + dz
                let ny = y + dy
                let nx = x + dx
                
                // 범위 내에 있고, 익지 않은 토마토일 경우
                if nz >= 0, ny >= 0, nx >= 0, nz < h, ny < n, nx < m {
                    if grid[nz][ny][nx] == 0 {
                        grid[nz][ny][nx] = 1
                        queue.append((nz, ny, nx))
                        unripeCount -= 1
                    }
                }
            }
        }
        days += 1
    }
    return days
}

let result = bfs()
if unripeCount > 0 {
    print(-1)
} else {
    print(result)
}
