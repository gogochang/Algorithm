let n = Int(readLine()!)!
var results: [String] = []
for _ in 0..<n {
    let inputs = readLine()!.split(separator: " ").map { String($0) }
    var result: String = ""
    for input in inputs {
        result.append(String(input.reversed()) + " ")
    }
    results.append(result)
}

results.forEach {
    print($0)
}
