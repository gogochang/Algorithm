let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0]
let M = input[1]
var stack = [Int]()
var result = ""
var targetNum = 0

func backTrack(_ depth: Int) {
    if M == depth {
        result += stack.map { String($0) }.joined(separator: " ") + "\n"
        return
    }
    
    for i in 1...N {
        if targetNum <= i {
            stack.append(i)
            targetNum = i
            backTrack(depth + 1)
            stack.removeLast()
            targetNum = 0
        }
    }
}

backTrack(0)
print(result)
