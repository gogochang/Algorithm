import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]

var paper = [[Int]]()
for _ in 0..<n {
    paper.append(readLine()!.split(separator: " ").map { Int($0)! })
}

var visited = Array(repeating: Array(repeating: false, count: m), count: n)
let directions = [(0,1), (1,0), (0,-1), (-1,0)]

var maxArea = 0
var pictureCount = 0

func dfs(_ x: Int, _ y: Int) -> Int {
    visited[x][y] = true
    var area = 1
    
    for (dx, dy) in directions {
        let nx = x + dx, ny = y + dy
        
        if nx >= 0, nx < n, ny >= 0, ny < m, !visited[nx][ny], paper[nx][ny] == 1 {
            area += dfs(nx, ny)
        }
    }
    return area
}

// 전체 탐색
for i in 0..<n {
    for j in 0..<m {
        if paper[i][j] == 1 && !visited[i][j] {
            pictureCount += 1
            maxArea = max(maxArea, dfs(i, j))
        }
    }
}

// 결과 출력
print(pictureCount)
print(maxArea)
