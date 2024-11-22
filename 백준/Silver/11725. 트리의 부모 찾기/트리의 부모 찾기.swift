//
let N = Int(readLine()!)!

var graph = [[Int]](repeating: [], count: N + 1)
for _ in 1..<N {
    let edge = readLine()!.split(separator: " ").map { Int($0)! }
    let u = edge[0]
    let v = edge[1]
    graph[u].append(v)
    graph[v].append(u)
}

var parents = [Int](repeating: -1, count: N + 1)

func dfs(_ node: Int) {
    
    for neighbor in graph[node] {
        if parents[neighbor] == -1 {
            parents[neighbor] = node
            dfs(neighbor)
        }
    }
}

dfs(1)
parents[2...].forEach {
    print($0)
}



