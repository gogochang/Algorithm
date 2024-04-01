let line = readLine()!
var stack: [Character] = []
var result: [Character] = []

func getPriority(op: Character) -> Int{
    switch op {
    case "+":
        return 1
    case "-":
        return 1
    case "*":
        return 2
    case "/":
        return 2
    case "(":
        return 0
    default:
        break
    }
    return 0
}

for char in line {
  if char.isLetter {
    result.append(char)
    continue
  }
  
  if char == "(" {
    stack.append(char)
  } else if char == ")" {
    
    while true {
      let item = stack.removeLast()
      if item == "(" { break }
      result.append(item)
    }
  } else if stack.isEmpty
              || getPriority(op: char) > getPriority(op: stack.last!) {
    stack.append(char)
  } else {
    while !stack.isEmpty {
      let temp = stack.last!
      if getPriority(op: temp) >= getPriority(op: char) {
        let data = stack.removeLast()
        result.append(data)
      } else {
        break
      }
    }
    stack.append(char)
  }
}

while !stack.isEmpty {
    result.append(stack.removeLast())
}

print(String(result))
