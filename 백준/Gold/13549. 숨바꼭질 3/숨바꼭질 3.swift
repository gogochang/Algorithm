struct Queue {
    var que: [Int] = []
    mutating func push(_ x: Int) {
        que.append(x)
    }
    mutating func pop() -> Int {
        que.reverse()
        if let a = que.popLast() {
            que.reverse()
            return a
        }
        return 0
    }
    func empty() -> Bool {
        return que.isEmpty
    }
    func size() -> Int {
        return que.count
    }
}

func bfs(_ N: Int, _ K: Int) -> Int {
    var queue = Queue()
    queue.push(N)

    var visited: [Bool] = Array(repeating: false, count: 100002)
    var depth: [Int] = Array(repeating: 0, count: 100002)

    while !queue.empty() {
        let data = queue.pop()
        if data == K {  // 해당하는 값 찾으면 종료
            break
        }
        if data * 2 < 100001 && !visited[data * 2] {    // *2 한 값이 범위 안에 들어오면 큐에 추가 및 방문, depth 결정
            queue.push(data * 2)
            visited[data * 2] = true
            depth[data * 2] = depth[data]
        }
        if data - 1 >= 0 && !visited[data - 1] {    // -1 한 값이 범위 안에 들어오면 큐에 추가 및 방문, depth 결정
            queue.push(data - 1)
            visited[data - 1] = true
            depth[data - 1] = depth[data] + 1
        }
        if data + 1 < 100001 && !visited[data + 1] {    // +1 한 값이 범위 안에 들어오면 큐에 추가 및 방문, depth 결정
            queue.push(data + 1)
            visited[data + 1] = true
            depth[data + 1] = depth[data] + 1
        }

    }
    return depth[K]
}

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (N, K) = (input[0], input[1])
let result = bfs(N, K)
print(result)
