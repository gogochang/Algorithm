let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0]
let M = input[1]

var result = [Int]()
var visited = Array(repeating: false, count: N + 1)

func backtrack(_ depth: Int) {
    if depth == M {
        print(result.map { String($0) }.joined(separator: " "))
        return
    }
    
    for i in 1...N {
        if !visited[i] {
            visited[i] = true
            result.append(i)
            backtrack(depth + 1)
            result.removeLast()
            visited[i] = false
        }
    }
}

backtrack(0)
