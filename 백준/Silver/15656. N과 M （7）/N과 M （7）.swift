let input: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
let N: Int = input[0]
let M: Int = input[1]
let arr: [Int] = readLine()!.split(separator: " ").map { Int($0)! }.sorted()

var stack: [String] = [String]()
var result: String = ""

func backTrack(_ depth: Int) {
    if M == depth {
        result += stack.joined(separator: " ") + "\n"
        return
    }
    
    for i in 0..<N {
        stack.append(String(arr[i]))
        backTrack(depth + 1)
        stack.removeLast()
    }
}

backTrack(0)
print(result)
