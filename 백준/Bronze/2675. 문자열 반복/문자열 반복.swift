var result: [String] = []

for _ in 1...Int(readLine()!)! {
    let input = readLine()!.split(separator: " ")
    for i in 0..<input[1].count {
        for _ in 0..<Int(input[0])! {
            result.append(input[1].compactMap{String($0)}[i])
        }
    }
    result.append("\n")
}
print(result.joined(separator: ""))