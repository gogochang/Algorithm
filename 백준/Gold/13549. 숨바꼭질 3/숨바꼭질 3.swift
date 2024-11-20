// Queue
struct Queue {
    private var inbox: [Int] = []
    private var outbox: [Int] = []
                              
    mutating func push(_ x: Int) {
        inbox.append(x)
    }
    
    mutating func pop() -> Int? {
        if outbox.isEmpty {
            outbox = inbox.reversed()
            inbox.removeAll()
        }
        return outbox.popLast()
    }
    
    func empty() -> Bool {
        return inbox.isEmpty && outbox.isEmpty
    }
    
    func size() -> Int {
        return inbox.count + outbox.count
    }
}

// BFS
func bfs(_ N: Int, _ K: Int) -> Int {
    
    while !queue.empty() {
        let current = queue.pop()!
        if current == K {
            break
        }
        
        // 순간이동
        let teleport = current * 2
        if teleport <= maxPosition && !visited[teleport] {
            queue.push(teleport)
            visited[teleport] = true
            time[teleport] = time[current]
        }
        
        // 뒤로 이동
        let backward = current - 1
        if backward >= 0 && !visited[backward] {
            queue.push(backward)
            visited[backward] = true
            time[backward] = time[current] + 1
        }
        
        // 앞으로 이동
        let forward = current + 1
        if forward <= maxPosition && !visited[forward] {
            queue.push(forward)
            visited[forward] = true
            time[forward] = time[current] + 1
        }
    }
    
    return time[K]
}

let NK = readLine()!.split(separator: " ").map { Int($0)! }
let N = NK[0]
let K = NK[1]
let maxPosition = 100000

var queue = Queue()
queue.push(N)

var visited = [Bool](repeating: false, count: maxPosition + 1)

var time = [Int](repeating: 0, count: maxPosition + 1)

print(bfs(N,K))
