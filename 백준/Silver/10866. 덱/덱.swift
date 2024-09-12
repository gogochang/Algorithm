enum Command {
    case push_front, push_back, pop_front, pop_back, size, empty, front, back
}

struct Deque {
    private var deque: [Int] = []
    
    mutating func push_front(_ element: Int) {
        deque.insert(element, at: 0)
    }
    
    mutating func push_back(_ element: Int) {
        deque.append(element)
    }
    
    mutating func pop_front() -> Int {
        return deque.isEmpty ? -1 : deque.removeFirst()
    }
    
    mutating func pop_back() -> Int {
        return deque.isEmpty ? -1 : deque.removeLast()
    }
    
    var size: Int {
        deque.count
    }
    
    var empty: Int {
        deque.isEmpty ? 1 : 0
    }
    
    var front: Int {
        deque.first ?? -1
    }
    
    var back: Int {
        deque.last ?? -1
    }
}

let n = Int(readLine()!)!
var deque = Deque()

for _ in 0..<n {
    let input = readLine()!.split(separator: " ")
    switch input[0] {
    case "push_front":
        deque.push_front(Int(input[1])!)
    case "push_back":
        deque.push_back(Int(input[1])!)
    case "pop_front":
        print(deque.pop_front())
    case "pop_back":
        print(deque.pop_back())
    case "size":
        print(deque.size)
    case "empty":
        print(deque.empty)
    case "front":
        print(deque.front)
    case "back":
        print(deque.back)
    default:
        break
    }
}
