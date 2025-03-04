import Foundation

let n = Int(readLine()!)!
var board = [[Int]]()

for _ in 0..<n {
    board.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func bfs() -> String {
    var queue = [(0, 0)]
    var visited = Array(repeating: Array(repeating: false, count: n), count: n)
    
    while !queue.isEmpty {
        let (x, y) = queue.removeFirst()
        let jump = board[x][y]
        
        if jump == -1 { return "HaruHaru" }
        if visited[x][y] { continue }
        
        visited[x][y] = true
        
        // 오른쪽 이동
        if y + jump < n { queue.append((x, y + jump)) }
        // 아래쪽 이동
        if x + jump < n { queue.append((x + jump, y)) }
    }
    
    return "Hing"
}

print(bfs())
