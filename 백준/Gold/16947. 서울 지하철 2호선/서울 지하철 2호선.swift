let n = Int(readLine()!)!
var graph = [[Int]](repeating: [], count: n + 1)
for _ in 0..<n {
    let row = readLine()!.split(separator: " ").map { Int($0)! }
    let u = row[0]
    let v = row[1]
    graph[u].append(v)
    graph[v].append(u)
}

var visited: [Bool] = [Bool](repeating: false, count: n + 1)
var isCycleNode: [Bool] = [Bool](repeating: false, count: n + 1)
var result: [Int] = [Int](repeating: 0, count: n + 1)

// dfs를 사용하여 순환선을 확인합니다
func dfs(_ depth: Int, _ startNode: Int, _ currentNode: Int) {
    if depth >= 2 && // 순환선이 만들어지기 위한 최소 길이 조건 확인
        startNode == currentNode { // 시작했던 노드까지 한바퀴 순환했는지 조건 확인
        isCycleNode[currentNode] = true
        return
    }
    
    visited[currentNode] = true // 현재 노드 방문 처리
    
    for neighbor in graph[currentNode] {
        if !visited[neighbor] { // 현재 노드의 인접노드가 방문한적이 없으면,
            dfs(depth + 1, startNode, neighbor)
        } else { // 현재 노드의 인접노드가 방문한적이 있다면,
            if depth >= 2 && startNode == neighbor {
                dfs(depth, startNode, neighbor)
            }
        }
    }
}

// dfs 실행
for i in 1...n {
    visited = [Bool](repeating: false, count: n + 1)
    dfs(0, i, i)
}


for i in 1...n {
    if !isCycleNode[i] {
        result[i] = bfs(i)
    } else {
        result[i] = 0
    }
}

func bfs(_ x: Int) -> Int {
    var visited = [Bool](repeating: false, count: n + 1)
    var queue = [(Int, Int)]()
    queue.append((x,0))
    
    while !queue.isEmpty {
        let node = queue.removeFirst()
        if isCycleNode[node.0] { // 순환선 확인
            return node.1
        }
        
        for i in graph[node.0] {
            if !visited[i] {
                queue.append((i, node.1 + 1))
                visited[i] = true
            }
        }
    }
    return 0
}

result.removeFirst()
result.forEach {
    print($0, terminator: " ")
}
