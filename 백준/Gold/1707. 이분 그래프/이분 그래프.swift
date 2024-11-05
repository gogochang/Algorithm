let K = Int(readLine()!)! // 테스트 케이스 개수 K

for _ in 0..<K {
    let VE = readLine()!.split(separator: " ").map { Int($0)! }
    let V = VE[0] // 정점의 개수 V
    let E = VE[1] // 간선의 개수 E
    var graph = [[Int]](repeating: [], count: V + 1)
    var colors = [Int](repeating: 0, count: V + 1) // 0: 미방문, 1: 색상 1, -1: 색상 -1
    var isBipartite = true
    
    for _ in 0..<E {
        let UV = readLine()!.split(separator: " ").map { Int($0)! }
        let U = UV[0]
        let V = UV[1]
        
        graph[U].append(V)
        graph[V].append(U)
    }
    
    // DFS 함수 정의
    func dfs(_ node: Int, _ color: Int) {
        colors[node] = color
        for neighbor in graph[node] {
            if colors[neighbor] == 0 {
                // 인접 노드가 미방문 상태일 경우 반대 색상으로 칠하고 DFS 재귀 호출
                dfs(neighbor, -color)
            } else if colors[neighbor] == color {
                // 인접 노드가 같은 색상으로 이미 색칠되어 있다면 이분 그래프가 아니다.
                isBipartite = false
                return
            }
        }
    }
    
    for i in 1...V {
        if colors[i] == 0 { // 방문하지 않은 노드에 대해 DFS 호출
            dfs(i, 1)
            if !isBipartite {
                break
            }
        }
    }
    
    print(isBipartite ? "YES" : "NO")
}
