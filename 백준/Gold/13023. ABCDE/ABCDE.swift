let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0] // 사람의 수 N
let M = input[1] // 친구 관계의 수 M
var graph = [[Int]](repeating: [Int](), count: N)
for _ in 0..<M {
    let row = readLine()!.split(separator: " ").map { Int($0)! }
    let a = row[0]
    let b = row[1]
    graph[a].append(b)
    graph[b].append(a)
}

var found = false
var ans = 0
var visited = Array(repeating: false, count: N)

func dfs(_ node: Int, _ depth: Int) {
    if depth == 4 { // 주어진 문제의 조건에 만족하는 친구관계가 4개다.
        found = true
        return
    }
    
    visited[node] = true
    
    for neighbor in graph[node] {
        if !visited[neighbor] {
            dfs (neighbor, depth + 1)
            if found { return } // 조건에 충족하면 더 이상 탐색하지 않는다.
        }
    }
    
    visited[node] = false
}

for i in 0..<N {
    if found { break }
    visited = [Bool](repeating: false, count: N)
    dfs(i,0)
}

print(found ? 1 : 0)
