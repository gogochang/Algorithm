let tc = Int(readLine()!)!
for _ in 0..<tc {
    let l = Int(readLine()!)!
    let startPoint = readLine()!.split(separator: " ").map { Int($0)! }
    let endPoint = readLine()!.split(separator: " ").map { Int($0)! }
    var map: [[Int]] = Array(repeating: Array(repeating: 0, count: l), count: l)
    
    // queue 초기값 설정
    var queue = [(Int, Int)]()
    queue.append((startPoint[0],startPoint[1]))
    
    let directions = [
        (-2, 1), (-1, 2),
        (1, 2), (2, 1),
        (2, -1), (1, -2),
        (-1, -2), (-2, -1)
    ]
    
    // bfs
    func bfs() {
        while !queue.isEmpty {
            let (x,y) = queue.removeFirst()
            
            for (dx, dy) in directions {
                let nx = x + dx
                let ny = y + dy
                
                if nx >= 0 && nx < l && ny >= 0, ny < l {
                    if map[nx][ny] == 0 {
                        map[nx][ny] = map[x][y] + 1
                        queue.append((nx, ny))
                    }
                }
            }
        }
    }
    
    bfs()
    if startPoint == endPoint {
        print(0)
    } else {
        print(map[endPoint[0]][endPoint[1]])
    }
}
