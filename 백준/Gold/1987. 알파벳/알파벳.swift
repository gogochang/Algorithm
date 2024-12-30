

let input = readLine()!.split(separator: " ").map { Int($0)! }
let R = input[0] // 세로 길이
let C = input[1] // 가로 길이
var grid: [[Int]] = []
for _ in 0..<R {
    let row = readLine()!.map { Int($0.asciiValue ?? 65) - 65 }
    grid.append(row)
}
var directions: [(Int, Int)] = [
    (-1, 0), (1, 0), // 상하
    (0, -1), (0, 1), // 좌우
]

var result = 0
func dfs(_ y: Int, _ x: Int, _ count: Int, _ bitmask: Int) {
    result = max( result, count)
    
    for (dy, dx) in directions {
        let ny = y + dy
        let nx = x + dx
        
        if ny >= 0, nx >= 0, ny < R, nx < C {
            let newBitmask = 1 << grid[ny][nx]
            if bitmask & newBitmask == 0 {
                dfs(ny, nx, count + 1, bitmask | newBitmask)
            }
        }
    }
}

dfs(0, 0, 1,  1 << grid[0][0])
print(result)
