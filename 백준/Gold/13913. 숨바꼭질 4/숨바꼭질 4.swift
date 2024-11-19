let NK = readLine()!.split(separator: " ").map { Int($0)! }
let N = NK[0]
let K = NK[1]
let maxPosition = 100000

var parent = [Int](repeating: -1, count: maxPosition + 1) // 경로 추적을 위한 부모 배열
var visited = [Bool](repeating: false, count: maxPosition + 1) // 방문 확인을 위한 배열
var queue = [(position: Int, count: Int)]()

func bfs(_ N: Int, _ K: Int) -> Int {
    if N == K {
        return 0
    }
    while !queue.isEmpty {
        // queue에 들어있는 순서대로 가져와 사용
        let current = queue.removeFirst()
        let currentPosition = current.position // 현재 위치
        let currentCount = current.count // 현재 이동 횟수
        
        // 수빈이가 다음시간에 이동할 수 있는 경우의 수
        let nextPositions = [
            currentPosition + 1,
            currentPosition - 1,
            currentPosition * 2
        ]
        
        // 현재위치로 X+1, X+2, X*2로 이동했을 때의 경우를 확인합니다.
        // visited를 통해 이미 방문한적이 있다면 확인하지 않고 넘어간다.
        for next in nextPositions {
            // 수빈이의 다음 위치가 동생의 위치와 일치하면 도착!
            if next == K {
                parent[next] = currentPosition
                return currentCount + 1
            }
            
            if next >= 0 && // 현재위치 기준으로 다음 위치가 0보다 크고,
                next <= maxPosition && // 다음 위치가 100,000보다 작고,
                !visited[next] { // 방문한적이 없으면 확인한다.
                
                visited[next] = true // 지금 방문하기때문에 true로 변경
                parent[next] = currentPosition
                queue.append((position: next, count: currentCount + 1))
                // queue에 현재 위치, 현재 이동횟수를 저장한다.
            }
            
        }
    }
    return -1
}

func reconstructPath(_ start: Int, _ end: Int) -> [Int] {
    var path = [end]
    var current = end
    while current != start {
        current = parent[current]
        path.append(current)
    }
    return path.reversed()
}

queue.append((position: N, count: 0))
visited[N] = true

let time = bfs(N,K)
let path = reconstructPath(N, K)

// 결과 출력
print(time)
print(path.map { String($0) }.joined(separator: " "))
