let input: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
let N: Int = input[0]
let M: Int = input[1]
let arr: [Int] = readLine()!.split(separator: " ").map { Int($0)! }.sorted()

var stack: [String] = [String]()
var result: String = ""
var targetNum = 0

func backTrack(_ depth: Int) {
    if M == depth {
        result += stack.joined(separator: " ") + "\n"
        return
    }
    
    for i in 0..<N {
        if targetNum <= arr[i] {
            targetNum = arr[i]
            stack.append(String(arr[i]))
            backTrack(depth + 1)
            stack.removeLast()
            targetNum = 0
        }
    }
}

backTrack(0)
print(result)
