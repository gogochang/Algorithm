let n = Int(readLine()!)! // 지도의 크기
var map = [[Int]]()
var visited = Array(repeating: Array(repeating: false, count: n), count: n)
var complexes = [Int]() // 단지별 집의 수를 저장할 배열

// 지도 입력 받기
for _ in 0..<n {
    let line = Array(readLine()!).map { Int(String($0))! }
    map.append(line)
}

// 방향 배열 (상, 하, 좌, 우)
let directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]

// DFS 함수
func dfs(x: Int, y: Int) -> Int {
    // 집의 수 카운트 시작
    var count = 1
    visited[x][y] = true
    
    for dir in directions {
        let nx = x + dir.0
        let ny = y + dir.1
        
        // 지도 범위 안에 있고,
        if nx >= 0 && nx < n && ny >= 0 && ny < n {
            if map[nx][ny] == 1, // 집이 있으며,
               !visited[nx][ny] { // 방문하지 않은 경우
                count += dfs(x: nx, y: ny)
            }
        }
    }
    return count
}

// 전체 지도 탐색
for i in 0..<n {
    for j in 0..<n {
        // 집이 있는 곳이면서 방문하지 않은 경우
        if map[i][j] == 1 && !visited[i][j] {
            let complexSize = dfs(x: i, y: j)
            complexes.append(complexSize)
        }
    }
}

// 결과 출력
complexes.sort() // 오름차순 정렬
print(complexes.count) // 단지 수
for complex in complexes {
    print(complex) // 각 단지 내 집의 수
}
