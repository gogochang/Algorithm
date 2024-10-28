var input = [Int]()

func dfs(_ depth: Int, _ start: Int, _ Arr: [Int], _ stack: inout [Int], _ visited: inout [Bool]) {
    if depth == 6 {
        print(stack.map { String($0) }.joined(separator: " "))
        return
    }
    
    for i in start..<Arr.count {
        if !visited[i] {
            visited[i] = true
            stack.append(Arr[i])
            dfs(depth + 1, i + 1, Arr, &stack, &visited)
            stack.removeLast()
            visited[i] = false
        }
    }
}

while true {
    input = readLine()!.split(separator: " ").map { Int($0)! }
    let K = input[0]
    if K == 0 {
        break
    }
    
    let Arr = Array(input[1...])
    var stack = [Int]()
    var visited = Array(repeating: false, count: K)
    
    dfs(0, 0, Arr, &stack, &visited)
    print()
}
