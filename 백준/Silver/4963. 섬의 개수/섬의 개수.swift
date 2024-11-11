while true {
    // 맵의 가로, 세로 크기
    let wh = readLine()!.split(separator: " ").map { Int($0)! }
    let w = wh[0] // 맵의 가로 크기
    let h = wh[1] // 맵의 세로 크기
    
    if w == 0, h == 0 {
        break
    }
    
    // 맵 정의
    var map = [[Int]]()
    for _ in 0..<h {
        let line = readLine()!.split(separator: " ").map { Int($0)! }
        map.append(line)
    }
    
    // 맵 방문 여부 확인 배열
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: w), count: h)
    
    // 확인할 방향 ( 상,하,좌,우, 대각선에 땅이 있으면 같은 땅이다.)
    let directions = [
        (-1, -1), (0, -1), (1, -1),
        (-1, 0), (1, 0),
        (-1, 1), (0, 1), (1, 1)
    ]
    
    // 섬의 개수를 담는 변수
    var isLandCount = 0
    
    func dfs(_ x: Int, _ y: Int) {
        visited[y][x] = true
        var count = 1
        
        for (dx, dy) in directions {
            let nx = x + dx
            let ny = y + dy
            
            // 조건1. 확인하고자 하는 위치가 맵을 벗어나지 않는다.
            // 조건2. 방문한적이 없다.
            // 조건3. 맵의 위치에 값이 1(땅)이여야 한다.
            if nx >= 0 && nx < w && ny >= 0 && ny < h { // 조건1
                if !visited[ny][nx] { // 조건2
                    if map[ny][nx] == 1 {
                        dfs(nx, ny)
                    }
                }
            }
        }
    }
    
    for i in 0..<w {
        for j in 0..<h {
            if !visited[j][i], map[j][i] == 1 {
                dfs(i, j)
                isLandCount += 1
            }
        }
    }
    
    print(isLandCount)
    
}
