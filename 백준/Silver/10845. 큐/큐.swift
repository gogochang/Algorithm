enum Command: String {
    case push, pop, size, empty, front, back
}

struct Queue {
    var queue: [Int] = []
    
    mutating func push(_ element: Int) {
        queue.append(element)
    }
    
    mutating func pop() -> Int {
        if queue.isEmpty {
            return -1
        }
        return queue.removeFirst()
    }
    
    var size: Int {
        queue.count
    }
    
    var empty: Int {
        queue.isEmpty ? 1 : 0
    }
    
    var front: Int {
        queue.first ?? -1
    }
    
    var back: Int {
        queue.last ?? -1
    }
}

let n = Int(readLine()!)!
var queue: Queue = Queue()
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { String($0) }
    let command = Command(rawValue: input[0])!
    switch command {
    case .push:
        queue.push(Int(input[1])!)
    case .pop:
        print(queue.pop())
    case .size:
        print(queue.size)
    case .empty:
        print(queue.empty)
    case .front:
        print(queue.front)
    case .back:
        print(queue.back)
    }
}
