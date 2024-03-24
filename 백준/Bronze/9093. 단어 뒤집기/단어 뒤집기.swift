let T = Int(readLine()!)!
var result: [String] = []

(0..<T).forEach { _ in
    let sentence = readLine()!.split(separator: " ").map { $0 }
    var reversedSentence: String = ""
    sentence.forEach {
        reversedSentence += String($0.reversed())+" "
    }
    result.append(reversedSentence)
}

result.forEach {
    print($0)
}
