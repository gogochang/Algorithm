let input: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
let N: Int = input[0]
let M: Int = input[1]
let numbers: [Int] = readLine()!.split(separator: " ").compactMap { Int($0) }.sorted()

var stack: [String] = [String]()
var result: String = ""
var visited = Array(repeating: false, count: N)

func backTrack(_ depth: Int, _ start: Int) {
    if M == depth {
        result += stack.joined(separator: " ") + "\n"
        return
    }
    
    var lastUsed = -1 // 마지막으로 사용한 숫자를 기억
    for i in start..<N {
        if numbers[i] == lastUsed { // 중복된 수열을 피하기 위한 조건
            continue
        }
        
        stack.append(String(numbers[i]))
        backTrack(depth + 1, i + 1) // 다음 depth로 재귀 호출, 다음 수부터 선택
        stack.removeLast()
        lastUsed = numbers[i]
    }
}

backTrack(0, 0)
print(result)
