let tc = Int(readLine()!)!
var result = ""
for _ in 0..<tc {
    let n = Int(readLine()!)!
    var clothingDict: [String: Int] = [:]
    
    for _ in 0..<n {
        let input = readLine()!.split(separator: " ").map { String($0) }
        clothingDict[input[1],default: 0] += 1
    }
    
    let count = clothingDict.values.reduce(1) { result, count in
        result * (count + 1)
    }

    result += "\(count - 1)\n"
}

print(result)
