
// 입력받기
let numberOfComputers = Int(readLine()!)! // 컴퓨터의 수
let numberOfConnections = Int(readLine()!)! // 연결 수

// 인접 리스트로 그래프 표현
var network: [[Int]] = Array(repeating: [], count: numberOfComputers + 1)

// 그래프 구성
for _ in 0..<numberOfConnections {
    let connection = readLine()!.split(separator: " ").map { Int($0)! }
    let from = connection[0]
    let to = connection[1]
    network[from].append(to)
    network[to].append(from)
}

// 방문 여부를 기록하는 배열
var visited = Array(repeating: false, count: numberOfComputers + 1)

// 감염된 컴퓨터 수 계산
var infectedCount = 0

func dfs(_ node: Int) {
    visited[node] = true
    infectedCount += 1
    for neighbor in network[node] {
        if !visited[neighbor] {
            dfs(neighbor)
        }
    }
}
// 1번 컴퓨터에서 DFS를 시작
dfs(1)

// 1번 컴퓨터 자신은 제외하므로 - 1
print(infectedCount - 1)
