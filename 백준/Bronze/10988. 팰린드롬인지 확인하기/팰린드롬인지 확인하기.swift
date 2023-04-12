while let input = readLine() {
    let word = input.map{$0}
    var result = 1
    for i in 0..<word.count/2 {
        if word[word.startIndex + i] != word[word.index(before: word.endIndex) - i] {
            result = 0
        }
    }
    print(result)
}