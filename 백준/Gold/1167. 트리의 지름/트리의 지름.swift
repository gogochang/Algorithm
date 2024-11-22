import Foundation

let n = Int(readLine()!)!
var graph = [[(Int, Int)]](repeating: [], count: n + 1)
var visited = [Bool](repeating: false, count: n + 1)
var farthesNode = 0
var maxDistance = 0

// 그래프 구성
for _ in 1...n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let from = input[0]
    for i in stride(from: 1, to: input.count - 1, by: 2) {
        let to = input[i]
        let cost = input[i + 1]
        graph[from].append((to, cost))
    }
}

//dfs
func dfs(node: Int, distance: Int) {
    visited[node] = true
    
    // 최대 거리 갱신
    if distance > maxDistance {
        maxDistance = distance
        farthesNode = node
    }
    
    // 인접 노드 탐색
    for (neighbor, cost) in graph[node] {
        if !visited[neighbor] {
            dfs(node: neighbor, distance: distance + cost)
        }
    }
}

// 첫 번째 DFS : 임의의 노드(1번)에서 가장 먼 노드를 찾음
dfs(node: 1, distance: 0)

// 두 번째 DFS: 첫 번째 DFS에서 찾은 노드에서 가장 먼 노드까지 거리 계산
visited = [Bool](repeating: false, count: n + 1)
maxDistance = 0
dfs(node: farthesNode,  distance: 0)

// 결과 출력
print(maxDistance)
