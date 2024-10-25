let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0]
let M = input[1]
var visited = Array(repeating: false, count: N)
let arr: [Int] = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
var stack = [Int]()
var result = ""

func backTrack(_ depth: Int) {
    if M == depth {
        result += stack.map { String($0) }.joined(separator: " ") + "\n"
        return
    }
    
    for i in 0..<N {
        if !visited[i] {
            visited[i] = true
            stack.append(arr[i])
            backTrack(depth + 1)
            stack.removeLast()
            visited[i] = false
        }
    }
}

backTrack(0)
print(result)
