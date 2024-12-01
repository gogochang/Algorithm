struct Stack<T> {
    var elements: [T] = []

    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    var size: Int {
        return elements.count
    }
    
    mutating func push(_ value: T) {
        elements.append(value)
    }
    
    @discardableResult
    mutating func pop() -> T? {
        elements.popLast()
    }
}

let k = Int(readLine()!)!
var stack = Stack<Int>()

for _ in 0..<k {
    let input = Int(readLine()!)!
    if input == 0 {
        stack.pop()
    } else {
        stack.push(input)
    }
}

print(stack.elements.reduce(0, +))
