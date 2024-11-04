let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0] // 정점의 개수 N
let m = input[1] // 간선의 개수 m
var graph = [[Int]](repeating: [], count: n + 1)
var visited = [Bool](repeating: false, count: n + 1)
for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let u = input[0]
    let v = input[1]
    graph[u].append(v)
    graph[v].append(u)
}

func dfs(_ node: Int) {
    visited[node] = true
    for neighbor in graph[node] {
        if !visited[neighbor] {
            dfs(neighbor)
        }
    }
}

// 연결 요소의 개수를 세기 위한 변수
var componentCount = 0

// 모든 정점을 순회하며 방문하지 않은 정점에서 DFS를 시작합니다.
for i in 1...n {
    if !visited[i] {
        componentCount += 1
        dfs(i)
    }
}

print(componentCount)
