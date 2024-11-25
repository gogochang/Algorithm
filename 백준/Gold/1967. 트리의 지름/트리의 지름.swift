let n = Int(readLine()!)! // 노드의 개수
var graph: [[(Int, Int)]] = [[(to: Int, weight: Int)]](repeating: [], count: n + 1)
for _ in 1..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let u = input[0]
    let v = input[1]
    let weight = input[2]
    graph[u].append((to: v, weight: weight))
    graph[v].append((to: u, weight: weight))
}


var maxDisctance = 0
var farthesNode = 1

func dfs(_ node: Int, _ weight: Int) {
    
    if weight > maxDisctance {
        maxDisctance = weight
        farthesNode = node
    }
    
    for (nextNode, nextWeight) in graph[node] {
        if !visited[nextNode] {
            visited[nextNode] = true
            dfs(nextNode, weight + nextWeight)
        }
    }
}

// 첫 번째 DFS: 임의의 노드(1번)에서 가장 먼 노드를 찾음
var visited: [Bool] = [Bool](repeating: false, count: n + 1)
visited[1] = true
dfs(1,0)

// 두 번째 DFS: 가장 먼 노드에서 다시 가장 먼 노드를 찾음
visited = [Bool](repeating: false, count: n + 1)
visited[farthesNode] = true
maxDisctance = 0
dfs(farthesNode, 0)

print(maxDisctance)
