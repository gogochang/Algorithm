let n = Int(readLine()!)!
var current = 1
var stack: [Int] = []
var answer: [String] = []

for _ in 0..<n {
    let inputNum = Int(readLine()!)!
    
    while current <= inputNum {
        stack.append(current)
        answer.append("+")
        current += 1
    }
    
    if stack.last == inputNum {
        answer.append("-")
        stack.removeLast()
    } else {
        answer = ["NO"]
        break
    }
    
}

answer.forEach { print($0) }
