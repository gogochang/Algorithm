// 입력 받기
let n = Int(readLine()!)! // 전체 사람 수
let target = readLine()!.split(separator: " ").map { Int($0)! } // 목표 노드
let m = Int(readLine()!)! // 관계의 수

var graph = [[Int]](repeating: [], count: n + 1) // 그래프 초기화
var visited = [Bool](repeating: false, count: n + 1)// 방문 여부 확인 배열

// 관계 입력 받기
for _ in 0..<m {
    let relation = readLine()!.split(separator: " ").map { Int($0)! }
    let parent = relation[0]
    let child = relation[1]
    graph[parent].append(child)
    graph[child].append(parent) // 양방향 그래프
}

// BFS
func bfs(start: Int, target: Int) -> Int {
    var queue = [(node: Int, depth: Int)]()
    queue.append((start, 0)) // 시작 노드와 깊이 초기화
    visited[start] = true // 시작 노드 방문 표시
    
    while !queue.isEmpty {
        let current = queue.removeFirst()
        let currentNode = current.node
        let currentDepth = current.depth
        
        // 목표 노드에 도달하면 촌수 반환
        if currentNode == target {
            return currentDepth
        }
        
        // 현재 노드와 연결된 노드 탐색
        for neighbor in graph[currentNode] {
            if !visited[neighbor] {
                visited[neighbor] = true
                queue.append((neighbor, currentDepth + 1))
            }
        }
    }
    
    return -1 // 목표 노드에 도달할 수 없는경우
}

// 결과 출력
let result = bfs(start: target[0], target: target[1])
print(result)
