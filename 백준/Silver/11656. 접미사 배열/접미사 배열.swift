var s = readLine()!
var answer: [String] = []
while !s.isEmpty {
    answer.append(s)
    s.removeFirst()
}

answer.sort()
for char in answer {
    print(char)
}
