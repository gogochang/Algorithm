// 입력 처리
let n = Int(readLine()!)!
var graph: [[Int]] = []
for _ in 0..<n {
    let row = readLine()!.split(separator: " ").map { Int($0)! }
    graph.append(row)
}

// 결과를 담을 배열
var result: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)

// DFS
func dfs(start: Int, current: Int, visited: inout[Bool]) {
    for next in 0..<n {
        if graph[current][next] == 1 && !visited[next] {
            visited[next] = true
            result[start][next] = 1
            dfs(start: start, current: next, visited: &visited)
        }
    }
}

for i in 0..<n {
    var visited: [Bool] = Array(repeating: false, count: n)
    dfs(start: i, current: i, visited: &visited)
}

// 결과 출력
for row in result {
    print(row.map { String($0) }.joined(separator: " "))
}
