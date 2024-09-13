let expression = readLine()!
var result = [Character]()
var stack = [Character]()

func precedence(_ op: Character) -> Int {
    switch op {
    case "+","-":
        return 1
    case "*","/":
        return 2
    case "(":
        return 0
    default:
        return -1
    }
}

for char in expression {
    if char.isLetter {
        result.append(char)
    } else if char == "(" {
        stack.append(char)
    } else if char == ")" {
        // '('가 나올 때 까지 pop
        while let top = stack.last, top != "(" {
            result.append(stack.removeLast())
        }
        
        stack.removeLast() // '('를 pop
    } else { // '+', '-', '*', '/'
        while let top = stack.last,
              precedence(top) >= precedence(char) {
            result.append(stack.removeLast())
        }
        stack.append(char)
    }
}

while !stack.isEmpty {
    result.append(stack.removeLast())
}

print(result.map { String($0)}.joined(separator: ""))
