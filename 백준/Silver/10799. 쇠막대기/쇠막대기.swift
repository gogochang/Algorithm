let input = readLine()!.map {$0}
var stack: [Character] = []
var sum: Int = 0

for i in 0..<input.count {
  if input[i] == "(" {
    stack.append(input[i])
  } else if input[i] == ")" {
    if input[i-1] == "(" {
      stack.removeLast()
      sum += stack.count
    } else {
      stack.removeLast()
      sum += 1
    }
  }
  
}
print(sum)
