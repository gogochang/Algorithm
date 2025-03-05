import Foundation

struct Deque<T> {
    private var leftStack = [T]()
    private var rightStack = [T]()
    
    var isEmpty: Bool { leftStack.isEmpty && rightStack.isEmpty }
    var count: Int { leftStack.count + rightStack.count }
    
    mutating func pushFront(_ x: T) { leftStack.append(x) }
    mutating func pushBack(_ x: T) { rightStack.append(x) }
    
    mutating func popFront() -> T? {
        if leftStack.isEmpty {
            leftStack = rightStack.reversed()
            rightStack.removeAll()
        }
        return leftStack.popLast()
    }
    
    mutating func popBack() -> T? {
        if rightStack.isEmpty {
            rightStack = leftStack.reversed()
            leftStack.removeAll()
        }
        return rightStack.popLast()
    }
    
    func front() -> T? { leftStack.last ?? rightStack.first }
    func back() -> T? { rightStack.last ?? leftStack.first }
}

let n = Int(readLine()!)!
var deque = Deque<Int>()
var result = ""

for _ in 0..<n {
    let command = readLine()!.split(separator: " ")
    switch command[0] {
    case "1": deque.pushFront(Int(command[1])!)
    case "2": deque.pushBack(Int(command[1])!)
    case "3": result += "\(deque.popFront() ?? -1)\n"
    case "4": result += "\(deque.popBack() ?? -1)\n"
    case "5": result += "\(deque.count)\n"
    case "6": result += "\(deque.isEmpty ? 1 : 0)\n"
    case "7": result += "\(deque.front() ?? -1)\n"
    case "8": result += "\(deque.back() ?? -1)\n"
    default: break
    }
}

print(result)
