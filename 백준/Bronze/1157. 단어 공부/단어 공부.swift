var charCounts: [Character: Int] = [:]

while let input = readLine() {
    for char in input.uppercased() {
        charCounts[char, default: 0] += 1
    }
    if let maxKeyValue = charCounts.max(by: {$0.value < $1.value}) {
        let maxKeys = charCounts.filter{ $0.value == maxKeyValue.value }.keys
        if maxKeys.count > 1 {
            print("?")
        } else {
            print(maxKeyValue.key)
        }
    }
}