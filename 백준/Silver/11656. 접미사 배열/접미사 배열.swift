var s = readLine()!
var answer: [String] = []

for i in s.indices {
    answer.append(String(s[i...]))
}

for suffix in answer.sorted() {
    print(suffix)
}
