var s = readLine()!
var answer: [String] = []
while !s.isEmpty {
    answer.append(s)
    s.removeFirst()
}

for char in answer.sorted() {
    print(char)
}
