struct Queue<T> {
    private var inbox: [T] = []
    private var outbox: [T] = []
    
    var isEmpty: Bool {
        return inbox.isEmpty && outbox.isEmpty
    }
    
    var size: Int {
        return inbox.count + outbox.count
    }
    
    mutating func push(_ value: T) {
        inbox.append(value) // 뒤에서 추가
    }
    
    @discardableResult
    mutating func pop() -> T? {
        if outbox.isEmpty {
            outbox = inbox.reversed() // inbox의 데이터를 뒤집어 outbox로 이동
            inbox.removeAll()
        }
        return outbox.popLast() // 앞에서 제거
    }
    
    func peek() -> T? {
        return outbox.isEmpty ? inbox.first : outbox.last
    }
}

let n = Int(readLine()!)!
var queue = Queue<Int>()

for i in 1...n {
    queue.push(i)
}

while queue.size != 1 {
    queue.pop()
    if let num = queue.pop() {
        queue.push(num)
    }
}

print(queue.pop()!)

