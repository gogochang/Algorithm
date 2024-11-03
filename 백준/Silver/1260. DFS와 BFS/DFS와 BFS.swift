let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0] // 정점의 개수
let m = input[1] // 간선의 개수
let v = input[2] // 시작할 정점의 번호
var visited = [Bool](repeating: false, count: n + 1)
var graph = [[Int]](repeating: [], count: n + 1)
for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let a = input[0]
    let b = input[1]
    graph[a].append(b)
    graph[b].append(a)
}

graph = graph.map {$0.sorted()}

func dfs(_ node: Int) {
    visited[node] = true
    print(node, terminator: " ")
    
    for nextNode in graph[node] {
        if !visited[nextNode] {
            dfs(nextNode)
        }
    }
}

func bfs(_ node: Int) {
    var queue = [node]
    var index = 0
    visited[node] = true
    while queue.count > index {
        let currentNode = queue[index]
        print(currentNode, terminator: " ")
        
        for nextNode in graph[currentNode] {
            if !visited[nextNode] {
                visited[nextNode] = true
                queue.append(nextNode)
            }
        }
        index += 1
    }
}

dfs(v)
visited = [Bool](repeating: false, count: n + 1)
print()
bfs(v)
