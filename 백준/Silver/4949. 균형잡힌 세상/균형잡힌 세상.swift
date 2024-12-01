struct Stack<T> {
    private var elements: [T] = []
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    var size: Int {
        return elements.count
    }
    
    var last: T? {
        elements.last
    }
    
    mutating func push(_ value: T) {
        elements.append(value)
    }
    
    @discardableResult
    mutating func pop() -> T? {
        elements.popLast()
    }
}

while let input = readLine(), input != "." {
    var stack = Stack<Character>()
    
    for char in input {
        if !["(", ")", "[", "]"].contains(char) {
            continue
        }
        
        if char == ")" && stack.last == "(" {
            stack.pop()
        } else if char == "]" && stack.last == "[" {
            stack.pop()
        } else {
            stack.push(char)
        }
    }
    
    print(stack.isEmpty ? "yes" : "no")
}
