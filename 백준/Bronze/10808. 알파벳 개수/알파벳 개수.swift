let S = readLine()!
var alphabetCount = Array(repeating: 0, count: 26)

for char in S {
  alphabetCount[Int(char.asciiValue!)-97] += 1
}

print(alphabetCount.map { String($0) }.joined(separator: " "))
