let T = Int(readLine()!)!

for _ in 1...T {
    let string = readLine()!
    print("\(string[string.startIndex])\(string[string.index(before: string.endIndex)])")
}