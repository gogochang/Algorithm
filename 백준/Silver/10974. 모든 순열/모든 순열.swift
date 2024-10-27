let N = Int(readLine()!)!
var stack = [String]()
var result = ""
var visited = Array(repeating: false, count: N + 1)
func dfs(_ depth: Int) {
    if depth == N {
        result += stack.joined(separator: " ") + "\n"
        return
    }
    
    for i in 1...N {
        if !visited[i] {
            visited[i] = true
            stack.append(String(i))
            dfs(depth + 1)
            stack.removeLast()
            visited[i] = false
        }
    }
}

dfs(0)
print(result)
