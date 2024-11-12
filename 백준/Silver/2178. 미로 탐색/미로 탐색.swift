let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0] // 행의 개수
let m = nm[1] // 열의 개수

var maze = [[Int]]()
for _ in 0..<n {
    let row = Array(readLine()!).map { Int(String($0))! }
    maze.append(row)
}

//BFS에 필요한 큐와 방향 배열 정의
var queue = [(Int, Int)]()
queue.append((0, 0)) // 시작점 (0,0) 추가
let directions = [(-1,0), (1, 0), (0, -1), (0, 1)]

// BFS 함수
func bfs() {
    while !queue.isEmpty {
        let (x,y) = queue.removeFirst()
        
        for (dx, dy) in directions {
            let nx = x + dx
            let ny = y + dy
            
            //조건1. 다음 위치가 미로 범위 내에 있다.
            //조건2. 이동할 수 있는 칸(1)이다.
            //조건3. 방문하지 않았다.
            if nx >= 0 && nx < n && ny >= 0 && ny < m {
                if maze[nx][ny] == 1 {
                    maze[nx][ny] = maze[x][y] + 1
                    queue.append((nx, ny))
                }
            }
        }
    }
}

bfs()
print(maze[n-1][m-1])
