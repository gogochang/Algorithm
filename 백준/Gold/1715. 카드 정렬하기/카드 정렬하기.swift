struct PriorityQueue<T: Comparable> {
    private var heap: [T] = []
    private let ordered: (T, T) -> Bool
    
    init(ascending: Bool = true) {
        self.ordered = ascending ? (<) : (>)
    }
    
    var isEmpty: Bool {
        return heap.isEmpty
    }
    
    var count: Int {
        return heap.count
    }
    
    mutating func push(_ element: T) {
        heap.append(element)
        siftUp(from: heap.count - 1)
    }
    
    mutating func pop() -> T? {
        guard !heap.isEmpty else { return nil }
        if heap.count == 1 {
            return heap.removeLast()
        }
        let top = heap[0]
        heap[0] = heap.removeLast()
        siftDown(from:0)
        return top
    }
    
    private mutating func siftUp(from index: Int) {
        var child = index
        var parent = (child - 1) / 2
        while child > 0 && ordered(heap[child], heap[parent]) {
            heap.swapAt(child, parent)
            child = parent
            parent = (child - 1) / 2
        }
    }
    
    private mutating func siftDown(from index: Int) {
        var parent = index
        let count = heap.count
        while true {
            let left = 2 * parent + 1
            let right = left + 1
            var candidate = parent
            if left < count && ordered(heap[left], heap[candidate]) {
                candidate = left
            }
            
            if right < count && ordered(heap[right], heap[candidate]) {
                candidate = right
            }
            
            if candidate == parent {
                return
            }
            
            heap.swapAt(parent, candidate)
            parent = candidate
        }
    }
}

func minCardSorting(_ cards: [Int]) -> Int {
    var priorityQueue = PriorityQueue<Int>(ascending: true)
    for card in cards {
        priorityQueue.push(card)
    }
    
    var totalCount = 0
    
    while priorityQueue.count > 1 {
        let first = priorityQueue.pop()!
        let second = priorityQueue.pop()!
        let sum = first + second
        totalCount += sum
        priorityQueue.push(sum)
    }
    
    return totalCount
}

let n = Int(readLine()!)!
var cards: [Int] = []
for _ in 0..<n {
    cards.append(Int(readLine()!)!)
}

print(minCardSorting(cards))
