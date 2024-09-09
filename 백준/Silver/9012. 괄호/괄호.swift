let n = Int(readLine()!)!

for _ in 0..<n {
    let ps = readLine()!
    var stack: [Character] = []
    for s in ps {
        if stack.isEmpty {
            stack.append(s)
            continue
        }
        
        if s == ")" && stack.last! == "(" {
            stack.removeLast()
        } else {
            stack.append(s)
        }
    }
    print(stack.isEmpty ? "YES" : "NO")
}
