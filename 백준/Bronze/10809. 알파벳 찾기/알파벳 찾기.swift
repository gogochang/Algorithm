let inputString = readLine()!.map{$0}
var result = Array(repeating: -1, count: 26)

for i in 0..<26 {
    if let test = inputString.firstIndex(of: Character(UnicodeScalar(i + 97)!)) {
        result[i] = test
    }
}
print(result.map{ String($0) }.joined(separator: " "))
