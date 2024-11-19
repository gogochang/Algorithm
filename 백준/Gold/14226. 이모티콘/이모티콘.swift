let S = Int(readLine()!)!
let maxCount = 1000

// (현재 화면 이모티콘 개수, 클립보드 이모티콘 개수, 시간)
var queue = [(screen: Int, clipBoard: Int, time: Int)]()
queue.append((screen: 1, clipBoard: 0, time: 0))

// 방문 여부를 저장한 2차원 배열
var visited = [[Bool]](repeating: [Bool](repeating: false, count: maxCount + 1), count: maxCount + 1)


func bfs() {
    while !queue.isEmpty {
        let (screen, clipboard, time) = queue.removeFirst()
        
        if screen == S {
            print(time)
            return
        }
        
        // 1. 복사 연산
        if screen > 0 && screen <= maxCount && !visited[screen][screen] {
            visited[screen][screen] = true
            queue.append((screen, screen, time + 1))
        }
        // 2. 붙여넣기 연산
        if clipboard > 0 && screen + clipboard <= maxCount && !visited[screen + clipboard][clipboard] {
            visited[screen + clipboard][clipboard] = true
            queue.append((screen + clipboard, clipboard, time + 1 ))
        }
        
        // 3. 삭제 연산
        if screen > 0 && !visited[screen - 1][clipboard] {
            visited[screen - 1][clipboard] = true
            queue.append((screen - 1, clipboard, time + 1))
        }
    }
}

bfs()
