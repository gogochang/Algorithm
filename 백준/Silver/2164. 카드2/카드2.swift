struct Deque<T> {
    private var front: [T] = []
    private var back: [T] = []
    
    var isEmpty: Bool {
        return front.isEmpty && back.isEmpty
    }
    
    var size: Int {
        return front.count + back.count
    }
    
    mutating func pushFront(_ value: T) {
        front.append(value)
    }
    
    mutating func pushBack(_ value: T) {
        back.append(value)
    }
    
    @discardableResult
    mutating func popFront() -> T? {
        if front.isEmpty {
            front = back.reversed()
            back.removeAll()
        }
        return front.popLast()
    }
    
    @discardableResult
    mutating func popBack() -> T? {
        if back.isEmpty {
            back = front.reversed()
            front.removeAll()
        }
        return back.popLast()
    }
}

let n = Int(readLine()!)!
var deque = Deque<Int>()

for i in 1...n {
    deque.pushBack(i)
}

while deque.size != 1 {
    deque.popFront()
    if let num = deque.popFront() {
        deque.pushBack(num)
    }
}

print(deque.popFront()!)

