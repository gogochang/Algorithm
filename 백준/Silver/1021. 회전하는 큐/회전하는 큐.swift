struct Queue {
    var inbox: [Int] = []
    var outbox: [Int] = []
    
    init(_ inbox: [Int]) {
        self.inbox = inbox
    }
    
    init() {
    }
    
    var isEmpty: Bool {
        return inbox.isEmpty && outbox.isEmpty
    }
    
    var size: Int {
        return inbox.count + outbox.count
    }
    
    mutating func push(_ value: Int) {
        inbox.append(value)
    }
    
    @discardableResult
    mutating func pop() -> Int? {
        if outbox.isEmpty {
            outbox = inbox.reversed()
            inbox.removeAll()
        }
        
        return outbox.removeLast()
    }
    
    mutating func moveLeft(_ count: Int) {
        for _ in 0..<count {
            if outbox.isEmpty {
                outbox = inbox.reversed()
                inbox.removeAll()
            }
            
            inbox.append(outbox.removeLast())
        }
    }
    
    mutating func moveRight(_ count: Int) {
        for _ in 0..<count {
            if inbox.isEmpty {
                inbox = outbox.reversed()
                outbox.removeAll()
            }
            
            outbox.append(inbox.removeLast())
        }
    }
    
    func leftCount(_ targetNum: Int) -> Int {
        if let targetIndex = inbox.firstIndex(of: targetNum) { // 찾는 수가 inbox에 있다.
            return inbox[0..<targetIndex].count + outbox.count
        } else if let targetIndex = outbox.firstIndex(of: targetNum) { // 찾는 수가 outbox에 있다.
            return outbox[targetIndex..<outbox.count-1].count
        }
        
        return 0
    }
    
    func rightCount(_ targetNum: Int) -> Int {
        if let targetIndex = inbox.firstIndex(of: targetNum) { // 찾는 수가 inbox에 있다.
            return inbox[targetIndex...inbox.count-1].count
        } else if let targetIndex = outbox.firstIndex(of: targetNum) { // 찾는 수가 outbox에 있다.
            return outbox[0...targetIndex].count + inbox.count
        }
        return 0
    }
}


let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[0]
var queue: Queue = Queue(Array(1...n))
var mArr: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
var result = 0

for targetNum in mArr {
    let leftCount = queue.leftCount(targetNum)
    let rightCount = queue.rightCount(targetNum)

    if leftCount > rightCount  {
        queue.moveRight(rightCount)
        result += rightCount
    } else {
        queue.moveLeft(leftCount)
        result += leftCount
    }
    
    queue.pop()
}

print(result)
