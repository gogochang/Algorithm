let n = Int(readLine()!)!
let heights = readLine()!.split(separator: " ").map { Int($0)! }
var results = Array(repeating: 0, count: n)
var stack: [(Int,Int)] = [] // (탑의 위치, 탑의 높이)

for (index, height) in heights.enumerated() {
    
    // 현재 탑보다 작은 탑은 삭제
    while !stack.isEmpty && stack.last!.1 < height {
        stack.removeLast()
    }
    
    if let last = stack.last {
        results[index] = last.0 + 1
    }
    
    stack.append((index, height))
}

print(results.map { String($0) }.joined(separator: " "))