let N = Int(readLine()!)!
let Arr = readLine()!.split(separator: " ").map { Int($0)! }
var stack = [Int]()
var result = 0
var visited = Array(repeating: false, count: N)

func dfs(_ depth: Int) {
    // depth가 배열의 길이 N에 도달하면, 결과값 계산
    if depth == N {
        var currentSum = 0
        for i in 0..<stack.count - 1 {
            currentSum += abs(stack[i] - stack[i + 1])
        }
        result = max(result, currentSum)
        return
    }
    
    // 모든 인덱스를 방문하며 탐색
    for i in 0..<N {
        if !visited[i] {
            visited[i] = true
            stack.append(Arr[i])
            dfs(depth + 1)
            stack.removeLast()
            visited[i] = false
        }
    }
}

dfs(0)
print(result)
