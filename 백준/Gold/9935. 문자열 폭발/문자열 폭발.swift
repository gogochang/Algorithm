let input = readLine()!
let bomb = readLine()!
let bombLastChar = bomb.last!
let bombLength = bomb.count
var stack = [Character]()

for char in input {
    stack.append(char)
    
    if char == bombLastChar &&
        stack.count >= bombLength {
        if String(stack[(stack.count - bombLength)...]) == bomb {
            stack.removeLast(bombLength)
        }
    }
}

let result = stack.isEmpty ? "FRULA" : String(stack)
print(result)
