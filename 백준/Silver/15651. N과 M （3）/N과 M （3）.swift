let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0]
let M = input[1]
var stack = [Int]()
var result = ""

func backTrack(_ depth: Int) {
    if depth == M {
        result += stack.map { String($0) }.joined(separator: " ") + "\n"
        return
    }
    
    for i in 1...N {
        stack.append(i)
        backTrack(depth + 1)
        stack.removeLast()
    }
}

backTrack(0)
print(result)
