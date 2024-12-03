struct MaxHeap {
    private var heap: [Int] = []
    
    init() {
        heap.append(0)
    }
    
    var isEmpty: Bool {
        return heap.count == 1
    }
    
    mutating func insert(_ value: Int) {
        heap.append(value)
        var index = heap.count - 1
        
        while index > 1 && heap[index] > heap [index / 2] {
            heap.swapAt(index, index / 2)
            index = index / 2
        }
    }
    
    mutating func remove() -> Int {
        if isEmpty {
            return 0
        }
        
        let maxValue = heap[1]
        heap[1] = heap[heap.count - 1]
        heap.removeLast()
        
        var index = 1
        while index * 2 < heap.count { // 자식노드가 있냐 없냐 확인
            var childIndex = index * 2
            
            if childIndex + 1 < heap.count && heap[childIndex + 1] > heap[childIndex] {
                childIndex += 1
            }
            
            if heap[index] >= heap[childIndex] {
                break
            }
            
            heap.swapAt(index, childIndex)
            index = childIndex
        }
        return maxValue
    }
}

var heap = MaxHeap()
let n = Int(readLine()!)!
for _ in 0..<n {
    let input = Int(readLine()!)!
    if input == 0 {
        print(heap.remove())
    } else {
        heap.insert(input)
    }
}
