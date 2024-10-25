let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0]
let M = input[1]
var visited = Array(repeating: false, count: N)
let arr: [Int] = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
var stack = [Int]()
var result = ""
var targetNum = 0

func backTrack(_ depth: Int) {
    if M == depth {
        result += stack.map { String($0) }.joined(separator: " ") + "\n"
        return
    }
    
    for i in 0..<N {
        if !visited[i] && targetNum < arr[i] {
            visited[i] = true
            targetNum = arr[i]
            stack.append(arr[i])
            backTrack(depth + 1)
            stack.removeLast()
            targetNum = 0
            visited[i] = false
        }
    }
}

backTrack(0)
print(result)