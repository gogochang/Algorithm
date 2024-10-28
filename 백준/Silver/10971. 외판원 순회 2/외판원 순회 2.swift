let N = Int(readLine()!)!
var W = [[Int]]()
for _ in 0..<N {
    W.append(readLine()!.split(separator: " ").map { Int($0)! })
}
var visited = Array(repeating: false, count: N)
var result = Int.max
var sum = 0

func dfs(_ depth: Int, _ now: Int, _ start: Int) {
    if N == depth && now == start {
        result =  sum
        return
    }
    
    for i in 0..<N {
        if !visited[i] && W[now][i] > 0{
            visited[i] = true
            sum += W[now][i]
            if sum <= result {
                dfs(depth + 1, i, start)
            }
            sum -= W[now][i]
            visited[i] = false
        }
    }
}

dfs(0, 0, 0)
print(result)