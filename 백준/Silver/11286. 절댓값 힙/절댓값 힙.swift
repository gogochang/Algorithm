struct Heap<T> {
    private var elements: [T] = []
    private let sortFunction: (T, T) -> Bool
    
    init(sort: @escaping (T, T) -> Bool) {
        self.sortFunction = sort
    }
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    var size: Int {
        return elements.count
    }
    
    mutating func insert(_ value: T) {
        elements.append(value)
        shiftUp(from: elements.count - 1)
    }
    
    mutating func remove() -> T? {
        guard !elements.isEmpty else { return nil }
        if elements.count == 1 {
            return elements.removeFirst()
        } else {
            let root = elements[0]
            elements[0] = elements.removeLast()
            shiftDown(from: 0)
            return root
        }
    }
    
    private mutating func shiftUp(from index: Int) {
        var child = index
        let childValue = elements[child]
        var parent = (child - 1) / 2
        
        while child > 0 && sortFunction(childValue, elements[parent]) {
            elements.swapAt(child, parent)
            child = parent
            parent = (child - 1) / 2
        }
    }
    
    private mutating func shiftDown(from index: Int) {
        let count = elements.count
        var parent = index
        
        while true {
            let left = parent * 2 + 1
            let right = left + 1
            var candidate = parent
            
            if left < count && sortFunction(elements[left], elements[candidate]) {
                candidate = left
            }
            
            if right < count && sortFunction(elements[right], elements[candidate]) {
                candidate = right
            }
            
            if candidate == parent { break }
            
            elements.swapAt(parent, candidate)
            parent = candidate
        }
    }
}

var heap = Heap<Int> {
    if abs($0) < abs($1) {
        return true
    } else if abs($0) == abs($1) {
        return $0 < $1
    } else {
        return false
    }
}

let n = Int(String(readLine()!))!
var result = ""
for _ in 0..<n {
    let input = Int(readLine()!)!
    if input == 0 {
        result += "\(heap.remove() ?? 0)\n"
    } else {
        heap.insert(input)
    }
}
print(result)
