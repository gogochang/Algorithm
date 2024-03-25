let N = Int(readLine()!)!
var sequence: [Int] = []
var stack: [Int] = []
var count: Int = 1
var result: [String] = []

(0..<N).forEach { _ in
    sequence.append(Int(readLine()!)!)
}

for i in 0..<sequence.count {
    while count <= sequence[i] {
        stack.append(count)
        result.append("+")
        count += 1
    }
    
    if stack.last == sequence[i] {
        stack.removeLast()
        result.append("-")
    } else {
        result.removeAll()
        print("NO")
        break
    }
}

result.forEach {
    print($0)
}
