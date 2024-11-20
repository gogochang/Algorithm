struct Queue {
    private var inbox: [Int] = []
    private var outbox: [Int] = []
    
    mutating func push(_ value: Int) {
        inbox.append(value)
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
}

let NK = readLine()!.split(separator: " ").map { Int($0)! }
let N = NK[0]
let K = NK[1]
let maxPosition = 100000

var queue = Queue()
var visited = [Bool](repeating: false, count: maxPosition + 1)

if N == K {
    print(0)
} else {
    queue.push(N)
    visited[N] = true

    var time = [Int](repeating: 0, count: maxPosition + 1)

    while !queue.empty() {
        let current = queue.pop()!
        
        // 순간이동
        let teleport = current * 2
        if teleport <= maxPosition && !visited[teleport] {
            visited[teleport] = true
            time[teleport] = time[current] + 1
            queue.push(teleport)
        }
        
        // 앞으로 이동
        let forward = current + 1
        if forward <= maxPosition && !visited[forward] {
            visited[forward] = true
            time[forward] = time[current] + 1
            queue.push(forward)
        }
        
        // 뒤로 이동
        let backward = current - 1
        if backward >= 0 && !visited[backward] {
            visited[backward] = true
            time[backward] = time[current] + 1
            queue.push(backward)
        }

        // 목표에 도달한 경우 탐색 종료
        if time[K] > 0 {
            print(time[K])
            break
        }
    }
}
