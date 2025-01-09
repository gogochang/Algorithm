let n = Int(readLine()!)!
var p = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
var result = 0
var results = [Int]()
for i in 0..<p.count {
    result = result + p[i]
    results.append(result)
}
print(results.reduce(0, +))
