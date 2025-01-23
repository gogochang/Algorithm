let n = Int(readLine()!)! // 전체 사람의 수
let target = readLine()!.split(separator: " ").map { Int($0)! }
let m = Int(readLine()!)! // 부모자식 관계의 수

var graph = [[Int]](repeating: [], count: n + 1)
var visited = [Bool](repeating: false, count: n + 1)

for _ in 0..<m {
    let relation = readLine()!.split(separator: " ").map { Int($0)! }
    let parent = relation[0]
    let child = relation[1]
    graph[parent].append(child)
    graph[child].append(parent)
}

func bfs(start: Int, target: Int) -> Int {
    var queue = [(node: Int, depth: Int)]()
    queue.append((start,0))
    visited[start] = true
    
    while !queue.isEmpty {
        let current = queue.removeFirst()
        let currentNode = current.node
        let currentDepth = current.depth
        
        if currentNode == target {
            return currentDepth
        }
        
        
        for neighbor in graph[currentNode] {
            if !visited[neighbor] {
                visited[neighbor] = true
                queue.append((neighbor, currentDepth + 1))
            }
        }
    }
    
    return -1
}

let result = bfs(start: target[0], target: target[1])
print(result)
