let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0]
let M = input[1]
let numbers: [Int] = readLine()!.split(separator: " ").compactMap { Int($0) }.sorted()
var stack = [String]()
var result = ""
var visited = Array(repeating: false, count: N)

func backtrack(_ depth: Int) {
    if M == depth {
        result += stack.joined(separator: " ") + "\n"
        return
    }
    
    var lastUsed = -1 // 마지막으로 사용한 숫자를 저장
    for i in 0..<N {
        if numbers[i] == lastUsed {
            continue
        }
        
        if !visited[i] {
            visited[i] = true
            stack.append(String(numbers[i]))
            backtrack(depth + 1)
            stack.removeLast()
            visited[i] = false
            lastUsed = numbers[i]
        }
    }
}

backtrack(0)
print(result)