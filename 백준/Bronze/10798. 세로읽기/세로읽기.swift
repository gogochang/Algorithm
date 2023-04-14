var result: [[Character]] = []

for _ in 0..<5 {
    let array = Array(readLine()!)
    result.append(array)
}

for i in 0..<15 {
    for j in 0..<5 {
        if i < result[j].count {
            print(result[j][i],terminator: "")
        }
    }
}
