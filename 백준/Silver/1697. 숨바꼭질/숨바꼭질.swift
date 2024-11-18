func bfs(N: Int, K: Int) -> Int {
    if N == K {
        return 0
    }
    
    let maxPosition: Int = 100000
    var visited: [Bool] = [Bool](repeating: false, count: maxPosition + 1)
    var queue = [(position: Int, time: Int)]()
    queue.append((N, 0))
    visited[N] = true
    
    while !queue.isEmpty {
        let current = queue.removeFirst()
        let currentPosition = current.position
        let currentTime = current.time
        
        let nextPositions = [
            currentPosition - 1,
            currentPosition + 1,
            currentPosition * 2
        ]
        
        for nextPosition in nextPositions {
            if nextPosition == K {
                return currentTime + 1
            }
            
            if nextPosition >= 0 &&
                nextPosition <= maxPosition &&
                !visited[nextPosition] {
                visited[nextPosition] = true
                queue.append((position: nextPosition, time: currentTime + 1))
            }
        }
    }
    
    return -1
}

let NK = readLine()!.split(separator: " ").map { Int($0)! }
let N = NK[0]
let K = NK[1]
let result = bfs(N: N, K: K)
print(result)
