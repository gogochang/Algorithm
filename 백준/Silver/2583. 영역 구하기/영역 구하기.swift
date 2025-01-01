let input = readLine()!.split(separator: " ").map { Int($0)! }
let m = input[0]
let n = input[1]
let k = input[2]
var grid: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: m)
var spaces: [[Int]]
var startQuadrangles: [(Int,Int)] = []
var endQuadrangles: [(Int,Int)] = []
for _ in 0..<k {
    let row = readLine()!.split(separator: " ").map { Int($0)! }
    startQuadrangles.append((row[0], row[1]))
    endQuadrangles.append((row[2], row[3]))
}


for i in 0..<startQuadrangles.count {
    let (sx, sy) = startQuadrangles[i]
    let (ex, ey) = endQuadrangles[i]
    
    for x in sx..<ex {
        for y in sy..<ey {
            grid[y][x] = 1
        }
    }
}

let directions: [(Int, Int)] = [
    (-1, 0), (1, 0), (0, -1), (0, 1)
]

var queue: [(Int, Int)] = []
var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: n), count: m)
var count = 0
var results: [Int] = []
for y in 0..<m {
    for x in 0..<n {
        if grid[y][x] == 0 && !visited[y][x] {
            count += 1
            visited[y][x] = true
            bfs(y: y, x: x, count: count)
        }
    }
}


func bfs(y: Int, x: Int, count: Int) {
    var result = 1
    var queue = [(y, x)]
    var idx = 0
    while idx < queue.count {
        let size = queue.count
        for _ in idx..<size {
            let (y, x) = queue[idx]
            idx += 1
            
            for (dy, dx) in directions {
                let ny = y + dy
                let nx = x + dx
                
                if ny >= 0, nx >= 0, ny < m, nx < n {
                    if !visited[ny][nx] && grid[ny][nx] == 0 {
                        result += 1
                        visited[ny][nx] = true
                        queue.append((ny, nx))
                    }
                }
            }
        }
    }
    
    results.append(result)
}

print(count)
print(results.sorted().map{ String($0)}.joined(separator: " "))
